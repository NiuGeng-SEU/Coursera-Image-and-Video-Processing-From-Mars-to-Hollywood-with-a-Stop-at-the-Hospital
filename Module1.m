function reduce_intensity_levels(image_path, levels)
    % Read the input image
    image_raw = imread(image_path);
    
    image = im2gray(image_raw);

    % Validate that the levels is a power of 2
    if mod(log2(levels), 1) ~= 0 || levels > 256 || levels < 2
        error('The number of intensity levels must be a power of 2 and between 2 and 256.');
    end
    
    % Calculate the interval size
    interval = 256 / levels;
    
    % Reduce the intensity levels
    reduced_image = floor(double(image) / interval) * interval;
    
    % Display the original and reduced images
    figure;
    subplot(1, 2, 1);
    imshow(image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(uint8(reduced_image));
    title(['Reduced to ', num2str(levels), ' Intensity Levels']);
    
    % Save the processed image
    [~, name, ext] = fileparts(image_path);
    output_path = [name, '_reduced', ext];
    imwrite(uint8(reduced_image), output_path);
    disp(['Processed image saved as ', output_path]);
end

% Example usage:
reduce_intensity_levels('filepath', 8);