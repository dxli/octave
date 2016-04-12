function testLinear(n)
j = 0;
mErr = 0;
for i = 1:n
	MR = unifrnd(-1., 1., 3);
	L1 = MR(1, :);
	L2 = MR(2, :);
	M = createQuad(L1, L2);
	[L10, L20] = linearReduction(M);
	if (abs(dot(L1, L10)) < abs(dot(L1, L20)))
		L3 = L10;
		L10 = L20;
		L20 = L3;
	endif
	if (abs(dot(L1, L10)) < norm(L1)*norm(L10)*(1 - 1e-8))
		disp("failed");
		disp(L1, L2);
	else
		j = j + 1;
		err = abs(norm(L1)*norm(L10) -  abs(dot(L1, L10)));
		#printf("%d: %g\n", j, err);
		if (err > mErr)
			mErr = err;
		endif
	endif

end
printf("%d of %d passed\tMax error = %g\n", j, n, mErr);
endfunction
