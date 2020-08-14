* SMSC
A spectral clustering method for scRNA-seq
1. compute kernels with computeKernel.m
2. run.m is the main entrace.
3. selfweightmkl.m is called by run.m and it autolly assigns weights to all kernels.
4. We provide a demo on Yan dataset. You just need to download the code and set right pathway, and then run the function of run.m. 
5. Folders in this projet contain scRNA-Seq expression data and computed kernels.

Input: data.m
Output: results.txt

** Clustering:
1. FINCH: First Integer Neighbor Clustering Hierarchy (FINCH) Algorithm
**Matlab :** Please go in the path where you copied this folder or add its path to your Matlab path.

``` 
[c, num_clust]= FINCH(data, initial_rank, verbose);
```

Input:

* data: data Matrix (feature vecotrs in rows)
* initial_rank [Optional]: Nx1  (1-neighbour) indices vector. Pass empty [] to compute the 1st neighbor via pdist or flann
* verbos : printing some output

Output:

* c: N x P matrix  Each column vector contains cluster labels for each partition P
* num_clust: shows total number of cluster in each partition P

2. Greedy
*** USAGE - Full matlab

See help of m files for details.

cluster_jl.m : Weighted (or not), non oriented version of algorithm 
 matrix is symetrized using sum of incoming and outgoing weights)

cluster_jl_orient.m : Weighted (or not), oriented version of algorithm 
 using extended definition of modularity for oriented graphs 

cluster_jl_orientT.m : Weighted (or not), oriented version of algorithm 
 using symetric matrix A = M*M^t 

*** USAGE - Matlab/C++

You need to compile jl_clust.cpp, jl_mnew.cpp and jl_clust_orient.cpp
with mex compiler. Then you can use the following routines to perform
the community detection faster.

cluster_jl_cpp.m : Weighted (or not), non oriented version of algorithm 
 matrix is symetrized using sum of incoming and outgoing weights)

cluster_jl_orient_cpp.m : Weighted (or not), oriented version of algorithm 
 using extended definition of modularity for oriented graphs 

cluster_jl_orientT_cpp.m : Weighted (or not), oriented version of algorithm 
 using symetric matrix A = M*M^t 
 
3. Kmeans
Kmeans.py is the implementation of Kmeans.
4. Spectral Clustering
 SpectralClustering.py is the implementation of SpectralClustering.
5. Seurat
Seurat.R is the implementation of Seurat. 
6. SNN_Cliq
SNN.m and cliq.py are the implementation of SNN-Cliq.
7. SINCERA
sincera.r is the implementation of SINCERA.
