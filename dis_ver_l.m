function X = dis_ver_l(u0, zac, L, M)
%DIS_VER_L
%X...je 2*(2p+2)matrika koordinat stičišč palic diskretna verišnice na liho
%mnogo palicah
%u0...začetni približek za parameter u
%zac=[x0 x2p2 y0]...položaj začetnih koordinat (y2p2 = y0)
%L...1*(p+1) vektor dolžin palic
%M...1*(p+1) vektor mase palic (palice so homogene)

p = length(M)-1;
n = 2*p;

L = [L(1:end-1), flip(L)];
M = [M(1:end-1), flip(M)];

mi = zeros(1,n);
mi = 1/2*(M(1:end-1)+M(2:end));
vsote_mi = [0 cumsum(mi)];

enacba = @(u) enacba_u(u, zac, L, vsote_mi);
u = fzero(enacba, u0);

pom =u*(vsote_mi(p+1) - vsote_mi);
xi = L./(1+pom.^2).^(1/2);
eta = xi.*pom;

X = [zac(1), zac(1) + cumsum(xi);zac(3), zac(3) + cumsum(eta)];
end