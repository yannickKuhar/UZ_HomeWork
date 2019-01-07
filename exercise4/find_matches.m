function M = find_matches(I1, I2)
    
[px1, py1] = hessian_points2(I1, 3, 50);
[px2, py2] = hessian_points2(I2, 3, 50);

% px1 = px1(length(px1) - 13:length(px1));
% py1 = py1(length(py1) - 13:length(py1));
% px2 = px2(length(px2) - 13:length(px2));
% py2 = py2(length(py2) - 13:length(py2));

D1 = descriptors_maglap(I1, px1, py1, 41, 3, 16);
D2 = descriptors_maglap(I1, px2, py2, 41, 3, 16);

%{
[hd1, wd1] = size(D1);
[hd2, wd2] = size(D2);

id1 = [];
id2 = [];

for i = 1:hd1
    if(isnan(D1(i, 1)))
        id1 = [id1, i];
    end
end

for i = 1:hd2
    if(isnan(D2(i, 1)))
        id2 = [id2, i];
    end
end

D1(id1, :) = [];
D2(id2, :) = [];
%}

[indices, distances] = find_correspondences(D1, D2);

px2=px2(indices);
py2=py2(indices);

%{
len = min(size(px1, 1), size(px2, 1));
M1 = [px1(1:len), py1(1:len), px2(1:len), py2(1:len), distances(1:len)'];

[indices, distances] = find_correspondences(D2, D1);

px2=px2(indices);
py2=py2(indices);

len = min(size(px1, 1), size(px2, 1));
M2= [px1(1:len), py1(1:len), px2(1:len), py2(1:len), distances(1:len)'];
%}

M = [];

for i=1:size(M1, 1)
      point = M1(i,1:4);
    
    for j=1:size(M2,1)
        
        % a = size(point)
        % b = size(M2(j, 1:4))
        
        if M2(j, 1:4) == point
            M=[M; M1(i,:)];
            break;
        end
    end
end

% M = [px1'; py1'; px2'; py2'; distances];