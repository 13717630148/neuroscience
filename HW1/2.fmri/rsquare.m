function res = rsquare(img, ref)
    % calculate the corresponse
    [X,Y,Z,~] = size(img);
    res = zeros(X,Y,Z);
    for i = 1:X
        for j = 1:Y
            for k = 1:Z
                B = double(squeeze(img(i,j,k,:))); % The BOLD signal at voxel
                %B = (B-min(B))/range(B);
                res(i,j,k) = corr(ref,B);
            end
        end
    end
    res(isnan(res))=0;
end