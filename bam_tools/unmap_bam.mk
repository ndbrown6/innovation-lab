include innovation-lab/Makefile.inc

LOGDIR ?= log/unmap_bam.$(NOW)

unmap_bam : $(foreach sample,$(SAMPLES),unmapped_reads/$(sample).bam)

define extract-unmapped-reads
unmapped_reads/%.bam : bam/%.bam
	$$(call RUN,-c -n 4 -s 4G -m 6G,"$(SAMTOOLS) view -f 0x04 -h -@ 4 -b $$(<) -o unmapped_reads/$$(*).bam")
endef
$(foreach sample,$(SAMPLES),\
		$(eval $(call extract-unmapped-reads,$(sample))))


..DUMMY := $(shell mkdir -p version; \
	     $(SAMTOOLS) --version > version/unmap_bam.txt)
.SECONDARY:
.DELETE_ON_ERROR: 
.PHONY: unmap_bam
