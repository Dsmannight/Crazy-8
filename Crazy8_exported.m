classdef Crazy8_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        CheckWinButton                 matlab.ui.control.Button
        DiamondButton                  matlab.ui.control.Button
        HeartButton                    matlab.ui.control.Button
        SpadeButton                    matlab.ui.control.Button
        ClubButton                     matlab.ui.control.Button
        SuitSelectLabel                matlab.ui.control.Label
        Label2                         matlab.ui.control.Label
        HintsLabel                     matlab.ui.control.Label
        Label                          matlab.ui.control.Label
        CurrentCardLabel               matlab.ui.control.Label
        Button_52                      matlab.ui.control.Button
        Button_51                      matlab.ui.control.Button
        Button_50                      matlab.ui.control.Button
        Button_49                      matlab.ui.control.Button
        Button_48                      matlab.ui.control.Button
        Button_47                      matlab.ui.control.Button
        Button_46                      matlab.ui.control.Button
        Button_45                      matlab.ui.control.Button
        Button_44                      matlab.ui.control.Button
        Button_43                      matlab.ui.control.Button
        Button_42                      matlab.ui.control.Button
        Button_41                      matlab.ui.control.Button
        Button_40                      matlab.ui.control.Button
        Button_39                      matlab.ui.control.Button
        Button_38                      matlab.ui.control.Button
        Button_37                      matlab.ui.control.Button
        Button_36                      matlab.ui.control.Button
        Button_35                      matlab.ui.control.Button
        Button_34                      matlab.ui.control.Button
        Button_33                      matlab.ui.control.Button
        Button_32                      matlab.ui.control.Button
        Button_31                      matlab.ui.control.Button
        Button_30                      matlab.ui.control.Button
        Button_29                      matlab.ui.control.Button
        Button_28                      matlab.ui.control.Button
        Button_27                      matlab.ui.control.Button
        Button_26                      matlab.ui.control.Button
        Button_25                      matlab.ui.control.Button
        Button_24                      matlab.ui.control.Button
        Button_23                      matlab.ui.control.Button
        Button_22                      matlab.ui.control.Button
        Button_21                      matlab.ui.control.Button
        Button_20                      matlab.ui.control.Button
        Button_19                      matlab.ui.control.Button
        Button_18                      matlab.ui.control.Button
        Button_17                      matlab.ui.control.Button
        Button_16                      matlab.ui.control.Button
        Button_15                      matlab.ui.control.Button
        Button_14                      matlab.ui.control.Button
        Button_13                      matlab.ui.control.Button
        Button_12                      matlab.ui.control.Button
        Button_11                      matlab.ui.control.Button
        Button_10                      matlab.ui.control.Button
        Button_9                       matlab.ui.control.Button
        Button_8                       matlab.ui.control.Button
        Button_7                       matlab.ui.control.Button
        Button_6                       matlab.ui.control.Button
        Button_5                       matlab.ui.control.Button
        Button_4                       matlab.ui.control.Button
        Button_3                       matlab.ui.control.Button
        Button_2                       matlab.ui.control.Button
        Button                         matlab.ui.control.Button
        DrawButton                     matlab.ui.control.Button
        Spot10Label                    matlab.ui.control.Label
        Spot1Label                     matlab.ui.control.Label
        NumberofPlayersEditField       matlab.ui.control.NumericEditField
        NumberofPlayersEditFieldLabel  matlab.ui.control.Label
        StartGameButton                matlab.ui.control.Button
    end

    
    properties (Access = private)
        hand1
        deck
        hand2
        hand3
        hand4
        stack
        up
        compatmx
        suitperm
        currentcompat
    end
    
    methods (Access = private)
        %club spade heart diamond
        function results = disphand(app)
app.Button.Text = convertCharsToStrings(name(app, 1))
app.Button_2.Text = convertCharsToStrings(name(app, 2))
app.Button_3.Text = convertCharsToStrings(name(app, 3))
app.Button_4.Text = convertCharsToStrings(name(app, 4))
app.Button_5.Text = convertCharsToStrings(name(app, 5))
app.Button_6.Text = convertCharsToStrings(name(app, 6))
app.Button_7.Text = convertCharsToStrings(name(app, 7))
app.Button_8.Text = convertCharsToStrings(name(app, 8))
app.Button_9.Text = convertCharsToStrings(name(app, 9))
app.Button_10.Text = convertCharsToStrings(name(app, 10))
app.Button_11.Text = convertCharsToStrings(name(app, 11))
app.Button_12.Text = convertCharsToStrings(name(app, 12))
app.Button_13.Text = convertCharsToStrings(name(app, 13))
app.Button_14.Text = convertCharsToStrings(name(app, 14))
app.Button_15.Text = convertCharsToStrings(name(app, 15))
app.Button_16.Text = convertCharsToStrings(name(app, 16))
app.Button_17.Text = convertCharsToStrings(name(app, 17))
app.Button_18.Text = convertCharsToStrings(name(app, 18))
app.Button_19.Text = convertCharsToStrings(name(app, 19))
app.Button_20.Text = convertCharsToStrings(name(app, 20))
app.Button_21.Text = convertCharsToStrings(name(app, 21))
app.Button_22.Text = convertCharsToStrings(name(app, 22))
app.Button_23.Text = convertCharsToStrings(name(app, 23))
app.Button_24.Text = convertCharsToStrings(name(app, 24))
app.Button_25.Text = convertCharsToStrings(name(app, 25))
app.Button_26.Text = convertCharsToStrings(name(app, 26))
app.Button_27.Text = convertCharsToStrings(name(app, 27))
app.Button_28.Text = convertCharsToStrings(name(app, 28))
app.Button_29.Text = convertCharsToStrings(name(app, 29))
app.Button_30.Text = convertCharsToStrings(name(app, 30))
app.Button_31.Text = convertCharsToStrings(name(app, 31))
app.Button_32.Text = convertCharsToStrings(name(app, 32))
app.Button_33.Text = convertCharsToStrings(name(app, 33))
app.Button_34.Text = convertCharsToStrings(name(app, 34))
app.Button_35.Text = convertCharsToStrings(name(app, 35))
app.Button_36.Text = convertCharsToStrings(name(app, 36))
app.Button_37.Text = convertCharsToStrings(name(app, 37))
app.Button_38.Text = convertCharsToStrings(name(app, 38))
app.Button_39.Text = convertCharsToStrings(name(app, 39))
app.Button_40.Text = convertCharsToStrings(name(app, 40))
app.Button_41.Text = convertCharsToStrings(name(app, 41))
app.Button_42.Text = convertCharsToStrings(name(app, 42))
app.Button_43.Text = convertCharsToStrings(name(app, 43))
app.Button_44.Text = convertCharsToStrings(name(app, 44))
app.Button_45.Text = convertCharsToStrings(name(app, 45))
app.Button_46.Text = convertCharsToStrings(name(app, 46))
app.Button_47.Text = convertCharsToStrings(name(app, 47))
app.Button_48.Text = convertCharsToStrings(name(app, 48))
app.Button_49.Text = convertCharsToStrings(name(app, 49))
app.Button_50.Text = convertCharsToStrings(name(app, 50))
app.Button_51.Text = convertCharsToStrings(name(app, 51))
app.Button_52.Text = convertCharsToStrings(name(app, 52))

app.Label.Text = convertCharsToStrings(stackname(app))

results = true;
        end
        
        function compat = compat(app, num)
                       
        card = app.hand1(num);
        [upr, upc] = find(app.compatmx==app.stack);
         [cardr, cardc] = find(app.compatmx==card);
         if (((cardr == upr) | (cardc == upc)) | ismember(card, app.compatmx(:,8)))
             compat = true; 
            app.stack = card;
             app.hand1(num) = 0; 
         else
             compat = false; 
         end

        if ismember(card, app.compatmx(:,8))
             app.suitperm = true; 
             app.Label2.Text = "Crazy 8! Select a Suit!";
        end


disphand(app)
        end



        
 
    
    
    
        
        function cardname = stackname(app)
            cardnum = app.stack; 
            [cardr, cardc] = find(app.compatmx==cardnum);
            switch cardr
                case 1
                    suf = ' of Clubs'; 
                case 2
                    suf = ' of Spades';
                case 3
                    suf = ' of Hearts'; 
                case 4
                    suf = ' of Diamonds';
            end
            switch cardc
                case 1
                pre = 'Ace';
                case 2
                    pre = '2';
                case 3
                    pre = '3';
                case 4
                    pre = '4';
                case 5
                    pre = '5';
                    case 6
                    pre = '6';
                    case 7
                    pre = '7';
                    case 8
                    pre = '8';
                    case 9
                    pre = '9';
                    case 10
                    pre = '10';
                    case 11
                    pre = 'J';
                    case 12
                    pre = 'Q';
                    case 13
                    pre = 'K';
               
            end
            cardname = [pre,suf];
           
               

        end
function cardname = name(app, num)
            cardnum = app.hand1(num); 
            if cardnum==0
                cardname = 'Empty'
                return
            end
           

            [cardr, cardc] = find(app.compatmx==cardnum);
            switch cardr
                case 1
                    suf = ' of Clubs'; 
                case 2
                    suf = ' of Spades';
                case 3
                    suf = ' of Hearts'; 
                case 4
                    suf = ' of Diamonds';

            end
            switch cardc
                case 1
                pre = 'Ace';
                case 2
                    pre = '2';
                case 3
                    pre = '3';
                case 4
                    pre = '4';
                case 5
                    pre = '5';
                    case 6
                    pre = '6';
                    case 7
                    pre = '7';
                    case 8
                    pre = '8';
                    case 9
                    pre = '9';
                    case 10
                    pre = '10';
                    case 11
                    pre = 'J';
                    case 12
                    pre = 'Q';
                    case 13
                    pre = 'K';
            end
            cardname = [pre,suf];
               
            
        end

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: StartGameButton
        function StartGameButtonPushed(app, event)
           app.compatmx = [1:13; 14:26; 27:39; 40:52]; 
           app.deck = randperm(52,52);
           app.hand1 = zeros(1,52);
          app.suitperm = false; 
          app.Label2.Text = " ";

          
            if app.NumberofPlayersEditField.Value == 1
                for i=1:5
app.hand1(i) = app.deck(i);
disp(app.hand1) %for diag
                end
                    
                    %app.hand1 = sort(app.hand1)
                    
                    for i=1:5
                       app.deck = app.deck(app.deck~=app.hand1(i))
                       %app.deck = app.deck([app.deck~=app.hand2(i)])
                    end
disp(app.hand1) %for diag
disp(app.deck) %for diag

                
app.up = app.deck(1); %the facing up card is that which was just drawn by the dealer from the top of the deck
               app.deck(1) = []; %the up card is no longer in the deck
               app.stack = app.up; %the stack of played cards begins with the up card

disphand(app) %disp user's hand
                elseif app.NumberofPlayersEditField.Value == 2
                   
                    app.hand1 = app.deck(1:5);
                     app.hand2 = app.deck(6:10);
                     app.hand1 = sort(app.hand1);
                     app.hand2 = sort(app.hand2);
                    % for i=1:5
                    %   deck = deck([deck~=hand1(i)]);
                    %   deck = deck([deck~=hand2(i)]);
                    %end
                elseif app.NumberofPlayersEditField.Value == 3
                   
                    app.hand1 = app.deck(1:5);
                     app.hand2 = app.deck(6:10);
                     app.hand2 = app.deck(11:15);
                     app.hand1 = sort(app.hand1);
                     app.hand2 = sort(app.hand2);
                     app.hand3 = sort(app.hand3);
                     %for i=1:5
                      % deck = deck([deck~=hand1(i)]);
                     %  deck = deck([deck~=hand2(i)]);
                    %   deck = deck([deck~=hand3(i)]);
                   % end
                elseif app.NumberofPlayersEditField.Value == 4
             
                    app.hand1 = app.deck(1:5);
                     app.hand2 = app.deck(6:10);
                     app.hand2 = app.deck(11:15);
                     app.hand2 = app.deck(16:20);
                     app.hand1 = sort(app.hand1);
                     app.hand2 = sort(app.hand2);
                     app.hand3 = sort(app.hand3);
                     app.hand4 = sort(app.hand4);
                     %  for i=1:5
                      % deck = deck([deck~=hand1(i)]);
                       %deck = deck([deck~=hand2(i)]);
                       %deck = deck([deck~=hand3(i)]);
                       %deck = deck([deck~=hand4(i)]);
                      
                    %end
                else 
                    app.hand1 = [] ;
                end
             

%for i=1:length(hand1)
 %   app.Image = image(app.UIAxes,'CData',imread([filepath, hand1(i)));
  


        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
              num = 1; 
              compat(app, num);
        end

        % Button pushed function: DrawButton
        function DrawButtonPushed(app, event)
           
app.hand1(find((app.hand1 == 0),1)) = app.deck(1) %hand1, at the location of its first zero, equals the top card in the deck
 %add the top of the deck to the hand
            app.deck(1) = [] %the top of the deck is no longer in the deck
            disp(app.hand1) %for diag purposes
disp(app.deck) %for diag purposes
disphand(app) %display the user's hand
        end

        % Button pushed function: ClubButton
        function ClubButtonPushed(app, event)
            switch app.suitperm
                case true 
                app.stack = 8;
                app.suitperm = false;
                disphand(app)
                otherwise  
                    app.Label2.Text = "You know what you did, cheater";
            end
        end

        % Button pushed function: SpadeButton
        function SpadeButtonPushed(app, event)
               switch app.suitperm
                   case true 
                app.stack = 21;
                app.suitperm = false;
                disphand(app)
                   otherwise  
                    app.Label2.Text = "You know what you did, cheater";
            end
        end

        % Button pushed function: HeartButton
        function HeartButtonPushed(app, event)
               switch app.suitperm
                   case true 
                app.stack = 34;
                app.suitperm = false;
                disphand(app)
                   otherwise  
                    app.Label2.Text = "You know what you did, cheater";
            end
        end

        % Button pushed function: DiamondButton
        function DiamondButtonPushed(app, event)
               switch app.suitperm
                   case true
                app.stack = 47;
                app.suitperm = false;
                disphand(app)
                   otherwise 
                    app.Label2.Text = "You know what you did, cheater";
            end
        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
            num = 2; 
              compat(app, num);
        end

        % Button pushed function: Button_3
        function Button_3Pushed(app, event)
            num = 3; 
              compat(app, num);
        end

        % Button pushed function: Button_4
        function Button_4Pushed(app, event)
            num = 4; 
              compat(app, num);
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            num = 5; 
              compat(app, num);
        end

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            num = 6; 
              compat(app, num);
        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            num = 7; 
              compat(app, num);
        end

        % Button pushed function: Button_8
        function Button_8Pushed(app, event)
            num = 8; 
              compat(app, num);
        end

        % Button pushed function: Button_9
        function Button_9Pushed(app, event)
            num = 9; 
              compat(app, num);
        end

        % Button pushed function: Button_10
        function Button_10Pushed(app, event)
            num = 10; 
              compat(app, num);
        end

        % Button pushed function: Button_11
        function Button_11Pushed(app, event)
            num = 11; 
              compat(app, num);
        end

        % Button pushed function: Button_12
        function Button_12Pushed(app, event)
            num = 12; 
              compat(app, num);
        end

        % Button pushed function: Button_13
        function Button_13Pushed(app, event)
            num = 13; 
              compat(app, num);
        end

        % Button pushed function: Button_14
        function Button_14Pushed(app, event)
            num = 14; 
              compat(app, num);
        end

        % Button pushed function: Button_15
        function Button_15Pushed(app, event)
            num = 15; 
              compat(app, num);
        end

        % Button pushed function: Button_16
        function Button_16Pushed(app, event)
            num = 16; 
              compat(app, num);
        end

        % Button pushed function: Button_17
        function Button_17Pushed(app, event)
            num = 17; 
              compat(app, num);
        end

        % Button pushed function: Button_18
        function Button_18Pushed(app, event)
            num = 18; 
              compat(app, num);
        end

        % Button pushed function: Button_19
        function Button_19Pushed(app, event)
            num = 19; 
              compat(app, num);
        end

        % Button pushed function: Button_20
        function Button_20Pushed(app, event)
            num = 20; 
              compat(app, num);
        end

        % Button pushed function: Button_21
        function Button_21Pushed(app, event)
            num = 21; 
              compat(app, num);
        end

        % Button pushed function: Button_22
        function Button_22Pushed(app, event)
            num = 22; 
              compat(app, num);
        end

        % Button pushed function: Button_23
        function Button_23Pushed(app, event)
            num = 23; 
              compat(app, num);
        end

        % Button pushed function: Button_24
        function Button_24Pushed(app, event)
            num = 24; 
              compat(app, num);
        end

        % Button pushed function: Button_25
        function Button_25Pushed(app, event)
            num = 25; 
              compat(app, num);
        end

        % Button pushed function: Button_26
        function Button_26Pushed(app, event)
            num = 26; 
              compat(app, num);
        end

        % Button pushed function: Button_27
        function Button_27Pushed(app, event)
            num = 27; 
              compat(app, num);
        end

        % Button pushed function: Button_28
        function Button_28Pushed(app, event)
            num = 28; 
              compat(app, num);
        end

        % Button pushed function: Button_29
        function Button_29Pushed(app, event)
            num = 29; 
              compat(app, num);
        end

        % Button pushed function: Button_30
        function Button_30Pushed(app, event)
            num = 30; 
              compat(app, num);
        end

        % Button pushed function: Button_31
        function Button_31Pushed(app, event)
            num = 31; 
              compat(app, num);
        end

        % Button pushed function: Button_32
        function Button_32Pushed(app, event)
            num = 32; 
              compat(app, num);
        end

        % Button pushed function: Button_33
        function Button_33Pushed(app, event)
            num = 33; 
              compat(app, num);
        end

        % Button pushed function: Button_34
        function Button_34Pushed(app, event)
            num = 34; 
              compat(app, num);
        end

        % Button pushed function: Button_35
        function Button_35Pushed(app, event)
            num = 35; 
              compat(app, num);
        end

        % Button pushed function: Button_36
        function Button_36Pushed(app, event)
            num = 36; 
              compat(app, num);
        end

        % Button pushed function: Button_37
        function Button_37Pushed(app, event)
            num = 37; 
              compat(app, num);
        end

        % Button pushed function: Button_38
        function Button_38Pushed(app, event)
            num = 38; 
              compat(app, num);
        end

        % Button pushed function: Button_39
        function Button_39Pushed(app, event)
            num = 39; 
              compat(app, num);
        end

        % Button pushed function: Button_40
        function Button_40Pushed(app, event)
            num = 40; 
              compat(app, num);
        end

        % Button pushed function: Button_41
        function Button_41Pushed(app, event)
            num = 41; 
              compat(app, num);
        end

        % Button pushed function: Button_42
        function Button_42Pushed(app, event)
            num = 42; 
              compat(app, num);
        end

        % Button pushed function: Button_43
        function Button_43Pushed(app, event)
            num = 43; 
              compat(app, num);
        end

        % Button pushed function: Button_44
        function Button_44Pushed(app, event)
            num = 44; 
              compat(app, num);
        end

        % Button pushed function: Button_45
        function Button_45Pushed(app, event)
            num = 45; 
              compat(app, num);
        end

        % Button pushed function: Button_46
        function Button_46Pushed(app, event)
            num = 46; 
              compat(app, num);
        end

        % Button pushed function: Button_47
        function Button_47Pushed(app, event)
            num = 47; 
              compat(app, num);
        end

        % Button pushed function: Button_48
        function Button_48Pushed(app, event)
            num = 48; 
              compat(app, num);
        end

        % Button pushed function: Button_49
        function Button_49Pushed(app, event)
            num = 49; 
              compat(app, num);
        end

        % Button pushed function: Button_50
        function Button_50Pushed(app, event)
            num = 50; 
              compat(app, num);
        end

        % Button pushed function: Button_51
        function Button_51Pushed(app, event)
            num = 51; 
              compat(app, num);
        end

        % Button pushed function: Button_52
        function Button_52Pushed(app, event)
            num = 52; 
              compat(app, num);
        end

        % Button pushed function: CheckWinButton
        function CheckWinButtonPushed(app, event)
            if (sum([app.hand1 > 0]) == 0)
    
        app.Label.Text = "You Win!";
        app.Label2.Text = "You Win!";
            else 
app.Label.Text = "Not quite.";
        app.Label2.Text = "Not quite.";
end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create StartGameButton
            app.StartGameButton = uibutton(app.UIFigure, 'push');
            app.StartGameButton.ButtonPushedFcn = createCallbackFcn(app, @StartGameButtonPushed, true);
            app.StartGameButton.Position = [16 431 100 23];
            app.StartGameButton.Text = 'Start Game';

            % Create NumberofPlayersEditFieldLabel
            app.NumberofPlayersEditFieldLabel = uilabel(app.UIFigure);
            app.NumberofPlayersEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofPlayersEditFieldLabel.FontWeight = 'bold';
            app.NumberofPlayersEditFieldLabel.Position = [7 403 111 22];
            app.NumberofPlayersEditFieldLabel.Text = 'Number of Players';

            % Create NumberofPlayersEditField
            app.NumberofPlayersEditField = uieditfield(app.UIFigure, 'numeric');
            app.NumberofPlayersEditField.Limits = [0 4];
            app.NumberofPlayersEditField.FontWeight = 'bold';
            app.NumberofPlayersEditField.Position = [190 403 100 22];
            app.NumberofPlayersEditField.Value = 1;

            % Create Spot1Label
            app.Spot1Label = uilabel(app.UIFigure);
            app.Spot1Label.Position = [49 246 41 22];
            app.Spot1Label.Text = 'Spot 1';

            % Create Spot10Label
            app.Spot10Label = uilabel(app.UIFigure);
            app.Spot10Label.Position = [577 246 47 22];
            app.Spot10Label.Text = 'Spot 10';

            % Create DrawButton
            app.DrawButton = uibutton(app.UIFigure, 'push');
            app.DrawButton.ButtonPushedFcn = createCallbackFcn(app, @DrawButtonPushed, true);
            app.DrawButton.Position = [16 369 100 23];
            app.DrawButton.Text = 'Draw';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.FontSize = 11;
            app.Button.Position = [1 219 77 22];

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.FontSize = 11;
            app.Button_2.Position = [77 219 77 22];

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'push');
            app.Button_3.ButtonPushedFcn = createCallbackFcn(app, @Button_3Pushed, true);
            app.Button_3.FontSize = 11;
            app.Button_3.Position = [153 219 77 22];

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @Button_4Pushed, true);
            app.Button_4.FontSize = 11;
            app.Button_4.Position = [229 219 77 22];

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.FontSize = 11;
            app.Button_5.Position = [305 219 77 22];

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.FontSize = 11;
            app.Button_6.Position = [381 219 77 22];

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.FontSize = 11;
            app.Button_7.Position = [457 219 77 22];

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Button_8.FontSize = 11;
            app.Button_8.Position = [533 219 77 22];

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @Button_9Pushed, true);
            app.Button_9.FontSize = 11;
            app.Button_9.Position = [1 202 77 22];

            % Create Button_10
            app.Button_10 = uibutton(app.UIFigure, 'push');
            app.Button_10.ButtonPushedFcn = createCallbackFcn(app, @Button_10Pushed, true);
            app.Button_10.FontSize = 11;
            app.Button_10.Position = [77 202 77 22];

            % Create Button_11
            app.Button_11 = uibutton(app.UIFigure, 'push');
            app.Button_11.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_11.FontSize = 11;
            app.Button_11.Position = [153 202 77 22];

            % Create Button_12
            app.Button_12 = uibutton(app.UIFigure, 'push');
            app.Button_12.ButtonPushedFcn = createCallbackFcn(app, @Button_12Pushed, true);
            app.Button_12.FontSize = 11;
            app.Button_12.Position = [229 202 77 22];

            % Create Button_13
            app.Button_13 = uibutton(app.UIFigure, 'push');
            app.Button_13.ButtonPushedFcn = createCallbackFcn(app, @Button_13Pushed, true);
            app.Button_13.FontSize = 11;
            app.Button_13.Position = [305 202 77 22];

            % Create Button_14
            app.Button_14 = uibutton(app.UIFigure, 'push');
            app.Button_14.ButtonPushedFcn = createCallbackFcn(app, @Button_14Pushed, true);
            app.Button_14.FontSize = 11;
            app.Button_14.Position = [381 202 77 22];

            % Create Button_15
            app.Button_15 = uibutton(app.UIFigure, 'push');
            app.Button_15.ButtonPushedFcn = createCallbackFcn(app, @Button_15Pushed, true);
            app.Button_15.FontSize = 11;
            app.Button_15.Position = [457 202 77 22];

            % Create Button_16
            app.Button_16 = uibutton(app.UIFigure, 'push');
            app.Button_16.ButtonPushedFcn = createCallbackFcn(app, @Button_16Pushed, true);
            app.Button_16.FontSize = 11;
            app.Button_16.Position = [533 202 77 22];

            % Create Button_17
            app.Button_17 = uibutton(app.UIFigure, 'push');
            app.Button_17.ButtonPushedFcn = createCallbackFcn(app, @Button_17Pushed, true);
            app.Button_17.FontSize = 11;
            app.Button_17.Position = [1 185 77 22];

            % Create Button_18
            app.Button_18 = uibutton(app.UIFigure, 'push');
            app.Button_18.ButtonPushedFcn = createCallbackFcn(app, @Button_18Pushed, true);
            app.Button_18.FontSize = 11;
            app.Button_18.Position = [77 185 77 22];

            % Create Button_19
            app.Button_19 = uibutton(app.UIFigure, 'push');
            app.Button_19.ButtonPushedFcn = createCallbackFcn(app, @Button_19Pushed, true);
            app.Button_19.FontSize = 11;
            app.Button_19.Position = [153 185 77 22];

            % Create Button_20
            app.Button_20 = uibutton(app.UIFigure, 'push');
            app.Button_20.ButtonPushedFcn = createCallbackFcn(app, @Button_20Pushed, true);
            app.Button_20.FontSize = 11;
            app.Button_20.Position = [229 185 77 22];

            % Create Button_21
            app.Button_21 = uibutton(app.UIFigure, 'push');
            app.Button_21.ButtonPushedFcn = createCallbackFcn(app, @Button_21Pushed, true);
            app.Button_21.FontSize = 11;
            app.Button_21.Position = [305 185 77 22];

            % Create Button_22
            app.Button_22 = uibutton(app.UIFigure, 'push');
            app.Button_22.ButtonPushedFcn = createCallbackFcn(app, @Button_22Pushed, true);
            app.Button_22.FontSize = 11;
            app.Button_22.Position = [381 185 77 22];

            % Create Button_23
            app.Button_23 = uibutton(app.UIFigure, 'push');
            app.Button_23.ButtonPushedFcn = createCallbackFcn(app, @Button_23Pushed, true);
            app.Button_23.FontSize = 11;
            app.Button_23.Position = [457 185 77 22];

            % Create Button_24
            app.Button_24 = uibutton(app.UIFigure, 'push');
            app.Button_24.ButtonPushedFcn = createCallbackFcn(app, @Button_24Pushed, true);
            app.Button_24.FontSize = 11;
            app.Button_24.Position = [533 185 77 22];

            % Create Button_25
            app.Button_25 = uibutton(app.UIFigure, 'push');
            app.Button_25.ButtonPushedFcn = createCallbackFcn(app, @Button_25Pushed, true);
            app.Button_25.FontSize = 11;
            app.Button_25.Position = [1 168 77 22];

            % Create Button_26
            app.Button_26 = uibutton(app.UIFigure, 'push');
            app.Button_26.ButtonPushedFcn = createCallbackFcn(app, @Button_26Pushed, true);
            app.Button_26.FontSize = 11;
            app.Button_26.Position = [77 168 77 22];

            % Create Button_27
            app.Button_27 = uibutton(app.UIFigure, 'push');
            app.Button_27.ButtonPushedFcn = createCallbackFcn(app, @Button_27Pushed, true);
            app.Button_27.FontSize = 11;
            app.Button_27.Position = [153 168 77 22];

            % Create Button_28
            app.Button_28 = uibutton(app.UIFigure, 'push');
            app.Button_28.ButtonPushedFcn = createCallbackFcn(app, @Button_28Pushed, true);
            app.Button_28.FontSize = 11;
            app.Button_28.Position = [229 168 77 22];

            % Create Button_29
            app.Button_29 = uibutton(app.UIFigure, 'push');
            app.Button_29.ButtonPushedFcn = createCallbackFcn(app, @Button_29Pushed, true);
            app.Button_29.FontSize = 11;
            app.Button_29.Position = [305 168 77 22];

            % Create Button_30
            app.Button_30 = uibutton(app.UIFigure, 'push');
            app.Button_30.ButtonPushedFcn = createCallbackFcn(app, @Button_30Pushed, true);
            app.Button_30.FontSize = 11;
            app.Button_30.Position = [381 168 77 22];

            % Create Button_31
            app.Button_31 = uibutton(app.UIFigure, 'push');
            app.Button_31.ButtonPushedFcn = createCallbackFcn(app, @Button_31Pushed, true);
            app.Button_31.FontSize = 11;
            app.Button_31.Position = [457 168 77 22];

            % Create Button_32
            app.Button_32 = uibutton(app.UIFigure, 'push');
            app.Button_32.ButtonPushedFcn = createCallbackFcn(app, @Button_32Pushed, true);
            app.Button_32.FontSize = 11;
            app.Button_32.Position = [533 168 77 22];

            % Create Button_33
            app.Button_33 = uibutton(app.UIFigure, 'push');
            app.Button_33.ButtonPushedFcn = createCallbackFcn(app, @Button_33Pushed, true);
            app.Button_33.FontSize = 11;
            app.Button_33.Position = [1 151 77 22];

            % Create Button_34
            app.Button_34 = uibutton(app.UIFigure, 'push');
            app.Button_34.ButtonPushedFcn = createCallbackFcn(app, @Button_34Pushed, true);
            app.Button_34.FontSize = 11;
            app.Button_34.Position = [77 151 77 22];

            % Create Button_35
            app.Button_35 = uibutton(app.UIFigure, 'push');
            app.Button_35.ButtonPushedFcn = createCallbackFcn(app, @Button_35Pushed, true);
            app.Button_35.FontSize = 11;
            app.Button_35.Position = [153 151 77 22];

            % Create Button_36
            app.Button_36 = uibutton(app.UIFigure, 'push');
            app.Button_36.ButtonPushedFcn = createCallbackFcn(app, @Button_36Pushed, true);
            app.Button_36.FontSize = 11;
            app.Button_36.Position = [229 151 77 22];

            % Create Button_37
            app.Button_37 = uibutton(app.UIFigure, 'push');
            app.Button_37.ButtonPushedFcn = createCallbackFcn(app, @Button_37Pushed, true);
            app.Button_37.FontSize = 11;
            app.Button_37.Position = [305 151 77 22];

            % Create Button_38
            app.Button_38 = uibutton(app.UIFigure, 'push');
            app.Button_38.ButtonPushedFcn = createCallbackFcn(app, @Button_38Pushed, true);
            app.Button_38.FontSize = 11;
            app.Button_38.Position = [381 151 77 22];

            % Create Button_39
            app.Button_39 = uibutton(app.UIFigure, 'push');
            app.Button_39.ButtonPushedFcn = createCallbackFcn(app, @Button_39Pushed, true);
            app.Button_39.FontSize = 11;
            app.Button_39.Position = [457 151 77 22];

            % Create Button_40
            app.Button_40 = uibutton(app.UIFigure, 'push');
            app.Button_40.ButtonPushedFcn = createCallbackFcn(app, @Button_40Pushed, true);
            app.Button_40.FontSize = 11;
            app.Button_40.Position = [533 151 77 22];

            % Create Button_41
            app.Button_41 = uibutton(app.UIFigure, 'push');
            app.Button_41.ButtonPushedFcn = createCallbackFcn(app, @Button_41Pushed, true);
            app.Button_41.FontSize = 11;
            app.Button_41.Position = [1 134 77 22];

            % Create Button_42
            app.Button_42 = uibutton(app.UIFigure, 'push');
            app.Button_42.ButtonPushedFcn = createCallbackFcn(app, @Button_42Pushed, true);
            app.Button_42.FontSize = 11;
            app.Button_42.Position = [77 134 77 22];

            % Create Button_43
            app.Button_43 = uibutton(app.UIFigure, 'push');
            app.Button_43.ButtonPushedFcn = createCallbackFcn(app, @Button_43Pushed, true);
            app.Button_43.FontSize = 11;
            app.Button_43.Position = [153 134 77 22];

            % Create Button_44
            app.Button_44 = uibutton(app.UIFigure, 'push');
            app.Button_44.ButtonPushedFcn = createCallbackFcn(app, @Button_44Pushed, true);
            app.Button_44.FontSize = 11;
            app.Button_44.Position = [229 134 77 22];

            % Create Button_45
            app.Button_45 = uibutton(app.UIFigure, 'push');
            app.Button_45.ButtonPushedFcn = createCallbackFcn(app, @Button_45Pushed, true);
            app.Button_45.FontSize = 11;
            app.Button_45.Position = [305 134 77 22];

            % Create Button_46
            app.Button_46 = uibutton(app.UIFigure, 'push');
            app.Button_46.ButtonPushedFcn = createCallbackFcn(app, @Button_46Pushed, true);
            app.Button_46.FontSize = 11;
            app.Button_46.Position = [381 134 77 22];

            % Create Button_47
            app.Button_47 = uibutton(app.UIFigure, 'push');
            app.Button_47.ButtonPushedFcn = createCallbackFcn(app, @Button_47Pushed, true);
            app.Button_47.FontSize = 11;
            app.Button_47.Position = [457 134 77 22];

            % Create Button_48
            app.Button_48 = uibutton(app.UIFigure, 'push');
            app.Button_48.ButtonPushedFcn = createCallbackFcn(app, @Button_48Pushed, true);
            app.Button_48.FontSize = 11;
            app.Button_48.Position = [533 134 77 22];

            % Create Button_49
            app.Button_49 = uibutton(app.UIFigure, 'push');
            app.Button_49.ButtonPushedFcn = createCallbackFcn(app, @Button_49Pushed, true);
            app.Button_49.FontSize = 11;
            app.Button_49.Position = [1 117 77 22];

            % Create Button_50
            app.Button_50 = uibutton(app.UIFigure, 'push');
            app.Button_50.ButtonPushedFcn = createCallbackFcn(app, @Button_50Pushed, true);
            app.Button_50.FontSize = 11;
            app.Button_50.Position = [77 117 77 22];

            % Create Button_51
            app.Button_51 = uibutton(app.UIFigure, 'push');
            app.Button_51.ButtonPushedFcn = createCallbackFcn(app, @Button_51Pushed, true);
            app.Button_51.FontSize = 11;
            app.Button_51.Position = [153 117 77 22];

            % Create Button_52
            app.Button_52 = uibutton(app.UIFigure, 'push');
            app.Button_52.ButtonPushedFcn = createCallbackFcn(app, @Button_52Pushed, true);
            app.Button_52.FontSize = 11;
            app.Button_52.Position = [229 117 77 22];

            % Create CurrentCardLabel
            app.CurrentCardLabel = uilabel(app.UIFigure);
            app.CurrentCardLabel.FontWeight = 'bold';
            app.CurrentCardLabel.Position = [304 360 86 22];
            app.CurrentCardLabel.Text = 'Current Card: ';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'center';
            app.Label.Position = [279 331 131 22];

            % Create HintsLabel
            app.HintsLabel = uilabel(app.UIFigure);
            app.HintsLabel.FontWeight = 'bold';
            app.HintsLabel.Position = [524 360 38 22];
            app.HintsLabel.Text = 'Hints:';

            % Create Label2
            app.Label2 = uilabel(app.UIFigure);
            app.Label2.HorizontalAlignment = 'center';
            app.Label2.Position = [443 331 198 22];
            app.Label2.Text = 'Label2';

            % Create SuitSelectLabel
            app.SuitSelectLabel = uilabel(app.UIFigure);
            app.SuitSelectLabel.FontWeight = 'bold';
            app.SuitSelectLabel.Position = [37 339 70 22];
            app.SuitSelectLabel.Text = 'Suit Select:';

            % Create ClubButton
            app.ClubButton = uibutton(app.UIFigure, 'push');
            app.ClubButton.ButtonPushedFcn = createCallbackFcn(app, @ClubButtonPushed, true);
            app.ClubButton.Position = [1 309 40 23];
            app.ClubButton.Text = 'Club';

            % Create SpadeButton
            app.SpadeButton = uibutton(app.UIFigure, 'push');
            app.SpadeButton.ButtonPushedFcn = createCallbackFcn(app, @SpadeButtonPushed, true);
            app.SpadeButton.Position = [41 309 50 23];
            app.SpadeButton.Text = 'Spade';

            % Create HeartButton
            app.HeartButton = uibutton(app.UIFigure, 'push');
            app.HeartButton.ButtonPushedFcn = createCallbackFcn(app, @HeartButtonPushed, true);
            app.HeartButton.Position = [90 309 44 23];
            app.HeartButton.Text = 'Heart';

            % Create DiamondButton
            app.DiamondButton = uibutton(app.UIFigure, 'push');
            app.DiamondButton.ButtonPushedFcn = createCallbackFcn(app, @DiamondButtonPushed, true);
            app.DiamondButton.Position = [133 309 63 23];
            app.DiamondButton.Text = 'Diamond';

            % Create CheckWinButton
            app.CheckWinButton = uibutton(app.UIFigure, 'push');
            app.CheckWinButton.ButtonPushedFcn = createCallbackFcn(app, @CheckWinButtonPushed, true);
            app.CheckWinButton.Position = [22 279 100 23];
            app.CheckWinButton.Text = 'Check Win';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Crazy8_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end