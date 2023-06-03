function Test()
    
    if ~exist('convnet.mat', 'file')
        msgbox('convnet.mat doesnt exist', 'Info');
        disp('convnet.mat doesnt exist');
        return
    end

    load convnet;
    
    [file,path] = uigetfile('./Test/*.*');
    
    if isequal(file,0)
       disp('Cancled');
    
    else
       image = imread(fullfile(path,file));
    
       % Przetworzenie obrazu do wymiaru 512x512x3
       resizedImage = imresize(image, [512, 512]);    
       if size(resizedImage, 3) ~= 3
          resizedImage = repmat(resizedImage, [1, 1, 3]);
       end
        
       % Klasyfikacja obrazu
       prediction = classify(convnet, resizedImage);
        
       % Wyświetlenie zdjęcia z opisem
       imshow(resizedImage);
       title(char(prediction));
       drawnow;
    end
end