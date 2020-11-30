function [ a,b ] = state2coordinate( state,N )
%TODO: Durum bilgisi kare seklindeki labirentin kenar uzunluguna gore uygun
%koordinatlara cevrilmelidir. Ornegin 7. durum (1,7), 20. durum (2,10),
%36. durum (4,6) koordinat noktalarini ifade eder. Fonksiyon verilen durum
%ve kenar uzunlugu icin ilgili koordinat bilgisini dondurmelidir.
if state <= 10
    a = 1;
    b = state;
elseif state >10 && state <= 20
    a = 2;
    b = state -10;
elseif state > 20 && state <= 30
    a = 3;
    b = state -20;
elseif state > 30 && state <= 40
    a = 4;
    b = state - 30;
elseif state > 40 && state <= 50
    a = 5;
    b = state - 40;
elseif state > 50 && state <= 60
    a = 6;
    b = state - 50;
elseif state > 60 && state <= 70
    a = 7;
    b = state -60;
elseif state > 70 && state <= 80
    a = 8;
    b = state -70;
elseif state > 80 && state <= 90
    a = 9;
    b = state - 80;
elseif state > 90 && state <= 100
    a = 10;
    b = state -90;
end 


end

