function M = createQuad(L1, L2)

M = eye (size(L1), size(L1));

if (size(L1) != size(L2))
	return;
endif

M = L1' * L2;

# symmetric
M = (M + M') * 0.5;

endfunction
