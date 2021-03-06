function [ w ] = descentMethod( t, num_iter, x, y , type)
    if strcmp(type,'usual')
        %randomly initialize w1, w0
        w = [0;0];
        %w = [randn; randn]; %normally distributed pseudorandom
        i1 = randi(length(x));
        i2 = randi(length(x));
        w(2) = double(y(i2)-y(i1))/double(x(i2)-x(i1));
        w(1) = -w(2)*x(i1)+y(i1);

        p1 = 1:num_iter;
        p2 = zeros(1,num_iter);
        for k=1:num_iter
            [J, G] = Jfunc(w, x, y);
            w = w - t.*G;
            p2(k) = J;
            %control de J (NO FA FALTA PER AKERST TREBALL)
        end
            %plot curve convergence
            figure;
            plot(p1, p2, 'r');

            disp('');
            disp(['lastJ: ',num2str(J)]);
            disp(['w0: ',num2str(w(1))]);
            disp(['w1: ',num2str(w(2))]);
    elseif strcmp(type,'normalized')
        %randomly initialize w1, w0
        w = [0;0];
        %w = [randn; randn]; %normally distributed pseudorandom
        i1 = randi(length(x));
        i2 = randi(length(x));
        w(2) = double(y(i2)-y(i1))/double(x(i2)-x(i1));
        w(1) = -w(2)*x(i1)+y(i1);

        p1 = 1:num_iter;
        p2 = zeros(1,num_iter);
        for k=1:num_iter
            [J, G] = Jfunc(w, x, y);
            w = w - t.*(G./( abs(G(1)) + abs(G(2)) ));
            p2(k) = J;
            %control de J (NO FA FALTA PER AKERST TREBALL)
        end
            %plot curve convergence
            figure;
            plot(p1, p2, 'r');

            disp('');
            disp(['lastJ: ',num2str(J)]);
            disp(['w0: ',num2str(w(1))]);
            disp(['w1: ',num2str(w(2))]);
    end
    
end

