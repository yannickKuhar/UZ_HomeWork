function [px, py] = harris_points( I, sigma, thresh )
    Ig = I;
    
    [Ix, Iy] = image_derivatives(Ig, sigma);
    
    sigmatilda = 1.6 * sigma;
    alpha = 0.06;
    
    G = gauss(sigmatilda);
    k11 = conv2(Ix .^ 2, G);
    k11 = conv2(k11, G');
    
    k12 = conv2(Ix .* Iy, G);
    k12 = conv2(k12, G');
    
    k22 = conv2(Iy .^ 2, G);
    k22 = conv2(k22, G');
    
    C = sigma ^ 2 * [k11 k12; k12 k22];
    
    a = size(C)
    
    detC = det(C);
    traceC = trace(C);
    
    px = [];
    py = [];
    
    Iharr = detC - alpha * traceC .^ 2;
    
    [index = find(Ihess > t);
    [px, py] = ind2sub(size(Ihess), index);
    