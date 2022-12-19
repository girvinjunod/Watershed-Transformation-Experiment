url = 'https://blogs.mathworks.com/images/steve/2013/blobs.png';
img = imread(url);
bw2 = ~bwareaopen(~img, 10);
D = -bwdist(~bw2);

mask = imextendedmin(D,2);
D = imimposemin(D,mask);

Ld = watershed(D);

bw3 = bw2;
bw3(Ld == 0) = 0;

imshowpair(img, bw3, 'montage')
