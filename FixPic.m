% Modyfikuje zdjęcia znajdujące się w katalogu Data. Zmieniana jest
% rozdzielczość na 512x512 u ustawiany kanał na 3

function FixPic()
    fileList = dir(fullfile('Data', '**', '*.jpeg'));
    
    for i = 1:numel(fileList)
        filePath = fullfile(fileList(i).folder, fileList(i).name);
        image = imread(filePath);
    
        % Zmiana rozmiaru obrazu na 512 x 512
        resizedImage = imresize(image, [512, 512]);
    
        % Upewnienie się, że obraz ma 3 kanały
        if size(resizedImage, 3) ~= 3
            resizedImage = repmat(resizedImage, [1, 1, 3]);
        end
    
        % Zapisanie zmienionego obrazu
        imwrite(resizedImage, filePath);
    
        disp(['Changed file: ', filePath]);
    end

    msgbox('Finished processing pictures', 'Info');
end