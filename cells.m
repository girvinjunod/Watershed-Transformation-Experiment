img = imread("cells.png");
bw = im2gray(img);
bw = imbinarize(bw);
bw2 = ~bwareaopen(~bw, 10);
D = -bwdist(~bw2);

mask = imextendedmin(D,1);
D = imimposemin(D,mask);

Ld = watershed(D);

bw3 = bw2;
bw3(Ld == 0) = 0;

imshowpair(img, bw3, 'montage')
