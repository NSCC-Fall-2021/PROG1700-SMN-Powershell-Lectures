
# high low game

# game generates a random number and the user guesses the number
# the user has a limited number of guesses to win

function Get-SecretNumber ($Minimum, $Maximum) {
    # generate a random number $minimum - $maximum
    return Get-Random -Minimum $Minimum -Maximum $Maximum
}
function Start-HighLowGame ($Level) {

    $levels = @(
        @{ Tries = 5; Minimum = 1; Maximum = 10; },
        @{ Tries = 7; Minimum = 1; Maximum = 100; },
        @{ Tries = 10; Minimum = 1; Maximum = 1000; },
        @{ Tries = 15; Minimum = 1; Maximum = 10000; },
        @{ Tries = 20; Minimum = 1; Maximum = 100000; }
    )

    $current = $levels[$Level]

    Write-Host "   Guess a number between $($current.Minimum) and $($current.Maximum)"

    $secretNumber = Get-SecretNumber $current.Minimum $current.Maximum
    #Write-Host "secret = $secretNumber"

    # loop until user guesses correctly or runs out of guesses
    $tries = 0
    do {
        # user takes a guess
        $guess = [int](Read-Host "What number am I thinking of? ")
        #Write-Host $guess

        #Write-Host "correct: $($guess -eq $secretNumber)"

        # is guess higher or lower than the secret?
        if ($guess -lt $secretNumber) {
            Write-Host "Higher!"
        } elseif ($guess -gt $secretNumber) {
            Write-Host "Lower!"
        }

        $tries++
        # Write-Host "Try: $tries"

        # if guess is correct, user wins!
    } until ($tries -eq $current.Tries -or $guess -eq $secretNumber)

    return ($guess -eq $secretNumber), $secretNumber
}

# ask the user if they want to play again
$level = 0
$attempt = 0
do {
    Write-Host "Level: $($level + 1)"
    $win, $secret = Start-HighLowGame -Level $level
    if ($win -and $level -eq 4) {
        Write-Host "Achievement Unlocked!"
        break
    } elseif ($win) {
        Write-Host "Winner!"
        $level++
        $attempt = 0
    } else {
        Write-Host "You lost! The number was $secret."
        $attempt++
        if ($attempt -eq 3) {            
            if ($level -eq 0) {
                Write-Host "This is not your game...."
                break
            }
            $level = 0
            $attempt = 0
        }
    }

    $again = Read-Host "Would you like to play again? (Y/N) "
} while ( $again -eq 'Y')