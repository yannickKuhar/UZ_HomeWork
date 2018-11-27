function I_hess = hessian_points( I, sigma)
    Ig = I;
    [Ixx, Iyy, Ixy] = image_derivatives2(Ig, sigma);
    
    I_hess = (Ixx .* Iyy - Ixy.^ 2); 
    
    
    
    
    