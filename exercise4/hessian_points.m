function Ihess = hessian_points( I, sigma)
    Ig = I;
    [Ixx, Iyy, Ixy] = image_derivatives2(Ig, sigma);
    
    Ihess = sigma ^ 4 .* (Ixx .* Iyy - Ixy.^ 2);
    
    [xig, yig] = size(Ig);
    [xh, yh] = size(Ihess);
    
    offx = (xh - xig) / 2;
    offy = (yh - yig) / 2;
    
    Ihess = Ihess(offx:xh-offx-1, offy:yh-offy-1);
    
    
    
    
    