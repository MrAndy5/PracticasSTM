function x = invalaw(y,A)
% Inversa de A-Law (G.711). Misma idea que invmulaw.m.
if nargin<2 || isempty(A), 
    A=87.6; 
end

ay = abs(y); 
s = signum(y);
den = 1+log(A); 
th = 1/den;

x = zeros(size(y));
low  = ay < th;
x(low)  = (ay(low) .* den) ./ A;
x(~low) = (1./A) .* exp(ay(~low).*den - 1);
x = s .* x;