% Kullanıcıdan x[n] ve y[m] dizilerini ve boyutlarını al
n = input('x[n] dizisinin boyutunu girin: ');
x_indice = zeros(1, n);
disp('x[n] dizisinin başlangıç indisini girin:');
startx_index = input(''); % Başlangıç indisini al
for i = 1:n
    x_indice(i) = startx_index + (i - 1); % Başlangıç indisini artırarak diğer indisleri oluştur
end

%x dizisini oluştur
x = zeros(1, n);
disp('x[n] dizisinin elemanlarını girin:');
for i = 1:n
    x(i) = input('');
end

%y dizisini oluştur
m = input('y[m] dizisinin boyutunu girin: ');
y_indice = zeros(1, m);
disp('y[n] dizisinin başlangıç indisini girin:');
starty_index = input(''); % Başlangıç indisini al
for i = 1:m
    y_indice(i) = starty_index + (i - 1); % Başlangıç indisini artırarak diğer indisleri oluştur
end
y = zeros(1, m);
disp('y[m] dizisinin elemanlarını girin:');
for i = 1:m
    y(i) = input('');
end

disp('x dizisi =');
disp(x);

disp('x dizisinin indisleri =');
disp(x_indice);

disp('y dizisi =');
disp(y);

disp('y dizisinin indisleri =');
disp(y_indice);

% Konvolüsyon toplamını hesapla
result = myConv(x_indice, x, y_indice, y, n, m);
disp('Konvolüsyon sonucu (x * y) =');
disp(result);

% x eksenini oluştur
x_axis = x_indice(1)+y_indice(1):x_indice(n)+y_indice(m);
disp('Konvolüsyon sonucunun indisleri =');
disp(x_axis);

% Gerçek konvolüsyon sonucunu hesapla
result2 = conv(x, y, 'full');
disp('Gerçek Konvolüsyon sonucu (x * y) =');
disp(result2);

% x eksenini oluştur
disp('Gerçek konvolüsyon sonucunun indisleri =');
disp(x_axis);

% Sonuçları görselleştir
figure;
stem(x_axis, result2, 'filled', 'MarkerSize', 5);
xlabel('Indis');
ylabel('Konvolüsyon Sonucu');
title('Gerçek Konvolüsyon Sonucu');

% Sonuçları görselleştir
figure;
stem(x_indice, x, 'filled', 'MarkerSize', 5);
xlabel('x');
ylabel('y');
title('x dizisinin grafiği');

% Sonuçları görselleştir
figure;
stem(y_indice, y, 'filled', 'MarkerSize', 5);
xlabel('x');
ylabel('y');
title('y dizisinin grafiği');

% Sonuçları görselleştir
figure;
stem(x_axis, result, 'filled', 'MarkerSize', 5);
xlabel('x');
ylabel('y');
title('Konvolüsyon Sonucu');

pause(10);

%% 5 Saniye Ses kaydetme
recObj = audiorecorder; % kayıt başlatma nesnesi
disp('Start speaking.') % ekrana mesaj
recordblocking(recObj, 5); % kayıt işlemi
disp('End of Recording.') % ekrana mesaj
x1 = getaudiodata(recObj); % kaydedilen sesi x değişkenine saklama
audiowrite('x1.mp3', x1, 8000);
% fs = recObj.SampleRate;
% disp('Örnekleme frekansı =');
% disp(fs);default olarak 8000

%%10 saniye ses kaydetme
recObj = audiorecorder; %% kayıt başlatma nesnesi
disp('Start speaking.') %% ekrana mesaj
recordblocking(recObj, 10); %% kayıt işlemi
disp('End of Recording.'); %% ekrana mesaj
x2 = getaudiodata(recObj); %% kaydedilen sesi x değişkenine saklama


indices1 = 1:length(x1);

%%x1 ile m=3
h1 = zeros(0,length(x1));
total = 0;
%Toplama işleminin hesaplanması
for n = 1:length(x1)
    for k = 1:3
        if(3000*k<n)
            total = total + power(2, -k) * k * x1(n - 3000*k);
        end
    end
    h1(n) = x1(n) + total ;
end
h1_normalized = normalize(h1, 'range');
audiowrite('h1_3.mp3', h1_normalized, 8000);
y1_3 = conv(x1,h1);
y1_3_normalized = normalize(y1_3, 'range');
sound(y1_3_normalized,8000);
pause(5);
%audiowrite('y1_3.mp3', y1_3_normalized, 8000);
myY1_3 = myConv(indices1,x1,indices1,h1,length(x1),length(x1));
myY1_3_normalized = normalize(myY1_3, 'range');
sound(myY1_3_normalized,8000);
%audiowrite('myY1_3.mp3', myY1_3_normalized, 8000);

%%x1 ile m=4
h2 = zeros(1,length(x1));
total = 0;
%Toplama işleminin hesaplanması
for n = 1:length(x1)
    for k = 1:4
        if(3000*k<n)
            total = total + power(2, -k) * k * x1(n - 3000*k);
        end
    end
    h2(n) = x1(n) + total ;
end
y1_4 = conv(x1,h2);
y1_4_normalized = normalize(y1_4, 'range');
sound(y1_4_normalized,8000);
pause(5);
%audiowrite('y1_4.mp3', y1_4_normalized, 8000);
myY1_4 = myConv(indices1,x1,indices1,h2,length(x1),length(x1));
myY1_4_normalized = normalize(myY1_4, 'range');
sound(myY1_4_normalized,8000);
%audiowrite('myY1_4.mp3', myY1_4, 8000);

%%x1 ile m=5
h3 = zeros(1,length(x1));
total = 0;
%Toplama işleminin hesaplanması
for n = 1:length(x1)
    for k = 1:5
        if(3000*k<n)
            total = total + power(2, -k) * k * x1(n - 3000*k);
        end
    end
    h3(n) = x1(n) + total ;
end
y1_5 = conv(x1,h3);
y1_5_normalized = normalize(y1_5, 'range');
sound(y1_5_normalized,8000);
pause(5);
%audiowrite('y1_5.mp3', y1_5_normalized, 8000);
myY1_5 = myConv(indices1,x1,indices1,h3,length(x1),length(x1));
myY1_5_normalized = normalize(myY1_5, 'range');
sound(myY1_5_normalized,8000);
%audiowrite('myY1_5.mp3', myY1_5, 8000);

%%x2 ile m=3
h4 = zeros(0,length(x1));
total = 0;
%Toplama işleminin hesaplanması
for n = 1:length(x2)
    for k = 1:3
        if(3000*k<n)
            total = total + power(2, -k) * k * x2(n - 3000*k);
        end
    end
    h4(n) = x2(n) + total ;
end
%h4_normalized = normalize(h4, 'range');
%audiowrite('h1_3.mp3', h4_normalized, 8000);
y2_3 = conv(x2,h4);
y2_3_normalized = normalize(y2_3, 'range');
sound(y2_3_normalized,8000);
pause(5);
%audiowrite('y2_3.mp3', y2_3_normalized, 8000);
myY2_3 = myConv(indices1,x2,indices1,h4,length(x2),length(x2));
myY2_3_normalized = normalize(myY2_3, 'range');
sound(myY2_3_normalized,8000);
%audiowrite('myY2_3.mp3', myY2_3_normalized, 8000);

%%x2 ile m=4
h5 = zeros(1,length(x2));
total = 0;
%Toplama işleminin hesaplanması
for n = 1:length(x2)
    for k = 1:4
        if(3000*k<n)
            total = total + power(2, -k) * k * x2(n - 3000*k);
        end
    end
    h5(n) = x2(n) + total ;
end
y2_4 = conv(x2,h5);
y2_4_normalized = normalize(y2_4, 'range');
sound(y2_4_normalized,8000);
pause(5);
%audiowrite('y2_4.mp3', y2_4_normalized, 8000);
myY2_4 = myConv(indices1,x2,indices1,h5,length(x2),length(x2));
myY2_4_normalized = normalize(myY4_3, 'range');
sound(myY2_4_normalized,8000);
%audiowrite('myY2_4.mp3', myY2_4_normalized, 8000);

%%x2 ile m=5
h6 = zeros(1,length(x2));
total = 0;
%Toplama işleminin hesaplanması
for n = 1:length(x2)
    for k = 1:5
        if(3000*k<n)
            total = total + power(2, -k) * k * x2(n - 3000*k);
        end
    end
    h6(n) = x2(n) + total ;
end
y2_5 = conv(x2,h6);
y2_5_normalized = normalize(y2_5, 'range');
sound(y2_5_normalized,8000);
pause(5);
%audiowrite('y2_5.mp3', y2_5_normalized, 8000);
myY2_5 = myConv(indices1,x2,indices1,h6,length(x2),length(x2));
myY2_5_normalized = normalize(myY2_5, 'range');
sound(myY2_5_normalized,8000);
%audiowrite('myY2_5.mp3', myY2_5_normalized, 8000);

%%Kendi konvolüsyon fonksiyonum
function result = myConv(x_indice, x, y_indice, y, n, m)
    % Konvolüsyon sonucunun boyutu
    result_size = max(x_indice) - min(x_indice) + max(y_indice) - min(y_indice) + 1;
    % Sonuç vektörü
    result = zeros(1, result_size);
    
    % Polinom çarpımı
    for i = 1:n
        for j = 1:m
            result_index = x_indice(i) + y_indice(j) - min(x_indice) - min(y_indice) + 1;
            result(result_index) = result(result_index) + x(i) * y(j);
        end
    end
end
