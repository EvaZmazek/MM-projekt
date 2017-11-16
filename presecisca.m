function presecisce = presecisca(n, x0, v0, g, X, koeficienti)
%PRESECISCA poišče presečišča parabole, ki jo podajata x0 in v0 ter 
%verižnice, podane s X
%n...stevilo clenkov veriznice, podane z X
%x0...vektor [x0(1); x0(2)] zacetne pozicije zogice
%v0...vektor [v0(1); v0(2)] zacetne hitrosti zogice
%g...teznostni pospesek
%X...koordinate sticisc (ter zacetna in koncna tocka) palic diskretne verižnice
%koeficienti...koeficienti premic, ki predstavljajo clene veriznice
%y...funkcija, odvisna od parametra x, ki podaja parabolo gibanja zogice
%presecisce...vektor presecisc parabole in veriznice

presecisce=[];
for i = 1:n
    a = g/(2*v0(1)^2);
    b = koeficienti(i)-v0(2)/v0(1);
    c = koeficienti(i)*(x0(1)-X(1,i)) + (X(2,i)-x0(2));
    D = b^2-4*a*c;
    pre1 = x0(1) + (-b-sqrt(D))/(2*a);
    pre2 = x0(1) + (-b+sqrt(D))/(2*a);
    if X(1,i)<=pre1 && pre1<=X(1,i+1)
        presecisce = [presecisce, pre1];
    end
    if X(1,i)<=pre2 && pre2<=X(1,i+1) && pre2~=pre1
        presecisce = [presecisce, pre2];
    end
end
end