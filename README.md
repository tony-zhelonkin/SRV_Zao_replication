Zao et al Novel simian retrovirus replication phylogenetic analysis
--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

What`s this all about?
-------------------
This is a phylogenetics minireplication analysis based on a paper by Zao et al. 
 [*"A novel simian retrovirus subtype discovered in cynomolgus monkeys (Macaca fascicularis)"*](https://www.microbiologyresearch.org/content/journal/jgv/10.1099/jgv.0.000601)
The miniproject was created as an exercise in in [Bioinformatics Institute](https://bioinf.me/en)


- Anton Zhelonkin [@tony-zhelonkin](https://github.com/tony-zhelonkin)

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
- PhyMl3 at http://phylogeny.lirmm.fr/phylo_cgi/one_task.cgi?task_type=phyml


Pipeline
-------------------
1. Sequences were extracted from NCBI as fasta using reutils library for R. The script is provided in 
the data/SRV_2022-05-24.Rmd

2. Sequences were aligned using clustalw with the following terminal command 
> **$ clustalw -INFILE=srv_all_sequences -OUTPUT=FASTA -OUTFILE=srv_all_clust_alignment.fa**

![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/ugene_all_clust_hist_quality.png)

3. Sequences were trimmed using trimal 
> **$ trimal -in srv_all_clust_alignment.fa -out srv_all_clust_aln_trim.fa**

4. Evolutionary models were tested using **modeltest-ng**
> **$ modeltest-ng -i srv_all_clust_aln_trim.fa -o srv_all_clust_aln_trim_modeltest**

5. The best tree searched for using raxml
> **$ raxml-ng --msa srv_all_clust_aln_trim.fa --model GTR+I+G4 --prefix srv_all_raxml --threads 2 --seed 222**

6. The tree was visualised using R ggtree
> **srv_tr <- read.tree("srv_all_raxml.raxml.bestTree")**
> **ggtree(srv_tr) + geom_tiplab()** 
 
Resulting phylogenetic trees 
------------------- 
The script for visualisation is available in data/SRV_2022-05-24.Rmd
![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/srv_all_raxml_bestTree.png) 

The tips of the tree were renamed according to the SRV subtype
![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/srv_all_raxml_named_bestTree.png)

As the modeltest-raxml tree was somewhat different from the original tree by Zao et al. an attempt was made 
to build a PhyMl3 tree (as described by the authors) with 100 bootstraps 
at http://phylogeny.lirmm.fr/phylo_cgi/one_task.cgi?task_type=phyml

The resulting tree was visualised using ggtree. All tree scripts visualisations are available in data/SRV_2022-05-24.Rmd  
![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/phyml3_all_tree.png) 

After some tweaks the final PhyMl tree was made slightly more publishable 
![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/phyml3_all_tree_res.png) 

As expeted the PhyMl3 tree was closest to what the authors of the original paper provided (fig. below)
![](https://github.com/tony-zhelonkin/SRV_Zao_replication/blob/main/Zao_original_tree2.png) 

Conclusion
-------------------
No matter the tree replication method (modeltest-raxml or PhyML3) the main idea of Zao`s papers holds true. 
Apperently the newly discovered SRV viruses are indeeed a distinct subtype that deserve to beare a name SRV-8














