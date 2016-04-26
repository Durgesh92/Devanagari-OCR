%bw9=imread('9.bmp');
%imshow(bw);
%bw2 = edu_imgcrop(bw9)
%imshow(bw2);
%i1=edu_imgcrop(imread('1.bmp'));
%imshow(i1)
i1=imresize((edu_imgcrop(imread('1.bmp'))),[50 50]);
