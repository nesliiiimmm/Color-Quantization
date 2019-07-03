function Opathto=KMean(inImgname,ext,noOfColors)

    inImgPath = [inImgname, ext];
    [ImgMat, inMap] = imread(inImgPath);
    s_img = size(ImgMat);
    s_map = size(inMap);
    if(s_map(1) == 0)
        inImg = ImgMat;
    else
    %Indexed Color Image
      inImg = ind2rgb(ImgMat, inMap);
      inImg = round(inImg .* 255);
    end
        r = inImg(:,:,1);
    g = inImg(:,:,2);
    b = inImg(:,:,3);
    inputImg = zeros((s_img(1) * s_img(2)), 3);
    inputImg(:,1) = r(:);
    inputImg(:,2) = g(:);
    inputImg(:,3) = b(:);
    inputImg = double(inputImg);
    disp('K-Means Processing Started');
    [idx, C] = kmeans(inputImg, noOfColors, 'EmptyAction', 'singleton');
    disp('K-Means Processing Completed');
    palette = round(C);
    %Color Mapping
    idx = uint8(idx);
    outImg = zeros(s_img(1),s_img(2),3);
    temp = reshape(idx, [s_img(1) s_img(2)]);
    for i = 1 : 1 : s_img(1)
        for j = 1 : 1 : s_img(2)
            outImg(i,j,:) = palette(temp(i,j),:);
        end
    end
    noOfBaskaColor=int2str(noOfColors);
    den=['K-Mean CQ_',noOfBaskaColor];
    denn=[den,'_'];
    dennn=[denn,ext];
    Opathto=[inImgname,dennn];
    %imwrite(outImg,inMap,Opathto);
    %outFilename = [inImgname, '_', int2str(noOfColors), ext];
    imwrite(uint8(outImg), Opathto);
    
    %OutCSVName = [inImgname, '_', int2str(noOfColors), '_Palette' '.csv'];
   
    %s = size(palette);
    %fid = fopen(OutCSVName,'w');
    
%fclose(fid);