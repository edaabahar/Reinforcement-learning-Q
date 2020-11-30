tic
clear %workspace'te tutulan degiskenler temizlenir.
clc %command window temizlenir.
iteration = 100; %iterasyon sayisi
N = 10; %karesel labirentin kenar uzunlugu
r = 20; %labirentteki siyah kare sayisinin buyuklugunu etkileyen sayi
discount_rate = 0.25;
learning_rate = 0.25;
action_number = 4; %yapilabilecek 4 cesit hareket var.
action_choices = [-N,1,-1,N]; %bu 4 hareketin durum bilgisinde sebep olacagi degismeler. (sirasiyla yukari,saga,sola ve asagi bir birim hareket)
initial_state = 1; %baslangicta sol ust kosedeyiz (1. durum).
goal_state = N*N; % hedef nokta ise sag alt kose (N*N. durum).
reward = 0; %reward degiskenine ilk degeri verilir.
maze = random_maze(N,r); % rastgele labirent uretilir.

%TODO: Q matrix'e ilgili fonksiyon ile ilk degerini atayalim.
Qmatrix = initialize_q_matrix(N,action_number);



for episode = 1 : iteration %Iterasyonlar baslasin.
    disp(['Iteration number: ',num2str(episode)]);
    %Her iterasyonda üzerinden gecilen durum degerlerinin tutulacagi liste. ilk eleman daima initial_state olmali. 
    instance=[];
    j=1;
    instance(j)=initial_state;
    j=j+1;
    current_state = initial_state; % current_state, initial_state olur.
    while 1
        %TODO: while dongusu ile current_state labirent ve simulasyon uzerinde
        %gosterilmeli
        %disp(current_state);
        %[coorx,coory] = state2coordinate(current_state);
        %maze(coorx,coory) = 0.5;
        %imagesc(maze);
        %colormap(gray(256));
        %drawnow;
        %maze(coorx,coory) = 1;
 
       %TODO: hedef noktaya ulasilmis ise while dongusu bitirilmeli, aksi
       %takdirde q matris uzerinden davranis ve gidilecek yeni durum secilmeli.
       if current_state == N*N
           break
       end

        %TODO: Gidilecek yeni durum icin reward degeri belirlenmeli ve q
        %matrix guncellenmeli.
        
        % su anki state'de action secimi yapiyor
        [next,action] = max(Qmatrix(current_state, :));
        %disp(action);
        nextState = current_state + action_choices(action);
        [x,y] = state2coordinate(nextState,N);
        if nextState == goal_state
            reward = 20;
        elseif maze(x,y) == 0
            reward = -10;
        else
            reward = -1;
        end
        
        [a,b] = state2coordinate(current_state, N);
        
        Qmatrix(current_state,action) = Qmatrix(current_state,action) + learning_rate*(reward + discount_rate * max(Qmatrix(nextState, :))-Qmatrix(current_state,action));
        
        
      %TODO: Eger gidilecek yeni durum beyaz yani uygun bir bölge ise
      %current_state ve instance array'i bu durum ile guncellenmeli. Siyah bir bolge yani engel
      %ise current_state degismemeli sadece q matrisi guncellemis olmak ile
      %kalmaliyiz.
        if maze(x,y) == 1
            instance(j) = nextState;
            j = j+1;
            current_state = nextState;
        end
        
    end
    disp(length(instance));
end
%TODO: En son iterasyonda bulunan yol, yani uzerinden gecilen bolgeler
%labirent uzerinde cizilmeli ve gosterilmeli. instance array'i
%kullanilabilir.
%Bu yakinsama sonucu elde edilen yol olacaktir.
for i=1:length(instance)
    [a,b] = state2coordinate(instance(i),N);
    maze(a,b) = 0.7;
end
imagesc(maze);
colormap(gray(256));
drawnow;
%TODO: Son etapta elde edilen q matrix de ekrana basilmali.
disp(Qmatrix);
elapsed_Time = toc;
disp(["Execution time: ",elapsed_Time]);
