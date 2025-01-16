-- Function to display the game opening message
function display_game_opening()
    print("----------------------------------------\n| Welcome to the Guess the Number Game. |\n----------------------------------------\n")
end

-- Function to display the game manual if the user desires
function display_manual()
    print("-> Do you want to read the game manual? (yes or no)")
    local response = io.read()
    if response == "yes" then
        print([[
            This is a guessing game where the computer will
            choose a random number, and the player will need
            to guess it through trial and error.
        ]])
    end
end

-- Function to generate a random number
function generate_random_number()
    -- Use os.time() as the default seed for the math.randomseed function
    math.randomseed(os.time())
    return math.random(1, 100)
end

-- Function to capture the player's guess
function capture_guess()
    while true do
        print("\n-> Enter a guess: ")
        local guess = tonumber(io.read("*line"))
        if guess and guess >= 1 and guess <= 100 then
            return guess
        else
            print("-> Please enter a valid number between 1 and 100.")
        end
    end
end

-- Function to compare the player's guess with the computer's number
function compare_with_guess(computer_number, guess)
    if computer_number == guess then
        return true
    else
        local variation = (computer_number < guess) and "greater" or "less"
        print("\n-> That's not the number I was thinking of :(")
        print("-> The number you guessed is " .. variation .. " than the number I was thinking of\n")
        return false
    end
end

-- Function to print interactions with the player
function print_interaction(number, guess_result)
    if guess_result then
        print("-> Congratulations, I was indeed thinking of the number " .. number)
    else
        print("-> How about trying again?\nEnter your guess:")
    end
    return not guess_result
end

-- Function representing a game round
function execute_round(secret_number)
    local guess = capture_guess()
    return print_interaction(secret_number, compare_with_guess(secret_number, guess))
end

-- Main function controlling the game loop
function execute_main_loop()
    local secret_number = generate_random_number()
    local continue_playing = true
    while continue_playing do
        continue_playing = execute_round(secret_number)
    end
end

-- Function representing the complete game, including the option to play again
function execute_game()
    local play_again = true
    repeat
        execute_main_loop()
        print("-> Do you want to play again? (y or n)\n")
        local response = io.read()
        if response == "n" then
            play_again = false
        end
    until not play_again
end

-- Execute the game opening, whether manually or not, and start the game
display_game_opening()
-- display_manual()
execute_game()
