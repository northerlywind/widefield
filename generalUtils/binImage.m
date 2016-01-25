

function binnedImage = binImage(origImage, binFactor)
% function binnedImage = binImage(origImage, binFactor)
%
% Bins image (e.g. 2x2 or 4x4) by taking the average of given pixels. Input
% image size should be Ypix x Xpix x nFrames. For binFactor B, performs BxB
% binning and returns an image with nPix/B^2 pixels. Only works for
% integer B, probably.

binnedImage = zeros(floor(size(origImage,1)/binFactor), ...
    floor(size(origImage,2)/binFactor), ...
    size(origImage,3), 'like', origImage);

for yNew = 1:floor(size(origImage,1)/binFactor)
    yPix = (yNew-1)*binFactor+1:yNew*binFactor;
    for xNew = 1:floor(size(origImage,2)/binFactor);
        
        binnedImage(yNew, xNew,:) = mean(mean(origImage(yPix, ...
            (xNew-1)*binFactor+1:xNew*binFactor,:),1),2);
        
    end
end
