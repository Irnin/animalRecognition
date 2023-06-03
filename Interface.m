function Interface
    fig = uifigure('Position', [100 100 600 200], 'Name', 'Animal Recognition');
    
    prepareButton = uibutton(fig, 'Text', 'Przygotuj obrazy', 'Position', [50 50 100 30], 'ButtonPushedFcn', @preparePicturesFcn);
    trainButton = uibutton(fig, 'Text', 'Trenuj sieć', 'Position', [250 50 100 30], 'ButtonPushedFcn', @trainNetworkFcn);
    checkButton = uibutton(fig, 'Text', 'Sprawdź obraz', 'Position', [450 50 100 30], 'ButtonPushedFcn', @checkImageFcn);
    
    
    banner = uilabel(fig, 'Text', 'Animal Recognition', 'FontSize', 20, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'Position', [0 150 600 30]);
    
    % Przygotowywanie obrazów do pracy
    function preparePicturesFcn(src, event)
        run('FixPic.m');
    end

    % Trenowanie sieci
    function trainNetworkFcn(src, event)
        run("Training.m");
    end

    % Sprawdzanie obrazów
    function checkImageFcn(src, event)
        run('Test.m');
    end
end
