%% Parameters
Fs = 40e+3;

%% Calculate f0
s = log10(15);
e = log10(80);
pow = s + (e-s)*(0:0.1:1);
f0 = 10.^pow;

%% Generate 11 clicks
y = zeros(11, Fs);
for i = 1:11
    ICI = 1/f0(i);
    y(i,:) = click(ICI);
end
save('1.mat', 'y');

%% Play randomly for 110 times
index = randperm(110, 110);
index = mod(index, 11) + 1;
save('1.mat', 'index')

res = zeros(1, 110) - 1;

i = 1;
while i <= 110
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
save('1.mat', 'res');

%% Calculate Probability
p = zeros(1, 11);
for i = 1:11
    p(i) = sum(res(index == i))/10;
end

%% Psychometric Function
plot(f0, p);
title('psychometric function');
xlabel('f_0/Hz');
ylabel('probability');

%% Boundary f0
boundary_f0 = interp1([p(8), p(9)], [f0(8), f0(9)], 0.5)