function tuning_curve(mfr)
    m = size(mfr,1);
    for i = 1:m
        subplot(3,3,i);
        plot(mfr(i,:));
    end
end