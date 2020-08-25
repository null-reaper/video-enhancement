% Shift all image frames in a video by the amount given in the displacement
% vector d
function g = shiftVideo(f,d)
    g = f; % Make a copy of the input video
    fsize = size(f); % Get dimensions of the video

    % Shift each frame n by given amount d(n)
    for n=1:fsize(1)
        g(n,:,:) = shiftImg(squeeze(g(n,:,:)),d(n,:));
    end
end