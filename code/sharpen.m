% Sharpen all Image Frames in a Video using Unsharp Masking
function g = sharpen(f,lambda,R)
    g = f; % Make a copy of the input video
    fsize = size(f); % Get dimensions of the video

    % Get Gaussian PSF
    h = fspecial('gaussian',2*R+1,R);
    
    % Get Sizes of h
    hsize = size(h);
    
    % Zero Pad h
    h = cat(2,h,zeros(hsize(1),fsize(3)-hsize(2)));
    h = cat(1,h,zeros(fsize(2)-hsize(1),fsize(3)));
    
    % Sharpen All Image Frames in Video
    for n=1:fsize(1)
        % Get nth Image Frame
        fn = squeeze(f(n,:,:));
        
        % Perform Convolution to Get Blurred Image
        H = fft2(h);
        F = fft2(squeeze(fn));
        fn_blurred = ifft2(H.*F);
    
        % Performing Unsharp Masking
        g(n,:,:) = reshape(fn +((fn - uint8(fn_blurred)).*lambda),[1, fsize(2), fsize(3)]);
    end
    
end
