classdef Crazy8images1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        Image11                        matlab.ui.control.Image
        Image10                        matlab.ui.control.Image
        Image9                         matlab.ui.control.Image
        Image8                         matlab.ui.control.Image
        Image7                         matlab.ui.control.Image
        Image6                         matlab.ui.control.Image
        Image5                         matlab.ui.control.Image
        Image4                         matlab.ui.control.Image
        Image3                         matlab.ui.control.Image
        Image2                         matlab.ui.control.Image
        Image1                         matlab.ui.control.Image
        CheckWinButton                 matlab.ui.control.Button
        DiamondButton                  matlab.ui.control.Button
        HeartButton                    matlab.ui.control.Button
        SpadeButton                    matlab.ui.control.Button
        ClubButton                     matlab.ui.control.Button
        SuitSelectLabel                matlab.ui.control.Label
        Label2                         matlab.ui.control.Label
        HintsLabel                     matlab.ui.control.Label
        CurrentCardLabel               matlab.ui.control.Label
        DrawButton                     matlab.ui.control.Button
        Spot10Label                    matlab.ui.control.Label
        Spot1Label                     matlab.ui.control.Label
        NumberofPlayersEditField       matlab.ui.control.NumericEditField
        NumberofPlayersEditFieldLabel  matlab.ui.control.Label
        StartGameButton                matlab.ui.control.Button
    end

    
    methods (Access = private)
        %club spade heart diamond

      function results = disphand(app)
          images = [app.Image1, app.Image2, app.Image3, app.Image4, app.Image5, app.Image6, app.Image7, app.Image8, app.Image9, app.Image10,app.Image11,app.Image12,app.Image13,app.Image14,app.Image15,app.Image16,app.Image17,app.Image18,app.Image19,app.Image20,app.Image21];

for i = 1:21 %ill have this go to 52 once i add all 52 buttons. 
        if app.hand1(i) ~= 0
            cardname = name(app, i); % Get the name of the card at position i
            imageFile = [cardname,'.png']; 
            images(i).ImageSource = convertCharsToStrings(imageFile); 
      
      
            cardnamestack = stackname(app); %this shows the card in the stack
            imageFileStack = [cardnamestack,'.png'];
            app.Image1.ImageSource = convertCharsToStrings(imageFileStack);
        else 
                
           images(i).ImageSource = convertCharsToStrings('Empty.png');
        
        
end
end
      end


        function compat = compat(app, num)
                       
        card = app.hand1(num);
        [upr, upc] = find(app.compatmx==app.stack);
         [cardr, cardc] = find(app.compatmx==card);
         if (((cardr == upr) | (cardc == upc)) | ismember(card, app.compatmx(:,8)))
             compat = true; 
            app.stack = card;
             for i = num:51
                app.hand1(i)=app.hand1(i+1)
                end
                app.hand1(52)=0
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
                    suf = 'c'; 
                case 2
                    suf = 's';
                case 3
                    suf = 'h'; 
                case 4
                    suf = 'd';
            end
            switch cardc
                case 1
                pre = '1';
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
                    pre = '11';
                    case 12
                    pre = '12';
                    case 13
                    pre = '13';
               
            end
            cardname = [suf,pre];
           
               

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
                    suf = 'c'; 
                case 2
                    suf = 's';
                case 3
                    suf = 'h'; 
                case 4
                    suf = 'd';

            end
            switch cardc
                case 1
                pre = '1';
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
                    pre = '11';
                    case 12
                    pre = '12';
                    case 13
                    pre = '13';
            end
            cardname = [suf,pre];
               
            
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
                for i=1:6
app.hand1(i) = app.deck(i);
disp(app.hand1) %for diag
                end
                    
                    %app.hand1 = sort(app.hand1)
                    
                    for i=1:6
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
 %   app.Image1 = image(app.UIAxes,'CData',imread([filepath, hand1(i)));
  


        end

        % Callback function
        function ButtonaPushed(app, event)
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

        % Image clicked function: Image2
        function Button_2Pushed(app, event)
            num = 2; 
              compat(app, num);
        end

        % Image clicked function: Image3
        function Button_3Pushed(app, event)
            num = 3; 
              compat(app, num);
        end

        % Image clicked function: Image4
        function Button_4Pushed(app, event)
            num = 4; 
              compat(app, num);
        end

        % Image clicked function: Image5
        function Button_5Pushed(app, event)
            num = 5; 
              compat(app, num);
        end

        % Image clicked function: Image6
        function Button_6Pushed(app, event)
            num = 6; 
              compat(app, num);
        end

        % Image clicked function: Image7
        function Button_7Pushed(app, event)
            num = 7; 
              compat(app, num);
        end

        % Image clicked function: Image8
        function Button_8Pushed(app, event)
            num = 8; 
              compat(app, num);
        end

        % Image clicked function: Image9
        function Button_9Pushed(app, event)
            num = 9; 
              compat(app, num);
        end

        % Image clicked function: Image10
        function Button_10Pushed(app, event)
            num = 10; 
              compat(app, num);
        end

        % Image clicked function: Image11
        function Button_11Pushed(app, event)
            num = 11; 
              compat(app, num);
        end

        % Image clicked function: Image12
        function Button_12Pushed(app, event)
            num = 12; 
              compat(app, num);
        end

        % Image clicked function: Image13
        function Button_13Pushed(app, event)
            num = 13; 
              compat(app, num);
        end

        % Image clicked function: Image14
        function Button_14Pushed(app, event)
            num = 14; 
              compat(app, num);
        end

        % Image clicked function: Image15
        function Button_15Pushed(app, event)
            num = 15; 
              compat(app, num);
        end

        % Image clicked function: Image16
        function Button_16Pushed(app, event)
            num = 16; 
              compat(app, num);
        end

        % Image clicked function: Image17
        function Button_17Pushed(app, event)
            num = 17; 
              compat(app, num);
        end

        % Image clicked function: Image18
        function Button_18Pushed(app, event)
            num = 18; 
              compat(app, num);
        end

        % Image clicked function: Image19
        function Button_19Pushed(app, event)
            num = 19; 
              compat(app, num);
        end

        % Image clicked function: Image20
        function Button_20Pushed(app, event)
            num = 20; 
              compat(app, num);
        end

        % Image clicked function: Image21
        function Button_21Pushed(app, event)
            num = 21; 
              compat(app, num);
        end

        % Callback function
        function Button_22Pushed(app, event)
            num = 22; 
              compat(app, num);
        end

        % Callback function
        function Button_23Pushed(app, event)
            num = 23; 
              compat(app, num);
        end

        % Callback function
        function Button_24Pushed(app, event)
            num = 24; 
              compat(app, num);
        end

        % Callback function
        function Button_25Pushed(app, event)
            num = 25; 
              compat(app, num);
        end

        % Callback function
        function Button_26Pushed(app, event)
            num = 26; 
              compat(app, num);
        end

        % Callback function
        function Button_27Pushed(app, event)
            num = 27; 
              compat(app, num);
        end

        % Callback function
        function Button_28Pushed(app, event)
            num = 28; 
              compat(app, num);
        end

        % Callback function
        function Button_29Pushed(app, event)
            num = 29; 
              compat(app, num);
        end

        % Callback function
        function Button_30Pushed(app, event)
            num = 30; 
              compat(app, num);
        end

        % Callback function
        function Button_31Pushed(app, event)
            num = 31; 
              compat(app, num);
        end

        % Callback function
        function Button_32Pushed(app, event)
            num = 32; 
              compat(app, num);
        end

        % Callback function
        function Button_33Pushed(app, event)
            num = 33; 
              compat(app, num);
        end

        % Callback function
        function Button_34Pushed(app, event)
            num = 34; 
              compat(app, num);
        end

        % Callback function
        function Button_35Pushed(app, event)
            num = 35; 
              compat(app, num);
        end

        % Callback function
        function Button_36Pushed(app, event)
            num = 36; 
              compat(app, num);
        end

        % Callback function
        function Button_37Pushed(app, event)
            num = 37; 
              compat(app, num);
        end

        % Callback function
        function Button_38Pushed(app, event)
            num = 38; 
              compat(app, num);
        end

        % Callback function
        function Button_39Pushed(app, event)
            num = 39; 
              compat(app, num);
        end

        % Callback function
        function Button_40Pushed(app, event)
            num = 40; 
              compat(app, num);
        end

        % Callback function
        function Button_41Pushed(app, event)
            num = 41; 
              compat(app, num);
        end

        % Callback function
        function Button_42Pushed(app, event)
            num = 42; 
              compat(app, num);
        end

        % Callback function
        function Button_43Pushed(app, event)
            num = 43; 
              compat(app, num);
        end

        % Callback function
        function Button_44Pushed(app, event)
            num = 44; 
              compat(app, num);
        end

        % Callback function
        function Button_45Pushed(app, event)
            num = 45; 
              compat(app, num);
        end

        % Callback function
        function Button_46Pushed(app, event)
            num = 46; 
              compat(app, num);
        end

        % Callback function
        function Button_47Pushed(app, event)
            num = 47; 
              compat(app, num);
        end

        % Callback function
        function Button_48Pushed(app, event)
            num = 48; 
              compat(app, num);
        end

        % Callback function
        function Button_49Pushed(app, event)
            num = 49; 
              compat(app, num);
        end

        % Callback function
        function Button_50Pushed(app, event)
            num = 50; 
              compat(app, num);
        end

        % Callback function
        function Button_51Pushed(app, event)
            num = 51; 
              compat(app, num);
        end

        % Callback function
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
            app.UIFigure.Position = [100 100 944 836];
            app.UIFigure.Name = 'MATLAB App';

            % Create StartGameButton
            app.StartGameButton = uibutton(app.UIFigure, 'push');
            app.StartGameButton.ButtonPushedFcn = createCallbackFcn(app, @StartGameButtonPushed, true);
            app.StartGameButton.Position = [16 787 100 23];
            app.StartGameButton.Text = 'Start Game';

            % Create NumberofPlayersEditFieldLabel
            app.NumberofPlayersEditFieldLabel = uilabel(app.UIFigure);
            app.NumberofPlayersEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofPlayersEditFieldLabel.FontWeight = 'bold';
            app.NumberofPlayersEditFieldLabel.Position = [7 759 111 22];
            app.NumberofPlayersEditFieldLabel.Text = 'Number of Players';

            % Create NumberofPlayersEditField
            app.NumberofPlayersEditField = uieditfield(app.UIFigure, 'numeric');
            app.NumberofPlayersEditField.Limits = [0 4];
            app.NumberofPlayersEditField.FontWeight = 'bold';
            app.NumberofPlayersEditField.Position = [190 759 100 22];
            app.NumberofPlayersEditField.Value = 1;

            % Create Spot1Label
            app.Spot1Label = uilabel(app.UIFigure);
            app.Spot1Label.Position = [49 602 41 22];
            app.Spot1Label.Text = 'Spot 1';

            % Create Spot10Label
            app.Spot10Label = uilabel(app.UIFigure);
            app.Spot10Label.Position = [577 602 47 22];
            app.Spot10Label.Text = 'Spot 10';

            % Create DrawButton
            app.DrawButton = uibutton(app.UIFigure, 'push');
            app.DrawButton.ButtonPushedFcn = createCallbackFcn(app, @DrawButtonPushed, true);
            app.DrawButton.Position = [16 725 100 23];
            app.DrawButton.Text = 'Draw';

            % Create CurrentCardLabel
            app.CurrentCardLabel = uilabel(app.UIFigure);
            app.CurrentCardLabel.FontWeight = 'bold';
            app.CurrentCardLabel.Position = [340 725 86 22];
            app.CurrentCardLabel.Text = 'Current Card: ';

            % Create HintsLabel
            app.HintsLabel = uilabel(app.UIFigure);
            app.HintsLabel.FontWeight = 'bold';
            app.HintsLabel.Position = [524 716 38 22];
            app.HintsLabel.Text = 'Hints:';

            % Create Label2
            app.Label2 = uilabel(app.UIFigure);
            app.Label2.HorizontalAlignment = 'center';
            app.Label2.Position = [443 687 198 22];
            app.Label2.Text = 'Label2';

            % Create SuitSelectLabel
            app.SuitSelectLabel = uilabel(app.UIFigure);
            app.SuitSelectLabel.FontWeight = 'bold';
            app.SuitSelectLabel.Position = [37 695 70 22];
            app.SuitSelectLabel.Text = 'Suit Select:';

            % Create ClubButton
            app.ClubButton = uibutton(app.UIFigure, 'push');
            app.ClubButton.ButtonPushedFcn = createCallbackFcn(app, @ClubButtonPushed, true);
            app.ClubButton.Position = [1 665 40 23];
            app.ClubButton.Text = 'Club';

            % Create SpadeButton
            app.SpadeButton = uibutton(app.UIFigure, 'push');
            app.SpadeButton.ButtonPushedFcn = createCallbackFcn(app, @SpadeButtonPushed, true);
            app.SpadeButton.Position = [41 665 50 23];
            app.SpadeButton.Text = 'Spade';

            % Create HeartButton
            app.HeartButton = uibutton(app.UIFigure, 'push');
            app.HeartButton.ButtonPushedFcn = createCallbackFcn(app, @HeartButtonPushed, true);
            app.HeartButton.Position = [90 665 44 23];
            app.HeartButton.Text = 'Heart';

            % Create DiamondButton
            app.DiamondButton = uibutton(app.UIFigure, 'push');
            app.DiamondButton.ButtonPushedFcn = createCallbackFcn(app, @DiamondButtonPushed, true);
            app.DiamondButton.Position = [133 665 63 23];
            app.DiamondButton.Text = 'Diamond';

            % Create CheckWinButton
            app.CheckWinButton = uibutton(app.UIFigure, 'push');
            app.CheckWinButton.ButtonPushedFcn = createCallbackFcn(app, @CheckWinButtonPushed, true);
            app.CheckWinButton.Position = [22 635 100 23];
            app.CheckWinButton.Text = 'Check Win';

            % Create Image1
            app.Image1 = uiimage(app.UIFigure);
            app.Image1.Position = [333 511 100 215];

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.ImageClickedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Image2.Position = [49 322 100 215];

            % Create Image3
            app.Image3 = uiimage(app.UIFigure);
            app.Image3.ImageClickedFcn = createCallbackFcn(app, @Button_3Pushed, true);
            app.Image3.Position = [148 322 100 215];

            % Create Image4
            app.Image4 = uiimage(app.UIFigure);
            app.Image4.ImageClickedFcn = createCallbackFcn(app, @Button_4Pushed, true);
            app.Image4.Position = [247 322 100 215];

            % Create Image5
            app.Image5 = uiimage(app.UIFigure);
            app.Image5.ImageClickedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Image5.Position = [346 322 100 215];

            % Create Image6
            app.Image6 = uiimage(app.UIFigure);
            app.Image6.ImageClickedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Image6.Position = [445 322 100 215];

            % Create Image7
            app.Image7 = uiimage(app.UIFigure);
            app.Image7.ImageClickedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Image7.Position = [544 322 100 215];

            % Create Image8
            app.Image8 = uiimage(app.UIFigure);
            app.Image8.ImageClickedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Image8.Position = [640 322 100 215];

            % Create Image9
            app.Image9 = uiimage(app.UIFigure);
            app.Image9.ImageClickedFcn = createCallbackFcn(app, @Button_9Pushed, true);
            app.Image9.Position = [739 322 100 215];

            % Create Image10
            app.Image10 = uiimage(app.UIFigure);
            app.Image10.ImageClickedFcn = createCallbackFcn(app, @Button_10Pushed, true);
            app.Image10.Position = [99 210 100 215];

            % Create Image11
            app.Image11 = uiimage(app.UIFigure);
            app.Image11.ImageClickedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Image11.Position = [198 210 100 215];

            % Create Image12
            app.Image12 = uiimage(app.UIFigure);
            app.Image12.ImageClickedFcn = createCallbackFcn(app, @Button_12Pushed, true);
            app.Image12.Position = [297 210 100 215];

            % Create Image13
            app.Image13 = uiimage(app.UIFigure);
            app.Image13.ImageClickedFcn = createCallbackFcn(app, @Button_13Pushed, true);
            app.Image13.Position = [396 210 100 215];

            % Create Image14
            app.Image14 = uiimage(app.UIFigure);
            app.Image14.ImageClickedFcn = createCallbackFcn(app, @Button_14Pushed, true);
            app.Image14.Position = [495 210 100 215];

            % Create Image15
            app.Image15 = uiimage(app.UIFigure);
            app.Image15.ImageClickedFcn = createCallbackFcn(app, @Button_15Pushed, true);
            app.Image15.Position = [594 210 100 215];

            % Create Image16
            app.Image16 = uiimage(app.UIFigure);
            app.Image16.ImageClickedFcn = createCallbackFcn(app, @Button_16Pushed, true);
            app.Image16.Position = [693 210 100 215];

            % Create Image17
            app.Image17 = uiimage(app.UIFigure);
            app.Image17.ImageClickedFcn = createCallbackFcn(app, @Button_17Pushed, true);
            app.Image17.Position = [227 88 100 215];

            % Create Image18
            app.Image18 = uiimage(app.UIFigure);
            app.Image18.ImageClickedFcn = createCallbackFcn(app, @Button_18Pushed, true);
            app.Image18.Position = [326 88 100 215];

            % Create Image19
            app.Image19 = uiimage(app.UIFigure);
            app.Image19.ImageClickedFcn = createCallbackFcn(app, @Button_19Pushed, true);
            app.Image19.Position = [425 88 100 215];

            % Create Image20
            app.Image20 = uiimage(app.UIFigure);
            app.Image20.ImageClickedFcn = createCallbackFcn(app, @Button_20Pushed, true);
            app.Image20.Position = [524 88 100 215];

            % Create Image21
            app.Image21 = uiimage(app.UIFigure);
            app.Image21.ImageClickedFcn = createCallbackFcn(app, @Button_21Pushed, true);
            app.Image21.Position = [623 88 100 215];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Crazy8image_latest

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