# WDL_code
A couple of file tracking things:
1. Results are in WDLProject-main/new_wdl_tests/MNIST_Tests under any folder titled big_sample_k=...
2. These folders should have most extraneous files deleted, there are a couple still there. Any png with results is up to date and properly labeled.
3. The NN matrices are saved as .npy files for future use, spectral clustering might vary slightly from trial to trial due to kmeans solver/data size and dimension.
4. There are a couple of matrices, sparse_NN, sparse_res_NN, NN_acc, and maybe one more that I'm missing, that store relevant parameter information and accuracy to hopefully use for a grid search.
5. Weights matrices may not look visually appealing, would probably have to be sorted before displaying, but using any sorting algorithm messes up calculations.
6. Accuracy is generally in 30%-40% range, I've seen a couple reach 50% accuracy. Some results and parameters appear to be somewhat worse than others, but nothing stands out as being exceptional. 
