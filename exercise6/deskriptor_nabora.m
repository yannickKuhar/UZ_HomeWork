function D = deskriptor_nabora(nabor)
    D = [];
    
    for i = 1:64
        
        % I = rgb2gray(imread('graf/graf1.png'
        
        if i < 10
            I = imread(strcat('faces/', num2str(nabor), '/00', num2str(i), '.png'));
        else
            I = imread(strcat('faces/', num2str(nabor), '/0', num2str(i), '.png'));
        end
        
        % [h, w] = size(I)
        
        D = [D; I(:)'];
    end
    
    D = D';
