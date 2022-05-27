Zao et al Novel simian retrovirus replication phylogenetic analysis
--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

What`s this all about?
-------------------
This is a phylogenetics minireplication analysis based on a paper by Zao et al. 
*"A novel simian retrovirus subtype discovered in cynomolgus monkeys (Macaca fascicularis)"*
The miniproject was created as an exercise in in [Bioinformatics Institute](https://bioinf.me/en)

Question under analysis
-------------------
Can the phylogenetic tree from the Zao et al. paper be replicated? Do the newly discovered SRV 
viruses hold their own distinct postion on the phylogenetic tree?

Objectives
-----------------
- Download SRV viruses sequences using eutils
- Align sequences using clustalw
- Draw a phylogenetic tree of SRV viruses
- Compare results from different differential expression analysis tools inside Hobotnica

Software used
-------------------
- R version 4.2.0 (2022-04-22) 
- R package reutils_0.2.3 for NCBI data extraction
- CLUSTAL 2.1 Multiple Sequence Alignments for multiple alignment
- trimAl v1.4.rev15 build[2013-12-17] for alignment trimming
- modeltest 0.1.7-0 for testing models of evolution
- RAxML-NG v. 0.9.0 for finding the best tree under maximum likelihood
- R package ggtree_3.4.0 to draw the phylogenetic tree



![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/ugene_all_clust_hist_quality.png)


![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/srv_all_raxml_bestTree.png)


![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/srv_all_raxml_named_bestTree.png)



