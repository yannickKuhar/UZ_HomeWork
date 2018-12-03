function [px, py] = harris_points2( I, sigma, t)
    Ig = I;
    
    [Ix, Iy] = image_derivatives(Ig, sigma);
    
    sigmatilda = 1.6 * sigma;
    alpha = 0.06;
    
    G = gauss(sigmatilda);
    
    k11 = conv2(Ix .^ 2, G);
    k11 = conv2(k11, G');
    
    [h, w] = size(k11);
    
    k12 = conv2(Ix .* Iy, G);
    k12 = conv2(k12, G');
    
    k22 = conv2(Iy .^ 2, G);
    k22 = conv2(k22, G');
    
    rezultat = zeros(h, w);
    
    for i = 1:h
        for j = 1:w
            
            C = sigma ^ 2 .* [k11(i, j) k12(i, j); k12(i, j) k22(i, j)];
            
            detC = det(C);
            traceC = trace(C);
            
            vmesni_rezultat = detC - alpha * traceC ^ 2;
            
            rezultat(i, j) = vmesni_rezultat;
        end
    end
    
    vharr = rezultat;
    rezultat = nonmaxima_suppression_box(rezultat, t);
    
    % Obrezi slike
    [xig, yig] = size(Ig);
    [xr, yr] = size(rezultat);
    
    offx = (xr - xig) / 2;
    offy = (yr - yig) / 2;
    
    rezultat = rezultat(offx:xr-offx-1, offy:yr-offy-1);
    vharr = vharr(offx:xr-offx-1, offy:yr-offy-1);
    
    % figure(1); subplot(2, 3, sigma / 3); colormap(gray); imagesc(vharr); 
    % figure(2); clf; colormap(gray); imagesc(rezultat); 
    
    index = find(rezultat(:) > t);
    [px, py] = ind2sub(size(rezultat), index);
    