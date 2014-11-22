%PLOT DATA

load('reg_data_set_1.mat');
figure(1);
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
hold off;

%ANALITICAL

x2 = [ones(length(x),1) x];
wanalitical = (x2'*x2)\(x2'*y);
%show values analitical
disp(['w0: ',num2str(wanalitical(1))]);
disp(['w1: ',num2str(wanalitical(2))]);
%plot analitical
p1 = 0:0.1:1;
p2 = wanalitical(2)*p1+wanalitical(1);
figure(2);
scatter(x(1),y(1),5,'blue');
hold on;
for i=1:length(x)
    scatter(x(i),y(i),5,'blue');
end
plot( p1, p2, 'g' );
hold off;



%ITERATING

%randomly initialize w1, w0
w = [0; 0];
i1 = randi(length(x));
i2 = randi(length(x));
w(2) = double(y(i2)-y(i1))/double(x(i2)-x(i1));
w(1) = -w(2)*x(i1)+y(i1);

%t=? ask to user
%t = input('Choose step size (typ. 0.001): ');
t = 0.001;
%num_iter=? ask to user
num_iter = input('Choose number of iterations: ');

for k=1:num_iter
    [J, G] = Jfunc(w, x, y);
    w = w + t.*G;
    %control de J (NO FA FALTA PER AKERST TREBALL)
end
    disp('');
    disp(['iter: ', num2str(k)]);
    disp(['w0: ',num2str(w(1))]);
    disp(['w1: ',num2str(w(2))]);


