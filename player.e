class
    PLAYER

create
    make
    
    feature -- Initialization
    make(a_name: STRING)
        -- Create a new player with a given name and initial hit points
        do
            name := a_name
            hit_points := 15 -- Start with 15 hit points
            current_square := 1 -- Start from square 1
        end

    feature -- Player actions
    move (squares: INTEGER)
        -- Move the player forward a given number of squares
        do
            current_square := current_square + squares
        end

    take_damage (damage: INTEGER)
        -- Reduce the player's hit points by a given amount
        do
            hit_points := hit_points - damage
        end

    heal (healing: INTEGER)
        -- Increase the player's hit points by a given amount
        do
            hit_points := hit_points + healing
        end

    is_alive: BOOLEAN
        -- Check if the player is still in the game (hit points above 0)
        do
            Result := hit_points > 0
        end
-- feature -- Attributes

feature -- Access
    name: STRING
        -- Represents the name of the player
    hit_points: INTEGER
        -- Represents the current hit points of the player
    current_square: INTEGER
        -- Represents the current square on the board where the player is positioned

    get_name: STRING
        -- Retrieve the name of the player
        do
            Result := name
        end

    get_hit_points: INTEGER
        -- Retrieve the current hit points of the player
        do
            Result := hit_points
        end

    get_current_square: INTEGER
        -- Retrieve the current square of the player
        do
            Result := current_square
        end
end

