function reduce_spatial_resolution(image_path,block_number)
    % Read the input image
    image_raw = imread(image_path);
    
    image = im2gray(image_raw);
    
    % Reduce spatial resolution using blocks
    reduced_img = blockproc(image, [block_number block_number], @(block) mean(block.data(:)) * ones(size(block.data)));

    imshow(uint8(reduced_img));
end

% Example usage:
reduce_spatial_resolution('filepath',3);