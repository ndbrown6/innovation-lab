include innovation-lab/Makefile.inc
include innovation-lab/config/fgbio.inc
include innovation-lab/config/gatk.inc
include innovation-lab/genome_inc/b37.inc
include innovation-lab/config/waltz.inc

LOGDIR ?= log/fgbio_prism.$(NOW)

fgbio_prism : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_R1.fastq.gz) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_fq.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_fq_srt.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl.fastq.gz) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD.intervals) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX.grp) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX_BR.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX_BR__grp.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX_BR__grp_DC.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX_BR__grp_DC.duplex_umi_counts.txt) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.intervals) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR.bam) \
	      $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam) \
	      $(foreach sample,$(SAMPLES),bam/$(sample)_cl_aln_srt_MD_IR_FX_BR.bam) \
	      $(foreach sample,$(SAMPLES),bam/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam) \
	      $(foreach sample,$(SAMPLES),bam/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam) \
	      $(foreach sample,$(SAMPLES),bam/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.idx_stats.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.aln_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.insert_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.oxog_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.hs_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.gc_metrics_summary.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR-pileup.txt.gz) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.idx_stats.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.aln_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.insert_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.oxog_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.hs_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.gc_metrics_summary.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX-pileup.txt.gz) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.idx_stats.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.aln_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.insert_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.oxog_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.hs_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.gc_metrics_summary.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX-pileup.txt.gz) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.idx_stats.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.aln_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.insert_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.oxog_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.hs_metrics.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.gc_metrics_summary.txt) \
	      $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX-pileup.txt.gz) \
	      summary/umi_counts.txt \
	      summary/umi_duplex_counts.txt \
	      summary/umi_fixed_counts.txt \
	      summary/umi_fixed_duplex_counts.txt \
	      summary/idx_metrics.txt \
	      summary/aln_metrics.txt \
	      summary/insert_metrics.txt \
	      summary/oxog_metrics.txt \
	      summary/hs_metrics.txt \
	      summary/gc_metrics.txt \
	      summary/all_family_sizes.txt \
	      summary/duplex_family_sizes.txt \
	      summary/duplex_yield_metrics.txt
				 
BWAMEM_THREADS = 12
BWAMEM_MEM_PER_THREAD = 2G

SAMTOOLS_THREADS = 8
SAMTOOLS_MEM_THREAD = 2G

GATK_THREADS = 8
GATK_MEM_THREAD = 2G

UMI_LIST = $(HOME)/share/lib/resource_files/NEB_Prism_UMIs.txt
TARGETS_LIST ?= $(HOME)/share/lib/resource_files/MSK-ACCESS-v1_0-probe-A.sorted.list

MIN_MAPQ ?= 20
TARGETS_BED ?= $(HOME)/share/lib/bed_files/MSK-ACCESS-v1_0-probe-A.sorted.bed

define copy-fastq
fgbio/$1/$1_R1.fastq.gz : $3
	$$(call RUN,-c -n 1 -s 2G -m 4G,"set -o pipefail && \
					 mkdir -p fgbio/$1 && \
					 $(RSCRIPT) $(SCRIPTS_DIR)/fastq_tools/copy_fastq.R \
					 --sample_name $1 \
					 --directory_name fgbio \
					 --fastq_files '$$^'")

endef
$(foreach ss,$(SPLIT_SAMPLES),\
	$(if $(fq.$(ss)),$(eval $(call copy-fastq,$(split.$(ss)),$(ss),$(fq.$(ss))))))

define fastq-2-bam
fgbio/$1/$1_fq.bam : fgbio/$1/$1_R1.fastq.gz
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,8G) \
					  FastqToBam \
					  --input fgbio/$1/$1_R1.fastq.gz fgbio/$1/$1_R2.fastq.gz \
					  --read-structures 8M+T 8M+T \
					  --output $$(@) \
					  --sample $1 \
					  --library $1 \
					  --platform illumina \
					  --platform-unit NA")

endef
$(foreach sample,$(SAMPLES),\
	$(eval $(call fastq-2-bam,$(sample))))
	
define merge-bams
fgbio/$1/$1_fq_srt.bam : fgbio/$1/$1_fq.bam
	$$(call RUN,-c -n 1 -s 24G -m 36G,"set -o pipefail && \
					   $$(SORT_SAM) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   SORT_ORDER=queryname")

fgbio/$1/$1_cl.fastq.gz : fgbio/$1/$1_fq_srt.bam
	$$(call RUN,-c -n 1 -s 24G -m 36G,"set -o pipefail && \
					   $$(MARK_ADAPTERS) \
					   INPUT=$$(<) \
					   OUTPUT=/dev/stdout \
					   METRICS=fgbio/$1/$1_adapter-metrics.txt | \
					   $$(SAM_TO_FASTQ) \
					   INPUT=/dev/stdin \
					   FASTQ=$$(@) \
					   INTERLEAVE=true \
					   CLIPPING_ATTRIBUTE=XT \
					   CLIPPING_ACTION=X \
					   CLIPPING_MIN_LENGTH=25")

fgbio/$1/$1_cl_aln_srt.bam : fgbio/$1/$1_cl.fastq.gz fgbio/$1/$1_fq_srt.bam
	$$(call RUN,-c -n $(BWAMEM_THREADS) -s 1G -m $(BWAMEM_MEM_PER_THREAD),"set -o pipefail && \
									       $$(BWA) mem -p -t $$(BWAMEM_THREADS) $$(REF_FASTA) $$(<) | \
									       $$(MERGE_ALIGNMENTS) \
									       UNMAPPED=$$(<<) \
									       ALIGNED=/dev/stdin \
									       OUTPUT=$$(@) \
									       REFERENCE_SEQUENCE=$$(REF_FASTA) \
									       SORT_ORDER=coordinate \
									       MAX_GAPS=-1 \
									       ORIENTATIONS=FR")

fgbio/$1/$1_cl_aln_srt_MD.bam : fgbio/$1/$1_cl_aln_srt.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(MARK_DUP) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@) \
					    METRICS_FILE=fgbio/$1/$1_cl_aln_srt.txt \
					    REMOVE_DUPLICATES=false \
					    ASSUME_SORTED=true && \
					    $$(SAMTOOLS) index $$(@) && \
					    cp fgbio/$1/$1_cl_aln_srt_MD.bam.bai fgbio/$1/$1_cl_aln_srt_MD.bai")
									  	
fgbio/$1/$1_cl_aln_srt_MD.intervals : fgbio/$1/$1_cl_aln_srt_MD.bam
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD) -v $(GATK_ENV),"set -o pipefail && \
										      $$(call GATK_CMD,16G) \
										      -T RealignerTargetCreator \
										      -I $$(^) \
										      -nt $$(GATK_THREADS) \
										      -R $$(REF_FASTA) \
										      -o $$(@) \
										      -known $$(KNOWN_INDELS)")

fgbio/$1/$1_cl_aln_srt_MD_IR.bam : fgbio/$1/$1_cl_aln_srt_MD.bam fgbio/$1/$1_cl_aln_srt_MD.intervals
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD) -v $(GATK_ENV),"set -o pipefail && \
										      $$(call GATK_CMD,16G) \
										      -T IndelRealigner \
										      -I $$(<) \
										      -R $$(REF_FASTA) \
										      -targetIntervals $$(<<) \
										      -o $$(@) \
										      -known $$(KNOWN_INDELS)")
									   							   
fgbio/$1/$1_cl_aln_srt_MD_IR_FX.bam : fgbio/$1/$1_cl_aln_srt_MD_IR.bam
	$$(call RUN,-c -n 1 -s 24G -m 36G,"set -o pipefail && \
					   $$(FIX_MATE) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   SORT_ORDER=coordinate \
					   COMPRESSION_LEVEL=0 \
					   CREATE_INDEX=true")
					   
fgbio/$1/$1_cl_aln_srt_MD_IR_FX.grp : fgbio/$1/$1_cl_aln_srt_MD_IR_FX.bam
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD) -v $(GATK_ENV),"set -o pipefail && \
										      $$(SAMTOOLS) index $$(<) && \
										      $$(call GATK_CMD,16G) \
										      -T BaseRecalibrator \
										      -R $$(REF_FASTA) \
										      -knownSites $$(DBSNP) \
										      -I $$(<) \
										      -o $$(@)")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX.bam fgbio/$1/$1_cl_aln_srt_MD_IR_FX.grp
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD) -v $(GATK_ENV),"set -o pipefail && \
										      $$(call GATK_CMD,16G) \
										      -T PrintReads \
										      -R $$(REF_FASTA) \
										      -I $$(<) \
										      -BQSR $$(<<) \
										      -o $$(@)")
				   
endef
$(foreach sample,$(SAMPLES),\
	$(eval $(call merge-bams,$(sample))))
	
define create-consensus
fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,8G) \
					  GroupReadsByUmi \
					  --strategy=paired \
					  --input=$$(<) \
					  --output=$$(@) \
					  --family-size-histogram=fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp.txt")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,8G) \
					  CorrectUmis \
					  --input=$$(<) \
					  --output=$$(@) \
					  --rejects=fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__REJECTED_.bam \
					  --metrics=fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__cu.txt \
					  --max-mismatches=5 \
					  --min-distance=1 \
					  --umi-files=$$(UMI_LIST)")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,8G) \
					  GroupReadsByUmi \
					  --strategy=paired \
					  --input=$$(<) \
					  --output=$$(@) \
					  --family-size-histogram=fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp.txt")
									  
fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp_DC.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp.bam
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD),"set -o pipefail && \
								       $$(call FGBIO_CMD,2G,16G) \
								       CallDuplexConsensusReads \
								       --min-reads 1 1 0 \
								       --input $$(<) \
								       --output $$(@) \
								       --threads $$(GATK_THREADS)")
																   
fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp.bam
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD),"set -o pipefail && \
								       $$(call FGBIO_CMD,2G,16G) \
								       CallDuplexConsensusReads \
								       --min-reads 1 1 0 \
								       --input $$(<) \
								       --output $$(@) \
								       --threads $$(GATK_THREADS)")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp_DC.duplex_umi_counts.txt : fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,16G) \
					  CollectDuplexSeqMetrics \
					  --input $$(<) \
					  --output fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR__grp_DC \
					  --duplex-umi-counts true \
					  --intervals $$(TARGETS_LIST)")
									  
fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,16G) \
					  CollectDuplexSeqMetrics \
					  --input $$(<) \
					  --output fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC \
					  --duplex-umi-counts true \
					  --intervals $$(TARGETS_LIST)")

endef
$(foreach sample,$(SAMPLES),\
	$(eval $(call create-consensus,$(sample))))
	
define align-consensus
fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC.bam
	$$(call RUN,-c -n $(BWAMEM_THREADS) -s 1G -m $(BWAMEM_MEM_PER_THREAD),"set -o pipefail && \
									       $$(SAM_TO_FASTQ) \
									       INPUT=$$(<) \
									       FASTQ=/dev/stdout \
									       INTERLEAVE=true | \
									       $$(BWA) mem -p -t $$(BWAMEM_THREADS) $$(REF_FASTA) /dev/stdin | \
									       $$(MERGE_ALIGNMENTS) \
									       UNMAPPED=$$(<) \
									       ALIGNED=/dev/stdin \
									       OUTPUT=$$(@) \
									       REFERENCE_SEQUENCE=$$(REF_FASTA) \
									       MAX_GAPS=-1 \
									       ORIENTATIONS=FR")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(ADD_RG) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@) \
					    RGID=$1 \
					    RGLB=$1 \
					    RGPL=illumina \
					    RGPU=NA \
					    RGSM=$1 \
					    SORT_ORDER=coordinate \
					    COMPRESSION_LEVEL=0 && \
					    $$(SAMTOOLS) index $$(@) && \
					    cp fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.bam.bai fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.bai")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.intervals : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.bam
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD) -v $(GATK_ENV),"set -o pipefail && \
										     $$(call GATK_CMD,16G) \
										     -T RealignerTargetCreator \
										     -I $$(^) \
										     -nt $$(GATK_THREADS) \
										     -R $$(REF_FASTA) \
										     -o $$(@) \
										     -known $$(KNOWN_INDELS) \
										     --allow_potentially_misencoded_quality_scores")

fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.bam fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG.intervals
	$$(call RUN,-c -n $(GATK_THREADS) -s 1G -m $(GATK_MEM_THREAD) -v $(GATK_ENV),"set -o pipefail && \
										      $$(call GATK_CMD,16G) \
										      -T IndelRealigner \
										      -I $$(<) \
										      -R $$(REF_FASTA) \
										      -targetIntervals $$(<<) \
										      -o $$(@) \
										      -known $$(KNOWN_INDELS) \
										      --allow_potentially_misencoded_quality_scores")
   							   
fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR.bam
	$$(call RUN,-c -n 1 -s 24G -m 36G,"set -o pipefail && \
					   $$(FIX_MATE) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   SORT_ORDER=coordinate \
					   COMPRESSION_LEVEL=0 \
					   CREATE_INDEX=true")
				   
endef
$(foreach sample,$(SAMPLES),\
	$(eval $(call align-consensus,$(sample))))
	
	
define copy-to-bam
bam/$1_cl_aln_srt_MD_IR_FX_BR.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -s 2G -m 4G,"set -o pipefail && \
				     cp $$(<) $$(@) && \
				     $$(SAMTOOLS) index $$(@) && \
				     cp bam/$1_cl_aln_srt_MD_IR_FX_BR.bam.bai bam/$1_cl_aln_srt_MD_IR_FX_BR.bai")
			 
bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam : fgbio/$1/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -s 2G -m 4G,"set -o pipefail && \
				     cp $$(<) $$(@) && \
				     $$(SAMTOOLS) index $$(@) && \
				     cp bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam.bai bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bai")

endef
$(foreach sample,$(SAMPLES),\
		$(eval $(call copy-to-bam,$(sample))))
		
define filter-consensus
bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(PYTHON) $$(SCRIPTS_DIR)/bam_tools/create_simplex_bam_from_consensus.py \
					  $$(<) \
					  $$(@)")

bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN,-c -n 1 -s 8G -m 16G,"set -o pipefail && \
					  $$(call FGBIO_CMD,2G,16G) \
					  FilterConsensusReads \
					  --input $$(<) \
					  --output $$(@) \
					  --ref $$(REF_FASTA) \
					  --min-reads=2 1 1 \
					  --min-base-quality=30 \
					  --reverse-per-base-tags=true")

endef
$(foreach sample,$(SAMPLES),\
	$(eval $(call filter-consensus,$(sample))))
	

define picard-metrics-standard
metrics/$1_cl_aln_srt_MD_IR_FX_BR.idx_stats.txt : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(BAM_INDEX) \
					    INPUT=$$(<) \
					    > $$(@)")
			   
metrics/$1_cl_aln_srt_MD_IR_FX_BR.aln_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -n 1 -s 24G -m 24G,"set -o pipefail && \
					    $$(COLLECT_ALIGNMENT_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
			   
metrics/$1_cl_aln_srt_MD_IR_FX_BR.insert_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -n 1 -s 24G -m 24G,"set -o pipefail && \
					    $$(COLLECT_INSERT_METRICS) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@) \
					    HISTOGRAM_FILE=metrics/$1_cl_aln_srt_MD_IR_FX_BR.insert_metrics.pdf \
					    MINIMUM_PCT=0.5")

metrics/$1_cl_aln_srt_MD_IR_FX_BR.oxog_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_OXOG_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
										
metrics/$1_cl_aln_srt_MD_IR_FX_BR.hs_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(CALC_HS_METRICS) \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   BAIT_INTERVALS=$$(TARGETS_LIST) \
					   TARGET_INTERVALS=$$(TARGETS_LIST)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX_BR.gc_metrics_summary.txt : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(COLLECT_GC_BIAS) \
					   INPUT=$$(<) \
					   OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX_BR.gc_metrics.txt \
					   CHART_OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX_BR.gc_metrics.pdf \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   SUMMARY_OUTPUT=$$(@)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX_BR-pileup.txt.gz : bam/$1_cl_aln_srt_MD_IR_FX_BR.bam
	$$(call RUN,-c -n 4 -s 4G -m 6G,"set -o pipefail && \
					 mkdir -p metrics && \
					 cd metrics && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX_BR.bam $1_cl_aln_srt_MD_IR_FX_BR.bam && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX_BR.bai $1_cl_aln_srt_MD_IR_FX_BR.bai && \
					 $$(call WALTZ_CMD,2G,8G) org.mskcc.juber.waltz.Waltz PileupMetrics $$(MIN_MAPQ) $1_cl_aln_srt_MD_IR_FX_BR.bam $$(REF_FASTA) $$(TARGETS_BED) && \
					 gzip $1_cl_aln_srt_MD_IR_FX_BR-pileup.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX_BR-pileup-without-duplicates.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX_BR-intervals.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX_BR-intervals-without-duplicates.txt && \
					 unlink $1_cl_aln_srt_MD_IR_FX_BR.bam && \
					 unlink $1_cl_aln_srt_MD_IR_FX_BR.bai && \
					 cd ..")

endef
$(foreach sample,$(SAMPLES),\
 		$(eval $(call picard-metrics-standard,$(sample))))
		
define picard-metrics-collapsed
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.idx_stats.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(BAM_INDEX) \
					    INPUT=$$(<) \
					    > $$(@)")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.aln_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_ALIGNMENT_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.insert_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_INSERT_METRICS) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@) \
					    HISTOGRAM_FILE=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.insert_metrics.pdf \
					    MINIMUM_PCT=0.5")
			   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.oxog_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_OXOG_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
				
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.hs_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(CALC_HS_METRICS) \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   BAIT_INTERVALS=$$(TARGETS_LIST) \
					   TARGET_INTERVALS=$$(TARGETS_LIST)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.gc_metrics_summary.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(COLLECT_GC_BIAS) \
					   INPUT=$$(<) \
					   OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.gc_metrics.txt \
					   CHART_OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.gc_metrics.pdf \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   SUMMARY_OUTPUT=$$(@)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX-pileup.txt.gz : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam
	$$(call RUN,-c -n 4 -s 4G -m 6G,"set -o pipefail && \
					 mkdir -p metrics && \
					 cd metrics && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam $1$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bai $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bai && \
					 $$(call WALTZ_CMD,2G,8G) org.mskcc.juber.waltz.Waltz PileupMetrics $$(MIN_MAPQ) $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam $$(REF_FASTA) $$(TARGETS_BED) && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX-pileup.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX-pileup-without-duplicates.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX-intervals.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX-intervals-without-duplicates.txt && \
					 unlink $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bam && \
					 unlink $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.bai && \
					 cd ..")

endef
$(foreach sample,$(SAMPLES),\
 		$(eval $(call picard-metrics-collapsed,$(sample))))
		
define picard-metrics-simplex
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.idx_stats.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(BAM_INDEX) \
					    INPUT=$$(<) \
					    > $$(@)")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.aln_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_ALIGNMENT_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
			   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.insert_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_INSERT_METRICS) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@) \
					    HISTOGRAM_FILE=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.insert_metrics.pdf \
					    MINIMUM_PCT=0.5")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.oxog_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_OXOG_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
										
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.hs_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(CALC_HS_METRICS) \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   BAIT_INTERVALS=$$(TARGETS_LIST) \
					   TARGET_INTERVALS=$$(TARGETS_LIST)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.gc_metrics_summary.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(COLLECT_GC_BIAS) \
					   INPUT=$$(<) \
					   OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.gc_metrics.txt \
					   CHART_OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.gc_metrics.pdf \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   SUMMARY_OUTPUT=$$(@)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX-pileup.txt.gz : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam
	$$(call RUN,-c -n 4 -s 4G -m 6G,"set -o pipefail && \
					 mkdir -p metrics && \
					 cd metrics && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam $1$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bai $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bai && \
					 $$(call WALTZ_CMD,2G,8G) org.mskcc.juber.waltz.Waltz PileupMetrics $$(MIN_MAPQ) $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam $$(REF_FASTA) $$(TARGETS_BED) && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX-pileup.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX-pileup-without-duplicates.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX-intervals.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX-intervals-without-duplicates.txt && \
					 unlink $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bam && \
					 unlink $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.bai && \
					 cd ..")

endef
$(foreach sample,$(SAMPLES),\
 		$(eval $(call picard-metrics-simplex,$(sample))))
		

define picard-metrics-duplex
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.idx_stats.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(BAM_INDEX) \
					    INPUT=$$(<) \
					    > $$(@)")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.aln_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_ALIGNMENT_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.insert_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_INSERT_METRICS) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@) \
					    HISTOGRAM_FILE=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.insert_metrics.pdf \
					    MINIMUM_PCT=0.5")
									   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.oxog_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN, -c -n 1 -s 24G -m 36G,"set -o pipefail && \
					    $$(COLLECT_OXOG_METRICS) \
					    REFERENCE_SEQUENCE=$$(REF_FASTA) \
					    INPUT=$$(<) \
					    OUTPUT=$$(@)")
										
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.hs_metrics.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(CALC_HS_METRICS) \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   INPUT=$$(<) \
					   OUTPUT=$$(@) \
					   BAIT_INTERVALS=$$(TARGETS_LIST) \
					   TARGET_INTERVALS=$$(TARGETS_LIST)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.gc_metrics_summary.txt : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN, -c -n 1 -s 6G -m 12G,"set -o pipefail && \
					   $$(COLLECT_GC_BIAS) \
					   INPUT=$$(<) \
					   OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.gc_metrics.txt \
					   CHART_OUTPUT=metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.gc_metrics.pdf \
					   REFERENCE_SEQUENCE=$$(REF_FASTA) \
					   SUMMARY_OUTPUT=$$(@)")
					   
metrics/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX-pileup.txt.gz : bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam
	$$(call RUN,-c -n 4 -s 4G -m 6G,"set -o pipefail && \
					 mkdir -p metrics && \
					 cd metrics && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam $1$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam && \
					 ln -sf ../bam/$1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bai $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bai && \
					 $$(call WALTZ_CMD,2G,8G) org.mskcc.juber.waltz.Waltz PileupMetrics $$(MIN_MAPQ) $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam $$(REF_FASTA) $$(TARGETS_BED) && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX-pileup.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX-pileup-without-duplicates.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX-intervals.txt && \
					 gzip $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX-intervals-without-duplicates.txt && \
					 unlink $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bam && \
					 unlink $1_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.bai && \
					 cd ..")

endef
$(foreach sample,$(SAMPLES),\
 		$(eval $(call picard-metrics-duplex,$(sample))))
		
summary/idx_metrics.txt : $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.idx_stats.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.idx_stats.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.idx_stats.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.idx_stats.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 1 --sample_names '$(SAMPLES)'")
									  
summary/aln_metrics.txt : $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.aln_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.aln_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.aln_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.aln_metrics.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 2 --sample_names '$(SAMPLES)'")
									  
summary/insert_metrics.txt : $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.insert_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.insert_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.insert_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.insert_metrics.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 3 --sample_names '$(SAMPLES)'")

summary/oxog_metrics.txt : $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.oxog_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.oxog_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.oxog_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.oxog_metrics.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 4 --sample_names '$(SAMPLES)'")
									  
summary/hs_metrics.txt : $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.hs_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.hs_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.hs_metrics.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.hs_metrics.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 5 --sample_names '$(SAMPLES)'")

summary/umi_counts.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 6 --sample_names '$(SAMPLES)'")
									  
summary/umi_fixed_counts.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 7 --sample_names '$(SAMPLES)'")
									  
summary/umi_duplex_counts.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 8 --sample_names '$(SAMPLES)'")
									  
summary/umi_fixed_duplex_counts.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 9 --sample_names '$(SAMPLES)'")

summary/all_family_sizes.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 10 --sample_names '$(SAMPLES)'")
									  
summary/duplex_family_sizes.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 11 --sample_names '$(SAMPLES)'")

summary/duplex_yield_metrics.txt : $(foreach sample,$(SAMPLES),fgbio/$(sample)/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC.duplex_umi_counts.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 12 --sample_names '$(SAMPLES)'")
					  
summary/gc_metrics.txt : $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX_BR.gc_metrics_summary.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX.gc_metrics_summary.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_SIMPLEX.gc_metrics_summary.txt) $(foreach sample,$(SAMPLES),metrics/$(sample)_cl_aln_srt_MD_IR_FX2_BR__grp_DC_MA_RG_IR_FX_DUPLEX.gc_metrics_summary.txt)
	$(call RUN, -c -n 1 -s 8G -m 12G,"set -o pipefail && \
					  $(RSCRIPT) $(SCRIPTS_DIR)/qc/beadlink_prism.R --option 13 --sample_names '$(SAMPLES)'")
									  

..DUMMY := $(shell mkdir -p version; \
	     $(JAVA8) -jar $(FGBIO) --help &> version/fgbio_prism.txt; \
	     echo "picard" >> version/fgbio_prism.txt; \
	     $(PICARD) SortSam --version &>> version/fgbio_prism.txt; \
	     $(PICARD) MarkIlluminaAdapters --version &>> version/fgbio_prism.txt; \
	     $(PICARD) SamToFastq --version &>> version/fgbio_prism.txt)
.DELETE_ON_ERROR:
.SECONDARY:
.PHONY: fgbio_prism