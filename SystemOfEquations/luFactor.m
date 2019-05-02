%% Abdulaziz Abuhaimed
%% Mech 105 
%% Assignment 16 
function [L,U,P] = luFactor(A)

    %Error checking
    %make sure there is an input
    if nargin<1
        error('Please input a square matrix, exiting function')
    end
    
    %make sure the input is a matrix
    if length(size(A)) ~=2
        error('The input is not a 2 dimensional array, exiting function')
    end
    
    %make sure the matrix is square
    if length(A(:,1)) ~= length(A(1,:))
        error('The input is not a square matrix, exiting function')
    end
        
    %sample
    test = 0;

    if(test)
        %A = [10 2 -1; -3 -6 2; 1 1 5];
        %A([3 1],:) = A([1,3],:);
        %A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
        %A = [0.0003 3; 1 1]
    end

    %main code
    %determine a LU factorization of a square matrix using partial pivoting.

    [m,n] = size(A);
    
    %matrix of replaced rows (partial pivot)
    P = eye(m,n);
    L = P;
        
    for k = 1:m-1
        
        %check if max of column is in the "row", swap rows if not
        [maxval,rowmax] = max(abs(A(:,k)));
        
        if rowmax > k
            A([k,rowmax],:) = A([rowmax,k],:);
            P([k,rowmax],:) = P([rowmax,k],:);
        end
        
        %normalize the pivot by dividing that row
        %A(k,:) = A(k,:)/A(k,k);
        
        %Gaussian elimination, make values below the pivot = 0
        %if k ~= m
            for kk = k+1:m
                L(kk,k) = L(kk,k)+A(kk,k)/A(k,k);
                A(kk,:) = A(kk,:) - A(kk,k)*A(k,:)/A(k,k);
            end
        %end
        
        
        
    end
    
    U = A;
    L;

    %Check if sample is right
    if(test)
        %L*U
    end
end
