include innovation-lab/Makefile.inc
include innovation-lab/config/gatk.inc
include innovation-lab/config/align.inc

LOGDIR ?= log/bwa_split.$(NOW)

FASTQ_SPLIT = 500
FASTQ_SEQ = $(shell seq 1 $(FASTQ_SPLIT))

bwa_split : $(foreach sample,$(SAMPLES),bwamem/$(sample)/$(sample)_R1.fastq.gz) \
	    $(foreach sample,$(SAMPLES),bwamem/$(sample)/$(sample)_R2.fastq.gz) \
	    $(foreach sample,$(SAMPLES),bwamem/$(sample)/$(sample)_R1--$(FASTQ_SPLIT).fastq.gz) \
	    $(foreach sample,$(SAMPLES),bwamem/$(sample)/$(sample)_R2--$(FASTQ_SPLIT).fastq.gz) \
	    $(foreach sample,$(SAMPLES), \
		  	$(foreach n,$(FASTQ_SEQ),bwamem/$(sample)/$(sample)_aln--$(n).bam)) \
	    $(foreach sample,$(SAMPLES), \
		  	$(foreach n,$(FASTQ_SEQ),bwamem/$(sample)/$(sample)_aln_srt--$(n).bam))
	    
BWAMEM_THREADS = 12
BWAMEM_MEM_PER_THREAD = 2G
BWA_ALN_OPTS ?= -M

SAMTOOLS_THREADS = 8
SAMTOOLS_MEM_THREAD = 2G

GATK_THREADS = 8
GATK_MEM_THREAD = 2G

define merge-fastq
bwamem/$1/$1_R1.fastq.gz : $$(foreach split,$2,$$(word 1, $$(fq.$$(split))))
	$$(call RUN,-c -n 1 -s 4G -m 6G -w 72:00:00,"zcat $$(^) | gzip -c > $$(@)")
	
bwamem/$1/$1_R2.fastq.gz : $$(foreach split,$2,$$(word 2, $$(fq.$$(split))))
	$$(call RUN,-c -n 1 -s 4G -m 6G -w 72:00:00,"zcat $$(^) | gzip -c > $$(@)")
endef
$(foreach sample,$(SAMPLES),\
		$(eval $(call merge-fastq,$(sample),$(split.$(sample)))))
		

define split-fastq
bwamem/$1/$1_R1--$(FASTQ_SPLIT).fastq.gz : bwamem/$1/$1_R1.fastq.gz
	$$(call RUN,-c -n 12 -s 1G -m 2G -v $(FASTQ_SPLITTER_ENV),"set -o pipefail && \
								   $(SCRIPTS_DIR)/fastq_tools/split_fastq.sh \
								   $$(FASTQ_SPLIT) \
								   $$(<) \
								   bwamem/$1/$1 \
								   R1 \
								   -t 12")

bwamem/$1/$1_R2--$(FASTQ_SPLIT).fastq.gz : bwamem/$1/$1_R2.fastq.gz
	$$(call RUN,-c -n 12 -s 1G -m 2G -v $(FASTQ_SPLITTER_ENV),"set -o pipefail && \
								   $(SCRIPTS_DIR)/fastq_tools/split_fastq.sh \
								   $$(FASTQ_SPLIT) \
								   $$(<) \
								   bwamem/$1/$1 \
								   R2 \
								   -t 12")
								   
endef
$(foreach sample,$(SAMPLES),\
	$(eval $(call split-fastq,$(sample))))

define fastq-2bam
bwamem/$1/$1_aln--$2.bam : bwamem/$1/$1_R1--$(FASTQ_SPLIT).fastq.gz bwamem/$1/$1_R2--$(FASTQ_SPLIT).fastq.gz
	$$(call RUN,-c -n $(BWAMEM_THREADS) -s 1G -m $(BWAMEM_MEM_PER_THREAD),"set -o pipefail && \
									       $$(BWA) mem -p $$(BWA_ALN_OPTS) -t $$(BWAMEM_THREADS) $$(REF_FASTA) \
									       bwamem/$1/$1_R1--$2.fastq.gz bwamem/$1/$1_R2--$2.fastq.gz | \
									       $$(SAMTOOLS) view -bhS - > $$(@)")
									       
bwamem/$1/$1_aln_srt--$2.bam : bwamem/$1/$1_aln--$2.bam
	$$(call RUN,-c -n $(SAMTOOLS_THREADS) -s 1G -m $(SAMTOOLS_MEM_THREAD),"set -o pipefail && \
									       $$(SAMTOOLS) sort $$(<) -o $$(@)")

endef
$(foreach sample,$(SAMPLES), \
	$(foreach n,$(FASTQ_SEQ), \
		$(eval $(call fastq-2bam,$(sample),$(n)))))

..DUMMY := $(shell mkdir -p version; \
	     $(BWA) &> version/tmp.txt; \
	     head -3 version/tmp.txt | tail -2 > version/bwa_split.txt; \
	     rm version/tmp.txt; \
	     $(SAMTOOLS) --version >> version/bwa_split.txt; \
	     echo "gatk3" >> version/bwa_split.txt; \
	     $(GATK) --version >> version/bwa_split.txt; \
	     echo "picard" >> version/bwa_split.txt; \
	     $(PICARD) MarkDuplicates --version &>> version/bwa_split.txt)
.SECONDARY:
.DELETE_ON_ERROR:
.PHONY: bwa_split