%% Parameters
Fs = 40e+3;

%% Calculate J
mICI = 80e-3;
J = [0.05, 0.10, 0.15, 0.20, 0.25];

%% Generate 5*10 clicks
y = zeros(50, Fs);
for i = 1:5
    for j = 1:10
        k = (i-1)*10 + j;
        y(k,:) = irregular_click(mICI, J(i));
    end
end
save('2.mat', 'y');

%% Play randomly for 50 times
index = randperm(50, 50);
save('2.mat', 'index')

res = zeros(1, 50) - 1;

i = 1;
while i <= 50
    fprintf('next click, i = %d\n', i);
    w = waitforbuttonpress;
    if w == 1
        soundsc(y(index(i),:), Fs);
        key = input('res = ');
        % else replay
        if key == 0 || key == 1
            res(i) = key;
            i = i + 1;
        end
    end
end
save('2.mat', 'res');

%% Calculate Probability
p = zeros(1, 5);
for i = 1:5
    p(i) = sum(res(ceil(index/10) == i))/10;
end

%% Psychometric Function
plot(J*100, p);
title('psychometric function');
xlabel('J/\%');
ylabel('probability');

% %% Boundary J
% boundary_J = interp1([p(8), p(9)], [f0(8), f0(9)], 0.5)