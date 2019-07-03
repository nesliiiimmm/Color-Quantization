function Opathto=Popularity(path,file,noOfColor)
filem=[path,file];
Image = imread(filem);
Image=rgb2gray(Image);
[height width]=size(Image);
[count,x] = imhist(Image);  %histogram cýkarmak için
%figure(1);
%imshow(Image); 
[count1,Indx]=sort(count,1,'descend');
x1=cat(1,x(Indx(:,1),1));
N=noOfColor;
quantize=zeros(N,1);
quantize=x1(1:N,1);
D=pdist2(x1,quantize,'euclidean');
new_matrix=zeros(size(count));
for i=1:length(x1)
      [u,v]=min(D(i,:));  %x te o satýrýn minimum deðeri y de minimum deðerin hangi sutunda bulundugunu tutuyor
      new_matrix(i,1)=quantize(v,1);
 
end
for i=1:width
    for j=1:height
        for t=1:length(x1)
            if Image(i,j)==x1(t,1)
            Image(i,j)=new_matrix(t,1);
            end
        end
    end
end
%Imag=Image;
imshow(Image);
noOfBaskaColor=int2str(noOfColor);
den=['Popularity CQ_',noOfBaskaColor];
denn=[den,'_'];
dennn=[denn,file];
Opathto=[path,dennn];
imwrite(Image,Opathto);
end