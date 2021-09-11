------------
# Assignment 2
------------

## Description:

The topics of this assignment are:
- Representation of Images as graphs
- Image segmentation using Spectral Clustering
- Image segmetentation using Normalized-cuts

## Files:

Images: 
- apple.png, cars.jpg, mario.jpg, owl.png, pika.png

Code:
- Image2Graph.m 		: Takes an image with n channels and returns the affinity
matrix that describes the non directional graph G = (V,E)

- mySpectralClustering.m  	: It segments the input graph using the Spectral Clustering
method and returns the labels of the pixels for each cluster. Choosing 2 as metric
results to a modified version of the traditional Spectral Clustering.

- demo1.m 			: Demonstration of mySpectralClustering.m
- demo2.m 			: Demonstration of Image2Graph.m and mySpectralClustering.m
Image segmentation with spectral clustering / k-means

- myNCuts.m 			: It segments the input graph using the non recursive
N-cuts method and returns the labels of the pixels for each cluster.

-demo3a.m 			: Demonstration of the Non Recursive version of N-Cuts

- calculateNcut 		: Describes the metric Ncut(A,B) = 2 - Nassoc(A,B),
returns the ncut value.

- myNCutsRecursive		: Image segmentation using the the recursive version of
n-cuts method. Segments the input graph using T1,T2 thresholds.

- PartitionNCuts.m 		: Helper function - Implementation of the myNCutsRecursive
Partition. Segments the input graph using T1,T2 thresholds.

- demo3b.m 			: Recursive n-cut demonstration for 1 step
Image segmentation with recursive n-cut for 1 step and comparison with
mySpectralClustering for k = 2.

- demo3c.m 			: Recursive n-cut demonstration and comparison of all methods.

Helper Functions:

- Using the image from the first assignment with the march.mat data and the functions
bayer2rgb.m and myresize.m to generate an image ready for testing.

- Lab2Im.m 			: Takes the labels of the clusters (clusterIdx) and
returns the reshaped, flipped and rotated ( = transposed) matrix of labels which can be
shown as the clustered image.

- myFilter 			: A simple implementation of a low pass filter to smooth the
images before clustering.

- report.pdf 			: The report for the assignment.

Dimitrios Kavelidis Frantzis									26/5/2021
