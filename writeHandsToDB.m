function [] = writeHandsToDB(playersHands, playerCount, channelID, writeKey)
    i = 1;
    while i == 1
        try    
            % Write to data base
            pause(1);
            thingSpeakWrite(channelID, 'WriteKey', writeKey, 'Fields', 1:playerCount, 'Values', playersHands);               
            i = 0;   
        catch err
            disp(err);
            continue
        end
    end
end