function [px, py] = hessian_points2(I, sigma, t)
    
    Ig = I;
    
    [Imag, Idir] = gradient_magnitude(Ig, sigma);
    Imax = nonmaxima_suppression_line(Imag, Idir);
   
    % I_hess = hessian_points(I, sigma);
    % Ihess = imhmax(I_hess,t);
    
    Imax = uint8(Imax);
    Ihess = Imax > t;
    
    px = []; 
    py = [];
    
    [m, n] = size(Ihess);
    
    for i=1:m
        for j=1:n
            if(Ihess(i, j) == 1)
                px = [px, i];
                py = [py, j];
            end
        end
    end
    
    
    
    
    
    
    