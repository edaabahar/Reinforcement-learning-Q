function [ maze ] = random_maze(N,r)
%Karesel labirentin kenar uzunlugu ve verilen r degerine gore
%0 ve 1 lerden olusan bir matris uretilir. Bu matris gorsellestirilince
%0 degerleri siyah alanlari (engel) 1 degerleri bos alanlari gosteren bir labirent elde
%edilir.
maze_temp = ones(N, N);
for i = 1 : N
    for j = 1 : N
        if rand < 0.01 * r
            maze_temp(i,j) = 0;
        end
    end
end
%labirentin baslangicinin ve sonunun bos oldugundan emin olmak icin
%asagidaki atamalar yapilir.
maze_temp(1,1)=1;
maze_temp(N,N)=1;
maze = maze_temp;

end
%Bu yapi ile cozulemeyen labirentler de ortaya cikabilir. Bu labirentlerde
%giriş ve cikis arasinda bir yol bulunmayabilir. Labirentin boyle olmasini
%engelleyecek sekilde bu kod gelistirilebilir.
