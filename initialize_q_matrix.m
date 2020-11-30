function [ q_matrix ] = initialize_q_matrix( N, actions )
%TODO:q matrise uygun sekilde ilk deger atanmalidir ve bu matris geri
%dondurulmelidir. Bir kenar uzunlugu N olan karesel labirentler uzerinde
%calisiyor oldugumuz icin matris N*N,actions boyutunda olmalidir. q
%matrisimizde N*N adet durum ve actions adet davranis olmalidir. Bizim
%sistemimiz icin actions 4 olarak kullanilacak. Matrise ilk degerler
%atanirken her elemana 0 vermek iyi bir fikirdir. Ancak kesin olarak
%yapilmayacak hareketler farkli sekilde ornegin -inf ile ifade edilebilir.
%Ornegin 1. durumda yukari yonlu hareket hicbir sekilde yapılamaz bu yuzden
%q matriste bu degere -inf seklinde ilk deger verilebilir.

%100'e 4'luk sıfırlardan bir array
temp_q = zeros(N*N,actions);
%yukari,sag,sol,asagi

%ust kenar yukari hareketi yasak
for i=1:10
    temp_q(i,1) = "-inf";
end
%alt kenar asagi hareketi yasak
for i=91:100
    temp_q(i,4) = "-inf";
end
%sol kenar sol hareketi yasak
i = 1;
while i <= 91
    temp_q(i,3) = "-inf";
    i = i+10;
end
%sag kenar sag hareket yasak
i = 10;
while i<=100
    temp_q(i,2) = "-inf";
    i = i+10;
end

q_matrix = temp_q;


end

