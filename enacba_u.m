function R = enacba_u(u, zac, L, vsote_mi)
%ENACBA_U vrne enacbo U(u), katere nicla je u, ki ga potrebujemo za
%nadalnje racunanje
%u...spremenljivka
%zac=[x1 x2p2 y1]...položaj začetnih koordinat (y2p2 = y1)
%L...1*(2p+1) vektor dolžin palic
%vsote_mi...vektor vsot \sum\limits_{j=1}^{i-1}\mu_{j}

n = length(L)-1;
p = n/2;

x1 = zac(1);
xn2 = zac(2);

pom =u*(vsote_mi(p+1) - vsote_mi);
xi = L./(1+pom.^2).^(1/2);

R = sum(xi)-(xn2-x1);
end

