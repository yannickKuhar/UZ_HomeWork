function [gdx, x] = gaussdx(sigma)
    [g, x] = gauss(sigma);
    
    % Odvajamo gaussov kernel
    gdx = -(1 / (sqrt(2 * pi) * sigma^3)) .* x .* exp(-(x.^2) / (2 * sigma^2));
    gdx = gdx / sum(abs(gdx));
    
    
    
    