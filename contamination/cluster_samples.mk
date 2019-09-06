include modules/Makefile.inc
include modules/variant_callers/gatk.inc

LOGDIR = log/cluster_samples.$(NOW)
PHONE += metrics metrics/snps metrics/summary metrics/report

cluster_samples : $(foreach sample,$(SAMPLES),metrics/snps/$(sample).vcf)
#				  metrics/summary/snps_combined.vcf \
#				  metrics/summary/snps_filtered.vcf \
#				  metrics/summary/snps_filtered.tsv \
#				  metrics/report/snps_clustering.pdf

ifeq ($(EXOME),true)
DBSNP_SUBSET ?= $(HOME)/share/reference/dbsnp_137_exome.bed
else
DBSNP_SUBSET = $(HOME)/share/reference/dbsnp_tseq_intersect.bed
endif
CLUSTER_VCF = $(RSCRIPT) modules/contamination/cluster_samples.R

define genotype-snps
metrics/snps/$1.vcf : bam/$1.bam
	$$(call RUN,-n 4 -s 2.5G -m 3G,"set -o pipefail && \
									$(call GATK_MEM,8G) -T UnifiedGenotyper -nt 4 -R $(REF_FASTA) --dbsnp $(DBSNP) \
									-I $$(<) \
									-L $(DBSNP_SUBSET) \
									-o $$(@) \
									--output_mode EMIT_ALL_SITES \
									--min_base_quality_score 30 \
									--standard_min_confidence_threshold_for_calling 20")
									
endef
$(foreach sample,$(SAMPLES),\
		$(eval $(call genotype-snps,$(sample))))
		
#metrics/summary/snps_combined.vcf : $(foreach sample,$(SAMPLES),metrics/snps/$(sample).vcf)
#	$(call RUN,-s 16G -m 20G,"set -o pipefail && \
#							  $(call GATK_MEM,14G) -T CombineVariants $(foreach vcf,$^,--variant $(vcf) ) \
#							  -o $@ --genotypemergeoption UNSORTED -R $(REF_FASTA)")
#							  
#metrics/summary/snps_filtered.vcf : metrics/summary/snps_combined.vcf
#	$(INIT) grep '^#' $< > $@ && grep -e '0/1' -e '1/1' $< >> $@
#	
#metrics/summary/snps_filtered.tsv : metrics/summary/snps_filtered.vcf
#	$(INIT) $(CLUSTER_VCF) --library 'STANDARD'
#	
#metrics/report/snps_clustering.pdf : metrics/summary/snps_filtered.tsv
#	$(call RUN, -c -n 1 -s 12G -m 16G -v $(SUPERHEAT_ENV),"set -o pipefail && \
#														   $(RSCRIPT) modules/test/qc/plotmetrics.R --type 15 && \
#									   					   gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dFirstPage=2 -dLastPage=2 -sOutputFile=metrics/report/snps_clustering-standard-2.pdf metrics/report/snps_clustering-standard.pdf && \
#									   					   rm metrics/report/snps_clustering-standard.pdf && \
#									   					   mv metrics/report/snps_clustering-standard-2.pdf metrics/report/snps_clustering-standard.pdf")
		
include modules/vcf_tools/vcftools.mk

.DELETE_ON_ERROR:
.SECONDARY: 
.PHONY: $(PHONY)
