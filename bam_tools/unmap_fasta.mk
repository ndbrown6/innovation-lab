include innovation-lab/Makefile.inc

LOGDIR ?= log/unmap_fasta.$(NOW)

unmap_fasta : $(foreach sample,$(SAMPLES),unmapped_reads/$(sample).fasta)

define extract-unmapped-reads
unmapped_reads/%.fasta : bam/%.bam
	$$(call RUN,-c -n 4 -s 4G -m 6G,"$(SAMTOOLS) fasta $$(<) > unmapped_reads/$$(*).fasta")
endef
$(foreach sample,$(SAMPLES),\
		$(eval $(call extract-unmapped-reads,$(sample))))


..DUMMY := $(shell mkdir -p version; \
	     $(SAMTOOLS) --version > version/unmap_fasta.txt)
.SECONDARY:
.DELETE_ON_ERROR: 
.PHONY: unmap_fasta
