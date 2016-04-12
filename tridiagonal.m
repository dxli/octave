#tridiagonal matrix by Householder
function [Q, D] = tridiagonal(M)

[nr, nc] = size(M);
L1 = ones(nr);
L2 = ones(nr);
Q = eye(nr);
D = M;
if (nr != nc)
	return;
endif

c = M(2:3, 1);
s = norm(c);
if (s < 1e-14)
	return;
endif

sg = 1
if (M(2, 1) < 0)
	sg = -1;
endif

z = (1 + sg * M(2, 1)/s)/2;
vk1 = sqrt(z);
v = [0; vk1; sg * M(3,1)/(2 * vk1 *s)];
Q = eye(3) - 2 * v*v';
D = Q*M*Q;

endfunction
