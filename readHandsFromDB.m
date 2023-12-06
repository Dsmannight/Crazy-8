function hand = readHandsFromDB(playerCount, channelID, readKey)
    i = 1;
    playersHands = [];
    while i <= playerCount
        try     
            % Read player's hand
            pause(1);
            datatable = thingSpeakRead(channelID, 'ReadKey', readKey, 'Fields', i, 'OutputFormat', 'Table');
            player = sprintf("Player%d",i);
    
            % Format
            playerHand = datatable{1, player};
            playerHand = formatHand(playerHand{1}); % Returns vector of strings
            playersHands{end+1} = playerHand;
           
            i = i + 1;   
        catch err
            disp(err);
            continue
        end
    end
    hand = playersHands;
end