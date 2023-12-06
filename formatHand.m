function hand = formatHand(playerHand)
        % Remove the brackets
        modifiedString = strrep(playerHand, '[', ''); % Removes '['
        modifiedString = strrep(modifiedString, ']', ''); % Removes ']'

        % Split the string on the quote-space-quote pattern
        splitStr = strsplit(modifiedString, '" "');
        
        % Remove the leading and trailing quotes from the first and last elements
        splitStr{1} = strrep(splitStr{1}, '"', '');
        splitStr{end} = strrep(splitStr{end}, '"', '');
        
        % Convert to string array if needed
        hand = string(splitStr);
        hand = str2num(hand);
end