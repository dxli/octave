# split a degenerate quadratic form into linear forms
# M is expected to degenerated and symmetric
function [L1, L2] = linearReduction(M)
[nr, nc] = size(M);
L1 = ones(nr);
L2 = ones(nr);
if (nr != nc)
	return;
endif

#tridiagonal
[T, D] = tridiagonal(M);

# QR decomposition
[Q, R] = qr(D);

#2x2 sub-matrix
M2 = (R * Q)(1:2, 1:2);

# range space of Q
Qp = Q(:, 1:2);

# eigen decomposition of M2
[V, E] = eig(M2);

if (E(1) < E(2))
	exchg = [0 1; 1 0];
	e0 = E(1, 1);
	E(1, 1) = E(2, 2);
	E(2, 2) = e0;
	V = V * exchg;
endif


ML = V' * Qp' * T;

c1 = sqrt(E(1, 1));
c2 = sqrt(-E(2, 2));
L1 = [c1 c2] * ML;
L2 = [c1 -c2] * ML;

endfunction


