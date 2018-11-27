function [Ixx, Iyy, Ixy] = image_derivatives2(I, sigma)
    Ig = I;
    
    gx = gauss(sigma);
    gy = gx';
    gdx = gaussdx(sigma);
    gdy = gdx';
    
    [Ix, Iy] = image_derivatives(Ig, sigma);
    
    Ixx = conv2(conv2(Ix, gy), gdx);
    Iyy = conv2(conv2(Iy, gx), gdy);
    Ixy = conv2(conv2(Ix, gx), gdy);
    