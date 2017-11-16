function [N,V] = zogica_odboji(n, opcije_zogica, opcije_veriznica, odmik, debelina, narisi)
%ZOGICA_ODBOJI izracuna tocke odbojev in izhodne hitrosti po odbojih
%[N,V] = zogica_odboji(n, opcije_zogica, opcije_veriznica, odmik, debelina, narisi)
%n...stevilo odbojev
%opcije_zogica: v0, x0
%opcije_veriznica: u0, zac, L, M
%v0...vektor [v0(1); v0(2)] zacetne hitrosti zogice
%x0...vektor [x0(1); x0(2)] zacetne pozicije zogice
%u0...zacetni priblizek za iskanje nicle enacbe_u
%zac=[x0 x2p2 y0]...položaj začetnih koordinat verižnice (y2p2 = y0)
%L...1*(p+1) vektor, ki od leve proti desni podaja dolžine palic
%M...1*(p+1) vektor, ki od leve proti desni podaja mase palic
%odmik...dodatna velikost okna izrisa slike od veriznice
%debelina...debelina zogice (najbolje od 12-20)
%narisi...vrednost 0 ali 1 za izris potovanja zogice
%N...seznam točk odbojev
%V...seznam začetnik hitrosti po odboju
if nargin < 6
    narisi = 1;
end
if nargin < 5
    debelina = 18;
end
if nargin < 4
    odmik = 2;
end
v0 = opcije_zogica.v0;
x0 = opcije_zogica.x0;
u0 = opcije_veriznica.u0;
zac = opcije_veriznica.zac;
L = opcije_veriznica.L;
M = opcije_veriznica.M;

N = zeros(2,n+1);
V = zeros(2,n+1);
T = zeros(1,n);

g = 9.8;

X = dis_ver_l(u0, zac, L, M);

for i=1:n
    N(:,i) = x0;
    V(:,i) = v0;
    [p, v_out, tv1] = odboj(v0, x0, X, odmik);
    T(i) = tv1;
    if narisi
        if i==n
            zadnji = 1;
        else
            zadnji = 0;
        end
        graf(x0, v0, tv1, X, g, [i/n,0,1-i/n], odmik, debelina, zadnji)
    end
    if v_out == [Inf, Inf]
        break
    end
    v0 = v_out;
    x0 = p;
end
N(:,n+1) = x0;
V(:,n+1) = v0;

end

