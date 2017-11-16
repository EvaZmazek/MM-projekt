function p = izberi_presecisce(x0, v0, presecisce, y, eps)
%IZBERI_PRESECISCE izbere tocko odboja med mnozico presecisc paraboje
%z veriznico
%x0...vektor [x0(1); x0(2)] zacetne pozicije zogice
%v0...vektor [v0(1); v0(2)] zacetne hitrosti zogice
%presecisce...vektor presecisc parabole in veriznice

if length(presecisce) >= 2
    if v0(1)>0
        p = [presecisce(end); y(presecisce(end))];
    else
        p = [presecisce(1); y(presecisce(1))];
    end
elseif length(presecisce) == 1
    if abs(presecisce(1) - x0(1)) < eps
        p = [Inf; Inf];
    else
        p = [presecisce(1); y(presecisce(1))];
    end
else
    p = [Inf; Inf];
end
end