function [Ix, Iy] = image_derivatives(I, sigma)
    Ig = I;
    
    gx = gauss(sigma);
    gy = gx';
    gdx = gaussdx(sigma);
    gdy = gdx';
    
    Ix = conv2(conv2(Ig, gy), gdx);
    Iy = conv2(conv2(Ig, gx), gdy);
    