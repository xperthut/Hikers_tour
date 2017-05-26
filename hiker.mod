reset;

param n;
param L;
param C {(i,j) in {1..n cross 1..n}} >=0 integer;
var x {(i,j) in {1..n cross 1..n}} binary;
var u {(i,j) in {1..n cross 1..n}} >=0 integer;

minimize z: sum{i in 1..n}sum{j in 1..n}x[i,j]*C[i,j];

subject to c1: sum{i in 1..n}x[1,i]>=1;
subject to c2 {i in 1..n}:sum{j in 1..n}(x[i,j]-x[j,i]) = 0;
subject to c3: sum{i in 1..n}sum{j in 1..n}x[i,j]*C[i,j] >= L;
subject to c4 {i in 1..n, j in 1..n}: u[i,j]>=x[i,j];
subject to c5 {i in 1..n, j in 1..n}: u[i,j]<=sum{k in 1..n}sum{l in 1..n}x[k,l];
subject to c6 {i in 2..n}: sum{j in 1..n}(u[i,j]-u[j,i]-x[i,j]) = 0;
subject to c7:sum{j in 1..n}(u[1,j]-u[j,1]-x[1,j])+sum{i in 1..n}sum{k in 1..n}x[i,k] = 0;
subject to c8 {i in 1..n, j in 1..n}: x[i,j]*C[i,j]<=9999;