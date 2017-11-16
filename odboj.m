function [p, v_out, tv1] = odboj(v0, x0, X, odmik)
%ZOGICA_ODBOJI 
%[p, v_out, tv1] = odboj(v0, x0, X, odmik)
%v0...vektor [v0(1); v0(2)] zacetne hitrosti zogice
%x0...vektor [x0(1); x0(2)] zacetne pozicije zogice
%X...koordinate sticisc (ter zacetna in koncna tocka) palic diskretne verižnice
%odmik...dodatna velikost okna izrisa slike od veriznice
%p...tocka [p(1); p(2)], kjer se zogica odbije od veriznice
%v_out...zacetna hitrost [v_out(1); vout(2)] takoj po odboju
%tv1...cas, ki ga zogica potrebuje, da pride do tocke odboja
p = zeros(2);
eps = 1.0e-15;
n = length(X) - 1;
g = 9.8;
koeficienti = (X(2,2:end)-X(2, 1:end-1))./(X(1,2:end)-X(1,1:end-1));

if v0(1) == 0
    if x0(1)>X(1,1) && x0(1)<X(1,end)
        odsek = find(sort([X(1,:), x0(1)])==x0(1))-1;
        p = [x0(1); koeficienti(odsek)*(x0(1)-X(1,odsek)) + X(2,odsek)];
        tv1 = (v0(2) + sqrt(v0(2)^2-2*g*(p(2)-x0(2))))/g;
        v1 = [0; v0(2)-g*tv1];
    else
        p = [Inf; Inf];
    end
else
    y = @(x) x0(2) + (x-x0(1)).*(v0(2) - g*((x-x0(1))/v0(1))/2)/v0(1);
    presecisce = presecisca(n, x0, v0, g, X, koeficienti);
    p = izberi_presecisce(x0, v0, presecisce, y, eps);
    tv1=(p(1)-x0(1))/v0(1);
    v1 = [v0(1); v0(2)-g*(p(1)-x0(1))/v0(1)];
end

if p ~= [Inf; Inf]
    odsek = find(sort([X(1,:), p(1)])==p(1))-1;
    smerni = [1;koeficienti(odsek)];
    pravokotna_projekcija = (v1'*smerni)/norm(smerni);
    v_out = -v1 + 2*pravokotna_projekcija*smerni/norm(smerni);
else
    tv1 = presecisce_z_robom_ekrana(x0, v0, X, odmik);
    v_out = [Inf, Inf];
end