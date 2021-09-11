------------
# Assignment 3
------------

## Description:

The topics of this assignment are:
Implementation of SIFT (Scale Invarient Feature Extraction) DETECTOR
- Space Scales and Difference-of-Gaussians (DoGs) calculation.
- Salient Keypoints detection.
- Filtering of salient keypoints


## Files:

- demo1.m 		: Demostration of the DoGs and SpaceScales
- demo2.m		: Demonstration of the detected keypoints plotted on DoGs.
- my2DGaussianFilter.m  : Implementation of the Gaussian Filter
- my2DGaussianFilter2.m : Slightly different Implementation of the Gaussian Filter
			  with far better results, it is the one used in demo files.

- myDoGs.m		: An Implementation of Lowe's method for finding Differences
			  of Gaussians.
- myDoGs2.m		: Slightly different Implementation of Lowe's method 
			  for finding Differences of Gaussians, with far better results
			  and the one used in demo files.

- sigmas.m		: helper function for myDoGs.m
- myKeypoints.m  	: Function that returns the position of the keypoints and
			  their ID -> (o,s)
- discardLowContrasted.m: Function to filter the keypoints given a threshold.

- report.pdf		: Report for the assignment.


Kavelidis Frantzis Dimitrios					12/7/2021
