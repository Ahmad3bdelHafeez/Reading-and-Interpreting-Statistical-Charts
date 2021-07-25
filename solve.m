I = imread('1.jpg');
block = legend(I);
% figure,imshow(I);
gray=rgb2gray(I);
BW = edge(gray,'canny');
se = strel('square', 8);
BW = imdilate(BW,se);
BW = ~BW;
[L, num] = bwlabel(BW);

RGB = label2rgb(L);
%     figure,imshow(RGB);
[H, W, ~] = size(I);
smallRatio = H*W*0.002;
allColor=[];
carray=[];
countAll = 0;

rgbPoint=[];
for i=1:num
    x = uint8(L==i);
    f = sum(sum(x==1));
    if(f < smallRatio)
        continue;
    end
    d = zeros(size(I));
    d(:,:,1) = uint8(x).*I(:,:,1);
    d(:,:,2) = uint8(x).*I(:,:,2);
    d(:,:,3) = uint8(x).*I(:,:,3);
   d= uint8(d);   
    [o, z, ~] = size(d);
    
  whitePixel=Count_White_Pixels(d);
if(whitePixel<80)
    

        [r g b]=GetRGB(d);
        rgbPoint=[rgbPoint, r g b];
        d=imgaussfilt(d,3);
        d=imsharpen(d,'Radius',5,'Amount',1);

    
    c=CountOneImagePixels(d); 
    countAll=countAll+CountAllImagePixels(d);
     allColor=[allColor,c];
     
    
end
        
  end


 allColor=(allColor/countAll)*100
 rgbPoint


 [rr, tt, ~] = size(block);
ColorCounter=length(rgbPoint)/3;

 
rcount=1;
gcount=2;
bcount=3;
    
for zzz=1:ColorCounter
    qqq=0;
    blockk=block;
    for k =1: rr
        for p = 1 :tt 
            if blockk(k,p,1)>=rgbPoint(rcount)-10 && blockk(k,p,1)<=rgbPoint(rcount)+10 && blockk(k,p,2)>=rgbPoint(gcount)-10 && blockk(k,p,2)<=rgbPoint(gcount)+10 && blockk(k,p,3)>=rgbPoint(bcount)-10 && blockk(k,p,3)<=rgbPoint(bcount)+10 
                 cropp = imcrop(blockk,[p-2 k-9 100 28 ]);
                 figure;

                 imshow(cropp),title(allColor(zzz));

                 
                 qqq=1;
                 break;

            end

        end
        if qqq==1
                break;
         end    
    end
rcount=rcount+3;
gcount=gcount+3;
bcount=bcount+3;  
end