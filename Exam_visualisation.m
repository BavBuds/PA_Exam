% Specify the path to the downloaded GeoTIFF file
tiffFilePath = 'C:\Users\maxib\OneDrive\Desktop\Ag Bioscie\SS23\Plant Phenotyping\Exam\classified_image.tif';

% Read the GeoTIFF image using the imread function
[imageData, ~, ~] = geotiffread(tiffFilePath);

% Reshape the image data into a column vector for class assignment
reshapedImageData = reshape(imageData, [], 1);

% Define your class assignments
classAssignments = [0; 1; 2]; % Assign classes based on pixel values

% Calculate the total number of pixels
totalPixels = numel(reshapedImageData);

% Count the number of pixels in each class
classCounts = histc(reshapedImageData, classAssignments);

% Calculate the percentage of pixels in each class
classPercentages = (classCounts / totalPixels) * 100;

% Define class names
classNames = {'Vegetation', 'Soil', 'Water'};

% Create a bar graph
figure;
bar(classAssignments, classPercentages);
xlabel('Class');
ylabel('Percentage of Pixels (%)');
title('Percentage of Pixels in Each Class');
set(gca, 'xticklabel', classNames); % Set class names as x-axis tick labels
