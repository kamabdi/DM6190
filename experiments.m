addpath /home/kamila/Documents/Data/VOCdevkit/VOCcode/

VOCinit;
%im_path = '/home/kamila/Documents/Data/VOCdevkit/VOC2012/JPEGImages/';
im_path = '/home/kamila/Documents/Data/VOCdevkit/results/VOC2012/Segmentation/voc11_08s_val_cls/';
resultpath = '/home/kamila/Documents/Data/VOCdevkit/results/VOC2012/Segmentation/alg_sel_val_cls/';

i_ale = dir('/home/kamila/Documents/Data/VOCdevkit/results/VOC2012/Segmentation/voc11_08s_val_cls/*.png');
i_cpmc = dir('/home/kamila/Documents/Data/deeplab_largefov/val_result_aftercrf/results/VOC2012/Segmentation/comp6_val_cls/*.png');
% [C ia ib] = intersect([{i_ale(:).name}], [{i_cpmc(:).name}]);

iids = i_ale;



%[accuracies,avacc,conf,rawcounts] = VOCevalseg(VOCopts,'voc11_08s');
%[accuracies,avacc,conf,rawcounts] = VOCevalseg(VOCopts,'deeplab');
%[accuracies,avacc,conf,rawcounts] = VOCevalseg(VOCopts,'wdo');




for i = 1:numel(iids)
    ids = iids(i).name;
    [inim, col] = imread(strcat(im_path,ids));
   
    for j = 1:numel(k)
        alg = stat_choose(k(j));
        [ im, map ] = get_result( alg, iids(i).name(1:end-4) );        
        inim = merge_hypothesis_image(inim, im, k(j));
    end
    
    %imshow(inim,map);
    imwrite(inim, map, [resultpath ids], 'PNG');
end

[accuracies,avacc,conf,rawcounts] = VOCevalseg(VOCopts,'alg_sel');