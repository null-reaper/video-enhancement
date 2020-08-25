% Play a video in MATLAB with the given frame rate.
function playmat(f,rate)
    fsize = size(f); % Get dimensions of the video
    for n = 1:fsize(1)
        imagesc(squeeze(f(n,:,:))); % Get nth image frame
        pause(1/rate); % Pause for amount given by frame rate
    end
end