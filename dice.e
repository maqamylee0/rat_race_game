class
    DICE
    
create
    make
    
feature  {NONE} -- Initialisation the dice class

    make(rng : RANDOM)
        -- Create a new dice
        do
            random_generator := rng
            roll  -- Roll the dice initially
        end

    feature -- Roll the dice
    roll
        -- Roll the dice to get a random face value between 1 and 6
        do
            face_value := random_face_value
        end

    feature -- Access
    get_face_value: INTEGER
        -- Retrieve the current face value of the dice
        do
            Result := face_value
        end
        
    random_generator: RANDOM
    face_value: INTEGER
    
feature -- Internal
    random_face_value: INTEGER
        -- Generates a random face value between 1 and 6
        do
             random_generator.forth
            Result := (random_generator.item \\ 6) + 1 -- Generate random numbers between 1 and 6
        end
end

