% Stabilize a video by finding the displacement vector, shifting individual
% frames by the appropriate amount, and cropping the final video to remove
% the black borders.
function g = stabilize(f,fbounds,flim)
    g = f; % Make a copy of the input video
    fsize = size(f); % Get dimensions of the video
    
    % Create a displacement vector (d) containing [error, y-displacement,
    % x-displacement] for each image frame. -1 is the default value.
    d = [-1 -1 -1];
    d1 = d;
    % Also create a 3d image matrix (f1) by duplicating the first (reference)
    % frame equal to the number of frames in the video.
    f1 = squeeze(f(1,:,:));
    f2 = f1;
    for i=1:fsize(1)-1
        f1 = cat(3,f1,f2);
        d = cat(3,d,d1);
    end
    d = squeeze(permute(d,[3 1 2]));
    f1 = permute(f1,[3 1 2]);
    
    % Crop all image frames in the original video to get the region defined
    % by fbounds
    f2 = crop3d(f,fbounds);
    
    % Loop through the y & x displacements given by flim
    for y=flim(1,1):flim(1,2)
        for x=flim(2,1):flim(2,2)
           % Compute the error for all frames in the video
           error = sum(abs(crop3d(f1,(fbounds+[[y y];[x x]])) - f2),[2 3]);
           % Save the y & x displacements for the min error for each frame
           for n=1:fsize(1)
               if (error(n) < d(n,1)) || (d(n,1) < 0)
                   d(n,1) = error(n);
                   d(n,2) = y;
                   d(n,3) = x;
               end
           end
        end
    end
    
    % Remove the errors from the displacement vector leaving only the
    % [y-displacement, x-displacement] part
    d(:,1) = [];
    
    % Crop the final video to remove the black borders
    g = crop3d(shiftVideo(f,d),fbounds);
    
end