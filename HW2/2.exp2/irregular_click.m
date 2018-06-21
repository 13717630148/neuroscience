function y = irregular_click(mICI, J)
    Fs = 40e+3;
    T = 0.1e-3;
    m = T * Fs;
    y = zeros(1, Fs + 10000);
    i = 1;
    while i <= Fs
        y(i:i+m-1) = 1;
        ICI = mICI*(1 + (-1+2*rand(1))*J);
        n = ICI * Fs;
        i = i + n;
    end
    y = y(1:Fs);
end