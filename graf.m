function graf(x0, v0, tv1, X, g, barva, odmik, debelina, zadnji)
%GRAF narise potovanje zogice znotraj od zacetne tocke x0 do točke odboja
%graf(x0, v0, tv1, X, g, barva, odmik, debelina, zadnji)
%v0...vektor [v0(1); v0(2)] zacetne hitrosti zogice
%x0...vektor [x0(1); x0(2)] zacetne pozicije zogice
%tv1...cas, ki ga zogica potrebuje, da pride do tocke odboja
%X...koordinate sticisc (ter zacetna in koncna tocka) palic diskretne verižnice
%g...teznostni pospesek
%barva...[R,G,B] podaja RGB barvo zogice
%odmik...dodatna velikost okna izrisa slike od veriznice
%debelina...debelina zogice
%zadnji...1 ali 0. 1, če je to zadnji prikazani odboj
hold on;
axis([X(1,1)-odmik, X(1,end)+odmik, min(X(2,:))-odmik, X(2,end)+odmik]);

x = @(t) x0(1) + v0(1)*t;
y = @(t) x0(2) + v0(2)*t - (g*t.^2)/2;

korak = 0.02;
T = 0:korak:tv1;

for t = T
    axis([X(1,1)-odmik, X(1,end)+odmik, min(X(2,:))-odmik, X(2,end)+odmik])
    plot(X(1,:),X(2,:),'color','k','LineWidth',5,'MarkerSize',2,'MarkerFaceColor',[0,0,1]);
    if t~=T(1)
        plot(x(t-korak), y(t-korak), '.', 'color', 'w', 'markersize', debelina-2);
    end
    plot(x(t), y(t), '.', 'color', barva, 'markersize', debelina);
    pause(0.000001);
end
if ~zadnji
    plot(x(T(end)), y(T(end)), '.', 'color', 'w', 'markersize', debelina-2);
end
hold off;

end

