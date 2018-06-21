function y = click(ICI)
    Fs = 40e+3;
    T = 0.1e-3;
    m = T * Fs;
    n = ICI * Fs;
    y = double(mod(1:Fs, n) < m);
end