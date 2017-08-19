% crop the tight boundary
p = './bounding_box_test/*.jpg';
file = dir(p);
points = load('market1501_14point_gallery.mat');
points = int32(points.pp);
for i=10000:length(file)
    disp(i);
    url = strcat('./bounding_box_test/',file(i).name);
    im = imread(url);
    [h,w,~]=size(im);
    clf;
    subplot(1,2,1);
    imshow(im);hold on;
    imp = reshape(points(:,i),14,[]);
    plot(imp(:,1),imp(:,2),'ro');
    plot(imp(1:2,1),imp(1:2,2));
    plot(imp(3:5,1),imp(3:5,2));
    plot(imp(6:8,1),imp(6:8,2));
    plot(imp(9:11,1),imp(9:11,2));
    plot(imp(12:14,1),imp(12:14,2));
    new_im = im(max(imp(1,2)-3,1):h,:,:);
    subplot(1,2,2);
    imshow(new_im);
    %imwrite(new_im,strcat('/home/zzd/re_ID/market1501/bounding_box_test_crop/',file(i).name));
end