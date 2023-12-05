note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
    APPLICATION

create
    make

feature {NONE} -- Initialization

    make
            -- Run application.
        do
            -- Add your code here
            create rat_race_game.make
            rat_race_game.play_game
        end
    rat_race_game : GAME

end

