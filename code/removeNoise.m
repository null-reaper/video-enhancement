% Remove Impulse Noise from Video using Median Filter
function g = removeNoise(f,R)
    % Get dimensions of the video
    [l,m,n] = size(f);
    
    % Create blank output image
    g = zeros(l,m,n);
    g = uint8(g); 
    
    % Perform the noise removal operation
    for i = 1:l
        for j = 1:m
            for k=1:n
                % Define max and minimum values x and y coordinates
                % Minimum x coordinate has to be greater than or equal to 1
                xmin = max(1,i-R); 
                xmax = min(l,i+R);
                ymin = max(1,j-R);
                ymax = min(m,j+R);
                zmin= max(1,k-1);
                zmax = min(n,k+1);
                medianfilt = f(xmin:xmax, ymin:ymax, zmin:zmax);
                %Now the new intensity of pixel at (i,j) will be median
                % of this matrix
                g(i,j,k) = median(medianfilt(:));
            end
        end
    end
    
end