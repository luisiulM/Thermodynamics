%% save 5 lines below to separate file < C.m > for calculator to work
function combinations = C(n, m)
A = 1:n;
B = [1:n-m, 1:m];
combinations = prod(A./B);
end

