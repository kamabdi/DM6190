function [ im, map ] = get_result( algo, imid )
% function [ im ] = get_result( algo, imid )
% returns image corresponding to the processing of the selected algorithm

result_path = '/home/kamila/Documents/Data/VOCdevkit/results/VOC2012/Segmentation/';

algorithm_path_extensions = {'voc11_08s_val_cls/', 'deeplab_val_cls/', 'wdo_val_cls/'};

[im, map] = imread([result_path algorithm_path_extensions{algo} imid '.png']);

end