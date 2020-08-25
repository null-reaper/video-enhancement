function histogrameq()
load f; 

original = squeeze(f(1,:,:)); %%squeezing the matrix to be 2D
[rows,columns,~] = size(original); %converting to rows and columns array
finalResult = uint8(zeros(rows,columns));
pixelNumber = rows*columns; %creating the pixel
frequency = zeros(256,1); %creating an array of values to be used later
pdf = zeros(256,1); %creating an array of values to be used later
cdf = zeros(256,1); %creating an array of values to be used later
cumulative = zeros(256,1); %creating an array of values to be used later
outpic = zeros(256,1); %creating an array of values to be used later

%loop tracing rows and columns
for i = 1:1:rows 
    for j = 1:1:columns
        val = original(i,j);
        frequency(val+1) = frequency(val+1)+1; %increasing the array
        pdf(val+1) = frequency(val+1)/pixelNumber;
    end
end

sum = 0 ;
%we want the 256 - 1 that's why we initailzed the intensityLevel 
%with 255 instead of 256
intensityLevel = 255;

%loop for pdf and cdf of histogram
for i = 1:1:size(pdf)
    sum = sum + frequency(i);
    cumulative(i) = sum;
    cdf(i) = cumulative(i)/ pixelNumber;
    outpic(i) = round(cdf(i) * intensityLevel);
end

%loop tracing rows and columns
for i = 1:1:rows
    for j = 1:1:columns
        finalResult(i,j) = outpic(original(i,j) + 1); %creating the final result array
    end
end
%%concat(3,f1,f2...); would be used to convert the 2D array back into 3D to
%%play the movie
subplot(1,2,1),imshow(finalResult(:,:,1));