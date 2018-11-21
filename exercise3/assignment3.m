% (a)
bins_theta = 300; bins_rho = 300; % Resolution of the accumulator array
max_rho = 100; % Usually the diagonal of the image
val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
val_rho = linspace(-max_rho, max_rho, bins_rho);

A = zeros(bins_rho, bins_theta);
B = zeros(bins_rho, bins_theta);
C = zeros(bins_rho, bins_theta);
D = zeros(bins_rho, bins_theta);

% for point at (50, 90)
x = 50;
y = 90;

rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho

for i = 1:bins_theta % Go over all the points
    if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
        A(bin_rho(i), i) = A(bin_rho(i), i) + 1; % Increment the accumulator cells
    end;
end;

imagesc(A); % Display status of the accumulator