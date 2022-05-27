# aligning sequences of the newly sequences SRV strain
clustalw -INFILE=srv_new_sequences -OUTPUT=FASTA -OUTFILE=srv_new_clust_alignment.fa

clustalw -INFILE=srv_all_sequences -OUTPUT=FASTA -OUTFILE=srv_all_clust_alignment.fa

# trimming 
trimal -in srv_all_clust_alignment.fa -out srv_all_clust_aln_trim.fa


# testin models using modeltest-ng
modeltest-ng -i srv_all_clust_aln_trim.fa -o srv_all_clust_aln_trim_modeltest

# looking for the best tree 
raxml-ng --msa srv_all_clust_aln_trim.fa --model GTR+I+G4 --prefix srv_all_raxml --threads 2 --seed 222


