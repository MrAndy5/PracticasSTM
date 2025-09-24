function [sqnr,m_quan,code]=alaw_pcm(m_samp,L,A)
% Igual estructura que mulaw_pcm.m pero con A-Law.
if nargin<3 || isempty(A), 
    A=87.6; 
end

[y,m_max] = alaw(m_samp,A);
[~,yq,code] = uniform_pcm(y,L);
x = invalaw(yq,A);
m_quan = m_max * x;
sqnr = 20*log10(norm(m_samp)/norm(m_samp - m_quan));