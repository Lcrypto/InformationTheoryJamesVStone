Summary of MatLab code for book: Information Theory: A Tutorial Introduction, JV Stone.
Timestamp: 22nd February 2015.

The number in each file name refers to the relevant figure or table in the book,
e.g. the file infotheory1_6_v2.m refers to Figure 1.6.

This code can be downloaded from:
MATLAB: http://jim-stone.staff.shef.ac.uk/BookInfoTheory/InfoTheoryMatlab.html
PYTHON: http://jim-stone.staff.shef.ac.uk/BookInfoTheory/InfoTheoryPython.html

License. All code by JVStone is free software:  you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation,  either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

infotheory1_6_v2.m
 Printed output:
 Entropy of binary image is Hbinary = 0.8505 bits/pixel.
 Entropy of image grey-levels is H = 7.8377 bits/pixel.
 Entropy of grey-level differences is Hdiff = 5.9356 bits/pixel.

infotheory_3_2_v1.m
 Printed output:
 Entropy of dice outcomes is H=3.2744 bits/throw.
 Entropy of dice using n=500 simulated outcomes is H=3.2247 bits/throw.

infotheory_3_8_v1.m
 Purpose: Estimate the entropy of a two letter sequence from a sequence of English text.
 Printed output:
Average entropy of each letter in each pair is H=3.7298 bits/letter.

infotheory4_1_v1.m
 Summary: Estimates entropy of joint X,Y distribution in Table 4.1, entropy of
 marginal distributions (p(X) and p(Y)), and mutual information between X and Y. 
 Printed output:
 XYcounts =
     12    15     2     0
      4    21    10     0
      0    10    21     4
      0     2    15    12
 
 Eq. 4.42 H(X)		= 1.81 bits
 Eq. 4.45 H(Y)		= 1.99  bits
 Eq. 4.46 H(X,Y)		= 3.30  bits
 Eq. 4.48 H(X)+H(Y)	= 3.80  bits
 Eq. 4.51 I(X,Y)		= 0.509  bits
 Eq  4.63 H(noise) 	= 1.48  bits

infotheory4_8_v1.m
 Printed output:
 Summary: Estimates entropy of figure 4.8a (input X) and 4.8b (outpuit Y), and mutual information between X and Y. 
 Printed output: 
 Eq. 4.68 H(X)		= 0.850 bits
 Eq. 4.71 H(Y)		= 0.906 bits
 Eq. 4.75 H(X,Y)	= 1.32 bits
 Eq. 4.78 I(X,Y)	= 0.436 bits
 Eq. 4.81 H(X|Y)	= 0.415 bits
 Eq. 4.84 H(noise)	= 0.470 bits
 Eq. 4.88 H(noise)	= 0.469 bits (analytic)

infotheory5_2_v1.m
 Summary: Estimates entropy of Gaussian histograms with different bin widths and compares these to the known underlying differential entropy.
 Printed output:
 Analytic differential entropy of Gaussian distribution with standard deviation = 1.000 is H = 2.04710 bits.

 For sampled data: binwidth 		 = 1.000
 entropy of histogram			= 2.104 bits
 differential entropy of histogram	= 2.104 bits
 
 For sampled data: binwidth 		 = 0.500
 entropy of histogram			= 3.061 bits
 differential entropy of histogram	= 2.061 bits
 
 For sampled data: binwidth 		 = 0.100
 entropy of histogram			= 5.369 bits
 differential entropy of histogram	= 2.047 bits
  
infotheory7_1_v1.m
 Summary: The code recreates the Figure 7.1 P155, using Eq. 7.18, which shows how channel capacity increases with signal to noise ratio.
 A channel which transmits 1000 values per second has a capacity C.
 C depends on the amount of channel noise variance N.
 Input values have a variance P.
 If the channel transmits 1000 values/s then the channel capacity is C = 1000/2 log(1+P/N) bits/s.

infotheory7_2_v1.m
 Summary: The code recreates Figure 7.2 P155, using Eq. 7.40, which shows how the error rate increases with message length.

FUNCTIONS

 H = entropy_from_data(data,values)
 Argument: data is a sample of from some probability distribution.
 values is a list of values to be found in data. 
 Returns: An estimate of entropy of data.
 Comment: Uses log base 2, so the answer is in units of bits.

 H = entropy_from_probabilities(p)
 Argument: p is a distribution of probabilities.
 Returns: An estimate of entropy of p.
 Comment: Uses log base 2, so the answer is in units of bits.

 [ent, X, N] = diffentropyfromsamples(x,binwidth,xmin,xmax)
 Function entropyfromsamples.m.
 Estimate differential of data x based on histogram with binwidth specified by user.
 Input: x = samples from a distribution.
 binwidth = width of bins to be used to quantise sample values.
 xmin, xmax: ignore values outside of this range.
 fignum optional: plot histogram in this figure number.
 stitle optional: give figure this title.

END OF FILE.