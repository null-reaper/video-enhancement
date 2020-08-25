% Shift a single image by the amount given in d. Zero pad the image.
function g = shiftImg(f,d)
    g = f; % Make a copy of the input image
    fsize = size(f); % Get dimensions of the image
    
    % Shift Up
    if d(1) < 0
        for i = d(1):-1
            g(1,:) = []; % Delete first row
            g = [g;zeros(1,fsize(2))]; % Zero pad bottom
        end
    % Shift Down
    elseif d(1) > 0
        for i = d(1):-1:1
            g(end,:) = []; % Delete last row
            g = [zeros(1,fsize(2));g]; % Zero pad top
        end
    end
    % Shift Left
    if d(2) < 0
        for i = d(2):-1
            g(:,1) = []; % Delete first column
            g = cat(2,g,zeros(fsize(1),1)); % Zero pad right
        end
    % Shift Right
    elseif d(2) > 0
        for i = d(2):-1:1
            g(:,end) = []; % Delete last column
            g = cat(2,zeros(fsize(1),1),g); % Zero pad left
        end
    end

end