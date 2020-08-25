% Crop all frames in the video up to given frame boundaries
function g = crop3d(f,frameBounds)
    g = f; % Make a copy of the input video
    dim = size(f); % Get dimensions of the video
    
    % Crop the image with given frame boundaries
    if (frameBounds(1,2) < dim(2));g(:,frameBounds(1,2)+1:end,:) = [];end % crop bottom
    if (frameBounds(1,1) > 1);g(:,1:frameBounds(1,1)-1,:) = []; end % crop top
    if (frameBounds(2,2) < dim(3));g(:,:,frameBounds(2,2)+1:end) = [];end % crop right
    if (frameBounds(2,1) > 1);g(:,:,1:frameBounds(2,1)-1) = [];end % crop left
end