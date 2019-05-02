# Details
This code is used to generate the LU factorization of a matrix using partial pivoting

# Code Format
[L,U,P] = luFactor(A)

## Inputs
A is the input square matrix

## Outputs
L is the generated Lower matrix  
U is the generated Upper matrix  
P is the permutation matrix to account for partial pivoting

## Errors & Adjustments
The input matrix must be a square matrix  
Guassian Elimination is being used with partial pivoting
