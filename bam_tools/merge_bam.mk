include innovation-lab/Makefile.inc
include innovation-lab/bam_tools/process_bam.mk

LOGDIR = log/merge_bam.$(NOW)

merge_bam : $(foreach sample,$(MERGE_SAMPLES),bam/$(sample).bam bam/$(sample).bam.bai)

define merged-bam
%.header.sam : %.bam
	$$(INIT) $$(SAMTOOLS) view -H $$< > $$@

merged_bam/$1.header.sam : $$(merge.$1:.bam=.header.sam)
	$$(call RUN,-s 16G -m 18G,"$$(MERGE_SAM) $$(foreach sam,$$^,I=$$(sam) ) O=$$@")

merged_bam/$1.bam : merged_bam/$1.header.sam $$(merge.$1)
	$$(call RUN,-s 12G -m 15G,"$$(SAMTOOLS) merge -f -h $$< $$(@) $$(filter %.bam,$$^)")
endef

define rename-bam
bam/$1.bam : $2
	$$(INIT) ln -f $$< $$@
endef
$(foreach sample,$(MERGE_SAMPLES),\
	$(if $(word 2,$(merge.$(sample))),\
	$(eval $(call merged-bam,$(sample))),\
	$(if $(merge.$(sample)),\
	$(eval $(call rename-bam,$(sample),$(merge.$(sample)))))))

bam/%.bam : merged_bam/%.rg.bam
	$(INIT) ln -f $< $@


..DUMMY := $(shell mkdir -p version && \
	     echo "picard" > version/merge_bam.txt && \
	     $(PICARD) MergeSamFiles --version >> version/merge_bam.txt
	     $(SAMTOOLS) --version >> version/merge_bam.txt)
.SECONDARY:
.DELETE_ON_ERROR: 
.PHONY : merge_bam
