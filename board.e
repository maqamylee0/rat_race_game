class
    BOARD

create
    make
    
feature -- Attributes
    squares: ARRAY [SQUARE]
            -- Representing the squares on the board

feature -- Initialization the board 
    initialize_board
            -- Create and initialize the board with 50 squares
        local
            i: INTEGER
        do
            create squares.make_filled (50)
            from
                i := 1
            until
                i > squares.count
            loop
                squares[i] := create {SQUARE}.make(i)
                i := i + 1
            end
    end
end

