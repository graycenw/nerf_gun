#!/bin/bash

# print a header
HEADER = "group, replicate, fastq_1, fastq_2, anitbody, control, fastq1_url, fastq2_url"
echo $HEADER > NRF1_design.csv

###NOTE: these are the mapped columsn to each of the data we need
GROUP =  
REPLICATE = 
FASTQ_1 = 
FASTQ_2 = 
ANTIBODY = 
CONTROL = 
FASTQ1_URL = 
FASTQ2_URL = 

awk -F '\t' '{print $GROUP, $REPLICATE, $FASTQ_1, $FASTQ_2, $ANTIBODY, $CONTROL, $FASTQ1_URL, $FASTQ2_URL}' metadata.tsv > NRF1_design.csv

