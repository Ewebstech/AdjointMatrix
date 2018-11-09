% Creates a symbolic matrix of n rows and n cols of the form...
% [ 1, m12, m13, m14]
% [ 0,   1, m23, m24]
% [ 0,   0,   1, m34]
% [ 0,   0,   0,   1]
% and finds X = inv(A) * B for both the Upper Triangular and the 
% Lower Triangular form, e.t.c.
% 
% Usage: Run script and input value for N>> when asked
% Written by, Emmanuel C. Paul
% Affiliation: University of Ilorin, Nigeria
% Email: ewebstech@gmail.com
clearvars;
clc;
n = input('Input Value for N >> ');
% Creates 
A = sym(zeros(n,n));
B = sym(zeros(n,1));
for rows = 1:n
    zero_pos = rows - 1;
    for cols = 1:n
        if(zero_pos > 0)
            mat_data = sym(0);
        elseif(zero_pos == 0)
            mat_data = sym(1);
        else
        mat_data = sym(sprintf('m%d%d',rows,cols));
        end
        A(rows,cols) =  mat_data;
        zero_pos = zero_pos - 1;
    end
    % Define B
    B(rows,:) = sym(sprintf('c%d/(1+m%d%d)',rows,rows,cols));
end
disp([num2str(n) ' by ' num2str(n) ' Symbolic Matrix generated!: '])
disp('Upper Triangular Matrix form of A :>>')
UTM = A % displays result for the matrix A
disp('Lower Triangular Matrix form of A :>>')
LTM = A.' % displays the nonconjugate transpose of A
disp('Result for B :>>')
B % displays result for the matrix B
% To find x1, x2, ..., xn, we find the X = inv(A) * B
disp('Inverse of A (Upper Triangular Matrix) :>>')
A_inv = inv(UTM)
disp('Adjoint of Matrix A (Upper Triangular Matrix) :>>')
Adjoint_A = adjoint(UTM)
disp('Result for X = inv(A)*B (Upper Triangular Matrix) :>>')
X = inv(UTM) * B
disp('Simplified Version of X (Upper Triangular Matrix) :>>')
X_simplified = simplify(X)
% Defining also in the LTM form
disp('Inverse of A (Lower Triangular Matrix) :>>')
A_inv = inv(LTM)
disp('Adjoint of Matrix A (Lower Triangular Matrix) :>>')
Adjoint_A = adjoint(LTM)
disp('Result for X = inv(A)*B (Lower Triangular Matrix) :>>')
X = inv(LTM) * B
disp('Simplified Version of X (Lower Triangular Matrix) :>>')
X_simplified = simplify(X)

Adjoint_of_A_times_B = Adjoint_A * B;



