


function [nFrames, nFrPerFile] = getNFramesFromCustomPCOFiles(theseFiles)

nFrPerFile = zeros(length(theseFiles),1);

fprintf(1, 'determining number of images in %d files\nfile: ', length(theseFiles));
nFrames = 0;
for fileInd = 1:length(theseFiles)
    fprintf(1, '%d...', fileInd);
    [~, ~, TimeStamps] = LoadCustomPCO(theseFiles{fileInd}, false, true);
    nImagesThisFile = numel(TimeStamps);
    nFrames = nFrames+nImagesThisFile;
    nFrPerFile(fileInd) = nImagesThisFile;
end
fprintf(1, '\n%d total frames acquired\n', nFrames);