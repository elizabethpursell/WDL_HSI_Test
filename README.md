# WDL HSI

All code specifically for the WDL algorithm is attributed to here: 
https://github.com/MarshMue/GeoWDL-TAG-ML-ICML-2023

Information on the Salinas A sensor used for constructing the cost matrix is here:
https://purr.purdue.edu/publications/1947/1

Code here is associated with papers on WDL for hyperspectral image unmixing and clustering.

Installation: 
Recommend a Conda environment. Scripts to run experiments on Salinas A were run
on the Tufts HPC Cluster. 

# Replication of paper images and results: 
All figures are generated with code written in helper.py
Our common data set was generated with a run of the sample() function.  
To run code in helper.py, from a command line interface cd into the Tests folder. 
It will not work otherwise.

To generate synthetic results on Gaussians, run:

```python3 synth_test.py --reg=0.001 --mu=0 --lm=1 --mode=gauss```

To generate synthetic results on the Uniform/Laplace distribution, run:

```python3 synth_test.py --reg=0.001 --mu=0 --lm=1 --mode=uniform```

The function will do PCA, NMF, linear mixture and WDL on the test atoms.
To see results with uniform and laplace distribution, those test atoms are
commented out, so uncomment them, change samp parameter to 21, and weights on line
518 from 0.02 to 0.05. 

SalinasA WDL results, atoms, weights, clustering, spatial-NN and reconstructions
are all stored in Salinas_A_experiments. 

Some figures were modified for presentation after the fact, so the only difference 
between images in the paper and their corresponding image in that folder is a 
title/axis. The data is the same.  

# To reproduce Salinas_A_experiments: 
1. Again, all computations were run on the Tufts HPC cluster, so you will have
to modify shell scripts.
2. In the main of helper.py() call only control_loop()
3. In run.sh, configure so it runs on your system.
4. Run run_high_mu.sh and run_small_mu.sh scripts
run_high_mu.sh runs for mu/rho > 1, and run_small_mu.sh runs for rho <= 1. See
control_loop() for a more robust explanation. Each unique set of parameters gets
a directory. 
5. If you don't have all pdfs of clustering, then move all directories created
by step 4 into a big parent directory, and then run in the main function 
clustering_loop(par_dir=parent, savename=X) where X is the output npy file
that contains all the NN results. Our results are stored in Or_clustering_NN_acc.npy

# Random sampling results:
1. We ran 10 random samples using control_loop_individual() in the main. Running
python3 helper.py --n_atoms=32 --geom=0.001 --reg=0.1 is how we did so, we just 
ran that 10 times. Then ran clustering_loop_adjusted() for results. These results
are saved in clustering_acc.csv and painting_acc.csv

# Other files and directories:
common_data.pt and common_index.pt are the training data we used
salinas_costs.csv, SalinasA_correct.mat, SalinasA_gt.mat, are the costs for cost matrix,
the data, and the gt respectively. 

PCA_NMF_comparisons: 
Results for PCA/NMF on Salinas A are stored here

Modified figures:
Where we store the figures we tweaked for presentation

Parameter invariant figures: 
GT and training data images

The kmeans, old, utilities, and wdl folders are related to wdl. 


If you have any questions about the code. email me, Scott Fullenbaum, at sfulle03@tufts.edu
