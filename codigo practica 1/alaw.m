function [y,m_max]=alaw(m_samp,A)
% A-Law (G.711). Misma filosofía que mulaw.m: devuelve y y m_max.
if nargin<2 || isempty(A), A=87.6; 
end
m_max = max(abs(m_samp));
if m_max==0, 
    y = m_samp; 
    return; 
end

x  = m_samp / m_max;           % normaliza [-1,1]
ax = abs(x); 
s = signum(x);
th = 1/A;  
den = 1+log(A);

y = zeros(size(x));
low  = ax < th;
y(low)  = (A .* ax(low)) ./ den;
y(~low) = (1 + log(A .* ax(~low))) ./ den;
y = s .* y;