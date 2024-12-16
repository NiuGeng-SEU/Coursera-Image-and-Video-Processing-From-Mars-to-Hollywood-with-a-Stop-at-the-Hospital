function spatial_averaging(image_path,neighbor_number)
    % Input image
    image_raw = imread(image_path);
    
    image = im2gray(image_raw);
    
    % Perform spatial averaging with different neighborhood sizes
    avg_img = spatial_average(image, neighbor_number);
    
    % Display the original and processed images
    figure;
    imshow(uint8(avg_img));
end

function avg_image = spatial_average(image, neighborhood_size)
    % Get the size of the image
    [rows, cols] = size(image);
    
    % Pad the image to handle boundaries
    pad_size = floor(neighborhood_size / 2);
    padded_image = padarray(image, [pad_size, pad_size], 'replicate');
    
    % Initialize the output image
    avg_image = zeros(rows, cols);
    
    % Perform the averaging
    for i = 1:rows
        for j = 1:cols
            % Extract the neighborhood
            neighborhood = padded_image(i:i+neighborhood_size-1, j:j+neighborhood_size-1);
            % Compute the average
            avg_image(i, j) = mean(neighborhood(:));
        end
    end
end

% Example usage:
spatial_averaging('filepath',3);