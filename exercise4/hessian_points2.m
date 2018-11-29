function [px, py] = hessian_points2(I, sigma, t)
    
    Ig = I;
    
    [Ixx, Iyy, Ixy] = image_derivatives2(Ig, sigma);
    Ihess = sigma ^ 4 .* (Ixx .* Iyy - Ixy.^ 2);
    % Ihess =(Ixx .* Iyy - Ixy.^ 2);
    
    Ihess = nonmaxima_suppression_box(Ihess, t);
    
    [xig, yig] = size(Ig);
    [xh, yh] = size(Ihess);
    
    offx = (xh - xig) / 2;
    offy = (yh - yig) / 2;
    
    Ihess = Ihess(offx:xh-offx-1, offy:yh-offy-1);
    
    % figure(2); clf; imagesc(Ihess); colormap jet;
    
    index = find(Ihess > t);
    [px, py] = ind2sub(size(Ihess), index);
   
    
    
    
    
    
    