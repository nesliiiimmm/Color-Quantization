function [img,ImgMap]=Octre(Image,ColorOfNumber) 
switch ColorOfNumber
    case 2;
        Result=255;
    case 4;
        Result=255;
    case 8;
        Result=255;
    case 16;
        Result=80;
    case 32;
        Result=50;
    case 64;
        Result=20;
    case 128;
        Result=10.3;
    case 256;
        Result=5.5;
    case 512;
        Result=2.32;
    otherwise
        Result=ColorOfNumber;
end
Img = imread(Image);
% Extract pixels as RGB point triplets
pts = reshape(Img,[],3);
% Create OcTree decomposition object using a target bin capacity
OT = OcTree(pts,'BinCapacity',ceil((size(pts,1) / 256) *Result));
% Find which bins are "leaf nodes" on the octree object
leafs = find(~ismember(1:OT.BinCount, OT.BinParents) & ...
    ismember(1:OT.BinCount,OT.PointBins));
% Find the central RGB location of each leaf bin
binCents = mean(reshape(OT.BinBoundaries(leafs,:),[],3,2),3);
 
% Make a new "indexed" image with a color map
ImgIdx = zeros(size(Img,1), size(Img,2));
for i = 1:length(leafs)
    pxNos = find(OT.PointBins==leafs(i));
    ImgIdx(pxNos) = i;
end
ImgMap = binCents / 255; % Convert 8-bit color to MATLAB rgb values
 
% Display the original color image and result color image 
%figure
%imshow(Img)
%title(sprintf('Original %d color image', size(unique(pts,'rows'),1)))
%figure 
%imshow(ImgIdx, ImgMap)
title(sprintf('Octree-quantized %d color image', size(ImgMap,1)))
img=ImgIdx;
imshow(img,ImgMap);
end