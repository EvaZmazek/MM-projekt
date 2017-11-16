opcije_veriznica.u0 = 0;
opcije_veriznica.zac = [1,7,5];
opcije_veriznica.L = [2,2,1,2,1,2,1];
opcije_veriznica.M = [5,8,2,4,1,1,1];
opcije_zogica.v0 = [2;10];
opcije_zogica.x0 = [2;1];
debelina_zogice = 16;
odmik_sirine_okna_od_veriznice = 2;
narisi = 1;

[N1, V1] = zogica_odboji(20, opcije_zogica, opcije_veriznica, odmik_sirine_okna_od_veriznice, debelina_zogice, narisi);

clf;

%DODATNI ZANIMIVI PRIMERI
opcije_zogica.v0 = [3;9];
opcije_zogica.x0 = [2;1];

[N2, V2] = zogica_odboji(20, opcije_zogica, opcije_veriznica);

clf;

opcije_zogica.v0 = [0;9];
opcije_veriznica.L = [2,7,1,2,1,2,1];
opcije_veriznica.M = [5,8,2,6,1,5,1];

[N3, V3] = zogica_odboji(20, opcije_zogica, opcije_veriznica);
