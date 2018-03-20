function sym_analyze(brain)
    % index in left and right himisphere
    left_index = [1:13, 17:20, 25:39, 1000:1035, 3000:3035, 5001];
    right_index = [40:52, 53:56, 57:71, 2000:2035, 4000:4035, 5002];
    cor = zeros(1,length(left_index));
    weight = zeros(1,length(left_index));
    for i = 1:13%length(left_index)
        left = (brain == left_index(i));
        % mirror the brain data in the x axis, fliplr in Matlab
        right = (brain == right_index(i));
        % calculate the correlation, mirror the right himisphere
        res = corr(left(:), fliplr(right(:)));
        if ~isnan(res)
            cor(i) = res;
            weight(i) = sum(left(:))+sum(right(:));
        end
    end
    % weighted mean
    symmetry = sum(cor.*weight)./sum(weight)
end