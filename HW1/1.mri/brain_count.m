function res = brain_count(brain, index)
    res = 0;
    % use logical index
    for i = index
        part = (brain == i);
        res = res + sum(part(:));
    end
end