function [x1in, x2in] = get_inliers(F, x1, x2, eps)
    
    x1in = [];
    x2in = [];
    
    [h, w] = size(x1);
    
    for i = 1:h
        
        [d, d1, d2] = reprojection_error(x1(i,:)', x2(i,:)', F);
 
        if(d1 < eps && d2 < eps)
            x1in = [x1in; x1(i, :)];
            x2in = [x2in; x2(i, :)];
        end
    end