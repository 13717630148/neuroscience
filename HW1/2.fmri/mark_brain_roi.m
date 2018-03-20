function res = mark_brain_roi(img, roi_left, roi_right)
    images = mean(img, 4);
    [X, Y, Z] = size(images);
    res = zeros(X, Y, Z, 3); % grey to fake rgb
    for i = 1:Z
        image = images(:,:,i);
        image = image/max(image(:)); 
        % roi_left, mark red
        temp = image;
        temp(roi_left(:,:,i))=1;
        temp(roi_right(:,:,i))=0;
        res(:,:,i,1) = temp;
        % none roi, image
        temp = image;
        temp(roi_left(:,:,i))=0;
        temp(roi_right(:,:,i))=0;
        res(:,:,i,2) = temp;
        % roi right, mark blue
        temp = image;
        temp(roi_left(:,:,i))=0;
        temp(roi_right(:,:,i))=1;
        res(:,:,i,3) = temp;
    end
end