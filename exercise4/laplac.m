function Ig = laplac(I, imp, sigma)
    g = gauss(sigma);
    
    vec = zeros(length(g), 1);
    
    idx = ceil(length(vec) / 2);
    
    vec(idx) = imp;
    
    k = vec' - g;
    
    Ig = I;
    
    Ig(:,:,1) = conv2(I(:,:,1), k, 'same');
    Ig(:,:,2) = conv2(I(:,:,2), k, 'same');
    Ig(:,:,3) = conv2(I(:,:,3), k, 'same');
    
    Ig(:,:,1) = conv2(Ig(:,:,1), k', 'same');
    Ig(:,:,2) = conv2(Ig(:,:,2), k', 'same');
    Ig(:,:,3) = conv2(Ig(:,:,3), k', 'same');
    
    