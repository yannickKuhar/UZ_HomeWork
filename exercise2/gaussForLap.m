function Ib = gaussForLap(I, sigma)
    g = gauss(sigma);
    
    Ib(:,:,1) = conv2(I(:,:,1), g, 'same');
    Ib(:,:,2) = conv2(I(:,:,2), g, 'same');
    Ib(:,:,3) = conv2(I(:,:,3), g, 'same');
    
    Ib(:,:,1) = conv2(Ib(:,:,1), g', 'same');
    Ib(:,:,2) = conv2(Ib(:,:,2), g', 'same');
    Ib(:,:,3) = conv2(Ib(:,:,3), g', 'same');