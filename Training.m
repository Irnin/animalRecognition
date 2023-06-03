function Training()
    disp('Training...');
    allImages=imageDatastore('Data','IncludeSubfolders',true, 'LabelSource','foldernames');
    
    path = dir('Data');
    labels = nnz(~ismember({path.name},{'.','..'})&[path.isdir])
    
    layers=[imageInputLayer([512 512 3]),
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'Stride',2)
        fullyConnectedLayer(labels)
        softmaxLayer
        classificationLayer()];
    
    options = trainingOptions('sgdm', ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.2, ...
        'LearnRateDropPeriod',5, ...
        'MaxEpochs',30, ...
        'MiniBatchSize',100, ...
        'InitialLearnRate',0.0001,...
        'Plots','training-progress');
    
    convnet=trainNetwork(allImages,layers,options);
    
    save convnet;

    msgbox('Finished training network', 'Info');
end