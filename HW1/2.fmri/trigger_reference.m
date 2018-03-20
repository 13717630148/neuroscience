function res = trigger_reference(t, TR, trigger)
    % boxcar
    boxcar = zeros(length(t), 1);
    boxcar(uint16(trigger(:,1)))=1;
    subplot(2,2,1);
    plot(boxcar);
    xlabel('boxcar');

    % hrf
    can_hrf = hrf(0:24);
    subplot(2,2,2);
    plot(can_hrf);
    xlabel('hrf');

    % conv reference
    ref = conv(boxcar, can_hrf);
    %ref = (ref-min(ref))/range(ref); % uniform to 0-1
    subplot(2,2,3);
    plot(ref);
    xlabel('reference')

    % sampling
    res = ref(1:TR:length(t)-TR);
    subplot(2,2,4);
    plot(res,'r-x');
    xlabel('sample');
end