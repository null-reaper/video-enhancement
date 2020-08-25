% Export the video f as 'fname.avi'
function exportAvi(fname,f)
    % Create and open a video 
    v = VideoWriter(fname); 
    open(v);

    % Get dimensions of the video
    fsize = size(f); 
    
    % Write frames to the video
    for n = 1:fsize(1) 
        writeVideo(v,reshape(f(n,:,:),fsize(2),fsize(3)));
    end
    
    % Close video
    close(v);
end