# WDL HSI

All code specifically for the WDL algorithm is attributed to here: 
https://github.com/MarshMue/GeoWDL-TAG-ML-ICML-2023

Information on the Salinas A sensor used for constructing the cost matrix is here:
https://purr.purdue.edu/publications/1947/1

Code here is associated with papers on WDL for hyperspectral image unmixing and clustering.

Installation: 
Recommend a Conda environment to maintain. Scripts to run experiments on Salinas A were run on the Tufts HPC Cluster. For specific packages, this isn't an exhaustive list, but here are versions used for the main ones:
1. ```numpy 1.23.5```
2. ```pytorch 1.13.1```
3. ```POT 0.8.2 ```
4. ```scikit-learn 1.2.1```

The code was also run using ```Python 3.9.15```

# Replication of sampling and synthetic results: 
All figures are generated with code written in helper.py

Common data and the indices of each point in training data are saved in files ```common_data.pt``` and ```common_index.pt``` respectively. 

## Random sample: 

Run ```python3 sampler.py --size=1002```

You can tweak the size, but how the function is configured here requires it to be a multiple of 6 and small enough so we can take the same amount of points from each class. 
It will create files called ```testing_data.pt``` and ```testing_index.pt```

## Synthetic Results:

To generate the synthetic results with the two Gaussians run: 

```python3 synth_test.py --reg=0.001 --mu=0 --lm=1 --mode=gauss```

To generate synthetic results on the uniform/Laplace distribution, run:

```python3 synth_test.py --reg=0.001 --mu=0 --lm=1 --mode=uniform```

If you wish to see PCA/NMF/WDL run on the uniform/Laplace distribution, comment out the code in helper.py() that prevents it from running those processes.




# Replication of Salinas A results: 
As an aside, some figures were modified for presentation after the fact, so the only difference between images in the paper and their corresponding image in that folder is a 
title/axis. All Salinas A results involving WDL are stored in ```Salinas_A_experiments``` and all PCA/NMF results involving Salinas A are stored in ```PCA_NMF_comparisons```

To run the full set of Salinas A experiments requires user modification, and updating the script ```run.sh```. At a minimum, you'll need to replace anything that's been replaced by a *
If modified correctly, run the following commands: 

```sh run_high_mu.sh``` and ```run_small_mu.sh```

For context ```run_high_mu.sh``` handles experiments with geometric regularizer values greater than 1, and ```run_small_mu.sh``` handles experiments with geometric regularizer values <= 1. 

This will create a unique directory for each parameter, and move them all into one parent directory, 'parent'. In each folder, there should be a NN accuracy matrix saved as a .npy file. To combine these across all folders into a single matrix, run: 

``` python3 merge_results.py --root=parent ``` 

The final matrix is titled ```NN_results.npy```


# Random sampling results:
1. We ran 10 random samples using control_loop_individual() in the main. Running
python3 helper.py --n_atoms=32 --geom=0.001 --reg=0.1 is how we did so, we just 
ran that 10 times. Then ran clustering_loop_adjusted() for results. These results
are saved in clustering_acc.csv and painting_acc.csv

Parameter invariant figures: 
GT and training data images

The kmeans, old, utilities, and wdl folders are related to wdl. 


If you have any questions about the code. email me, Scott Fullenbaum, at sfulle03@tufts.edu
