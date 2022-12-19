img = imread("jeruk.png");
bw = im2gray(img);
bw = imbinarize(bw);
bw2 = ~bwareaopen(~bw, 100);
D = -bwdist(~bw2);

mask = imextendedmin(D,4);
D = imimposemin(D,mask);

Ld = watershed(D);

bw3 = bw2;
bw3(Ld == 0) = 1;

imshowpair(img, bw3, 'montage')
