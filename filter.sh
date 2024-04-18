#!/bin/bash

 awk -F, '$2 = /s*HUMAN/' SRR.blast.txt > out.txt
 awk '$11 < 1e-5' out.txt > filtered_evalue.txt
 awk '$12 > 40' filtered_evalue.txt > filtered_bit.txt
 cut -f1 filtered_bit.txt > unique_seq.txt
 sort -u unique_seq.txt > noval_seq.txt
 seqtk subseq /path/to/sequence/files/SRR.fa  /path/to/filtered/blast/output/noval_seq.txt > /path/to/save/output/noval_seq.fa
 grep ">" noval_seq.fa | wc -l >> seq_count.txt
 
 rm out.txt
 rm filtered_evalue.txt
 rm filtered_bit.txt
 rm unique_seq.txt

