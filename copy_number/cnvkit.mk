include innovation-lab/Makefile.inc
include innovation-lab/genome_inc/b37.inc

LOGDIR ?= log/cnv_kit.$(NOW)

cnv_kit : $(foreach sample,$(TUMOR_SAMPLES),cnvkit/cnn/tumor/$(sample).targetcoverage.cnn) \
	  $(foreach sample,$(TUMOR_SAMPLES),cnvkit/cnn/tumor/$(sample).antitargetcoverage.cnn) \
	  $(foreach sample,$(NORMAL_SAMPLES),cnvkit/cnn/normal/$(sample).targetcoverage.cnn) \
	  $(foreach sample,$(NORMAL_SAMPLES),cnvkit/cnn/normal/$(sample).antitargetcoverage.cnn) \
	  cnvkit/reference/combined_reference.cnr \
	  $(foreach sample,$(TUMOR_SAMPLES),cnvkit/cnr/$(sample).cnr)
	  
ONTARGET_FILE = $(HOME)/share/lib/bed_files/MSK-IMPACT-v3_cnvkit_ontarget.bed
OFFTARGET_FILE = $(HOME)/share/lib/bed_files/MSK-IMPACT-v3_cnvkit_offtarget.bed

define cnvkit-tumor-cnn
cnvkit/cnn/tumor/$1.targetcoverage.cnn : bam/$1.bam
	$$(call RUN,-c -n 4 -s 6G -m 8G -v $(CNVKIT_ENV),"set -o pipefail && \
							  cnvkit.py coverage -p 4 -q 0 $$(<) $$(ONTARGET_FILE) -o cnvkit/cnn/tumor/$1.targetcoverage.cnn")

cnvkit/cnn/tumor/$1.antitargetcoverage.cnn : bam/$1.bam
	$$(call RUN,-c -n 4 -s 6G -m 8G -v $(CNVKIT_ENV),"set -o pipefail && \
							  cnvkit.py coverage -p 4 -q 0 $$(<) $$(OFFTARGET_FILE) -o cnvkit/cnn/tumor/$1.antitargetcoverage.cnn")
endef
 $(foreach sample,$(TUMOR_SAMPLES),\
		$(eval $(call cnvkit-tumor-cnn,$(sample))))
		
define cnvkit-normal-cnn
cnvkit/cnn/normal/$1.targetcoverage.cnn : bam/$1.bam
	$$(call RUN,-c -n 4 -s 6G -m 8G -v $(CNVKIT_ENV),"set -o pipefail && \
							  cnvkit.py coverage -p 4 -q 0 $$(<) $$(ONTARGET_FILE) -o cnvkit/cnn/normal/$1.targetcoverage.cnn")

cnvkit/cnn/normal/$1.antitargetcoverage.cnn : bam/$1.bam
	$$(call RUN,-c -n 4 -s 6G -m 8G -v $(CNVKIT_ENV),"set -o pipefail && \
							  cnvkit.py coverage -p 4 -q 0 $$(<) $$(OFFTARGET_FILE) -o cnvkit/cnn/normal/$1.antitargetcoverage.cnn")
endef
 $(foreach sample,$(NORMAL_SAMPLES),\
		$(eval $(call cnvkit-normal-cnn,$(sample))))

cnvkit/reference/combined_reference.cnr : $(foreach sample,$(NORMAL_SAMPLES),cnvkit/cnn/normal/$(sample).targetcoverage.cnn) $(foreach sample,$(NORMAL_SAMPLES),cnvkit/cnn/normal/$(sample).antitargetcoverage.cnn)
	$(call RUN,-n 1 -s 24G -m 32G -v $(CNVKIT_ENV),"set -o pipefail && \
							sleep 30 && \
							cnvkit.py reference cnvkit/cnn/normal/*.cnn -f $(REF_FASTA) --no-edge -o cnvkit/reference/combined_reference.cnr")

define cnvkit-tumor-cnr
cnvkit/cnr/$1.cnr : cnvkit/cnn/tumor/$1.targetcoverage.cnn cnvkit/cnn/tumor/$1.antitargetcoverage.cnn cnvkit/reference/combined_reference.cnr
	$$(call RUN,-c -s 6G -m 8G -v $(CNVKIT_ENV),"set -o pipefail && \
						     cnvkit.py fix $$(<) $$(<<) $$(<<<) -o cnvkit/cnr/$1.cnr")
	
endef
 $(foreach sample,$(TUMOR_SAMPLES),\
		$(eval $(call cnvkit-tumor-cnr,$(sample))))


..DUMMY := $(shell mkdir -p version; \
	     python $(CNVKIT_ENV)/bin/cnvkit.py version &> version/cnvkit.txt)
.DELETE_ON_ERROR:
.SECONDARY:
.PHONY: cnv_kit
