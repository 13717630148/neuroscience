%% Parameters
m = 10000;
n = 10000;

mean_A = 10;
J_A = 2.5;

mean_B = 13;
J_B = 2;

%% data
A = mean_A + (2*rand(1, m)-1)*J_A;
B = mean_B + (2*rand(1, n)-1)*J_B;

index = randperm(m+n, m+n);
data = [A, B];
res = logical([zeros(1, m), ones(1, n)]);

[data, order] = sort(data);
res = res(order);

%% plot ROC
beta = 6:15;
for i = 1:10
    response = (data > beta(i));

    TP = response & res;
    FP = response & ~res;
    
    % percent, normalize
    if sum(FP)~=0
        x = cumsum(FP)./sum(FP);
    else
        x = zeros([1, length(FP)]); % avoid 0/0 = NaN
    end
    if sum(TP)~=0
        y = cumsum(TP)./sum(TP);
    else
        y = zeros([1, length(TP)]);
    end

    figure(1);
    subplot(2, 5, i);
    plot(x, y);
    axis([0, 1, 0, 1]);
    str = sprintf('%d', beta(i));
    title(['\beta = ', str]);
end
