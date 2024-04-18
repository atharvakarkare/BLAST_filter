#!/bin/bash

for ((i=89; i<=94; i ++))
 do
 awk -F, '$2 = /s*HUMAN/' SRR$i.blast.txt > out$i.txt
 awk '$11 < 1e-5' out$i.txt > filtered$i.txt
 awk '$12 > 40' filtered$i.txt > filtered_bit$i.txt
 cut -f1 filtered_bit$i.txt > unique$i.txt
 sort -u unique$i.txt > noval$i.txt
 seqtk subseq /home/neo/atharva/CPC2/non_coding_seq/nc_SRR$i.fa  /home/neo/atharva/blast_output/noval$i.txt > /home/neo/atharva/blast_output/noval$i.fa
 grep ">" noval$i.fa | wc -l >> count.txt
 
 rm out$i.txt
 rm filtered$i.txt
 rm filtered_bit$i.txt
 rm unique$i.txt

done 
