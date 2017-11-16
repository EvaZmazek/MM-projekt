function tv1 = presecisce_z_robom_ekrana(x0, v0, X, odmik)
%PRESECISCE_Z_ROBOM_EKRANA izracuna presecisce v primer, da zogica zleti iz
%veriznice
%tv1 = presecisce_z_robom_ekrana(x0, v0, X, odmik)
%v0...vektor [v0(1); v0(2)] zacetne hitrosti zogice
%x0...vektor [x0(1); x0(2)] zacetne pozicije zogice
%X...koordinate sticisc (ter zacetna in koncna tocka) palic diskretne verižnice
%odmik...dodatna velikost okna izrisa slike od veriznice

n = length(X);
p = n/2;

g = 9.8;

xmin = X(1,1)-odmik;
xmax = X(1,end)+odmik;
ymin = X(2,p)-odmik;
ymax = X(2,1)+odmik;

if v0(1)>0 && v0(2)>0
    tx = (xmax-x0(1))/v0(1);
    tv1 = tx;
elseif v0(1)>0 && v0(2)<=0
    tx = (xmax-x0(1))/v0(1);
    ty = (v0(2)-sqrt(v0(2)^2-4*(ymin-x0(2))*(g/2)))/(2*(ymin-x0(2)));
    tv1 = min(tx, ty);
elseif v0(1)<0 && v0(2)>0
    tx = (xmin-x0(1))/v0(1);
    tv1 = tx;
elseif v0(1)<0 && v0(2)<0
    tx = (xmin-x0(1))/v0(1);
    ty = (v0(2)-sqrt(v0(2)^2-4*(ymin-x0(2))*(g/2)))/(2*(ymin-x0(2)));
    tv1 = min(tx, ty);
end

