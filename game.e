class
    GAME

create
    make
    
feature -- Attributes
    players: ARRAY[PLAYER]
        -- Array to hold player instances
    dice: DICE
        -- Represents the dice used in the game
    squares: ARRAY[INTEGER]
        -- Represents the board squares
    rng: RANDOM
        -- Random number generator for dice value
    feature -- Initialization
    make
        -- Create a new game instance
        local
            i: INTEGER
        do
            create rng.set_seed(10)
            create dice.make(rng) -- Initialize the dice
            create players.make_empty -- Assuming 2 players for now
            
            -- Initialize the board squares
            create squares.make_filled(0, 0, 50)
            
            -- Set up players (initialize them with names)
            players.force((create {PLAYER}.make ("Player 1")), 1)
            players.force((create {PLAYER}.make ("Player 2")), 2)
            
            -- Place players on the board (at square 1)
            from
                i := 1
            until
                i > players.count
            loop
                players[i].move(1)
                i := i + 1
            end
        end

    feature -- Game flow
    play_game
        -- Run the game
        local
            round: INTEGER
            player_index: INTEGER
            dice_value: INTEGER
        do
            round := 1
            from
                player_index := 1
            until
                is_game_over
            loop
                -- Display the round
                print ("Round: ")
                print (round.out)
                print ("%N")
                
                -- Iterate through players
                from
                    player_index := 1
                until
                    player_index > players.count
                loop
                    -- Roll the dice for the player
                    dice.roll
                    dice_value := dice.get_face_value
                    print (players[player_index].get_name + " rolled " + dice_value.out + "%N")
                    
                    -- Move the player
                    players[player_index].move (dice_value)
                    
                    -- Process square effects (trap, heal, etc.)
                    process_square_effect (players[player_index])
                    
                    -- Display player information
                    display_player_info (players[player_index])
                    
                    -- Move to the next player
                    player_index := player_index + 1
                end
                round := round + 1
            end
        end

    is_game_over: BOOLEAN
        -- Check if the game is over
        local
            i: INTEGER
            gameEnded: BOOLEAN 
        do
            gameEnded := False
            from
                i := 1
            until
               gameEnded or i > players.count
            loop
                if players[i].get_current_square >= 50 then
                    Result := True -- Game ends if any player reaches beyond square 50
                else
                    i := i + 1
                    Result := False

                end
            
            end
        end

    process_square_effect (player: PLAYER)
        -- Process the effects of the square where the player landed
        local
            current_square: INTEGER
        do
            current_square := player.get_current_square
            if current_square = 10 or current_square = 20 or current_square = 30 or current_square = 40 or current_square = 50 then
                player.take_damage (5) -- Player falls into a trap
            elseif current_square = 5 or current_square = 15 or current_square = 25 or current_square = 35 or current_square = 45 then
                player.heal (5) -- Player heals 5 HP
            end
        end

    display_player_info (player: PLAYER)
        -- Display information about the player
        do
            print (player.get_name + " at square: " + player.get_current_square.out + ", HP: " + player.get_hit_points.out + "%N")
        end

end

