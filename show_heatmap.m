%show heatmap
p = '/home/zzd/market1501/query_pytorch/query/*.jpg';
file = dir(p);
points = load('market1501_14point_query.mat');
points = int32(points.pp);
for i=1:length(file)
    disp(i);
    url = strcat('/home/zzd/market1501/query_pytorch/query/',file(i).name);
    im = imread(url);
    [h,w,~]=size(im);
    clf;
    %subplot(1,2,1);
    imshow(im);hold on;
    imp = reshape(points(:,i),14,[]);
    plot(imp(:,1),imp(:,2),'ro');
    plot(imp(1:2,1),imp(1:2,2));
    plot(imp(3:5,1),imp(3:5,2));
    plot(imp(6:8,1),imp(6:8,2));
    plot(imp(9:11,1),imp(9:11,2));
    plot(imp(12:14,1),imp(12:14,2));
    new_im = im(max(imp(1,2)-3,1):h,:,:);
    %subplot(1,2,2);
    %heatmap = zeros(h,w,'single');
    %for j=1:14
     %   heatmap(round(imp(j,2)),round(imp(j,1))) = 1;
    %end
    %w=fspecial('gaussian',[5 5],3);
    %heatmap=imfilter(heatmap,w);
    %imshow(heatmap);
    pause();
end