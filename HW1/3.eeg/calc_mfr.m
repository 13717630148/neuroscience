function res = calc_mfr(unit, levels, freqs, sti_onset)
    %% MFR matrix
    levels_index = unique(levels);
    freqs_index = unique(freqs);
    m = length(levels_index);
    n = length(freqs_index);
    res = zeros(m,n);
    % count the spkies
    for i = 1:length(sti_onset)-1
        start = sti_onset(i);
        ends = sti_onset(i+1);
        n = sum(unit >= start & unit <= ends);
        % calc MFR
        mfr = n/(ends-start);
        % index
        res(levels_index == levels(i), freqs_index == freqs(i)) = mfr;
    end
end