# aligning sequences of the newly sequences SRV strain
clustalw -INFILE=srv_new_sequences -OUTPUT=FASTA -OUTFILE=srv_new_clust_alignment.fa

clustalw -INFILE=srv_all_sequences -OUTPUT=FASTA -OUTFILE=srv_all_clust_alignment.fa

# trimming 
trimal -in srv_all_clust_alignment.fa -out srv_all_clust_aln_trim.fa


# testin models using modeltest-ng
modeltest-ng -i srv_all_clust_aln_trim.fa -o srv_all_clust_aln_trim_modeltest


# running phyml
phyml  -i srv_all_clust_aln_trim.fa -m 012345 -f m -v e -a e -c 4 -o tlr

