% t: time, T0: offset
function res = hrf(t)
    T0 = 0;n=4; lamda=2;
    res=((t-T0).^(n-1)).*exp(-(t-T0)/lamda)/((lamda^n)*factorial(n-1));
end