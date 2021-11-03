
function Get-SecretNumber ($Minimum, $Maximum) {
    # generate a random number $minimum - $maximum
    return Get-Random -Minimum $Minimum -Maximum $Maximum
}
function Start-HighLowGame ($Minimum, $Maximum) {

    $secretNumber = Get-SecretNumber $Minimum $Maximum

    # loop until user guesses correctly or runs out of guesses
    $tries = 0
    do {
        # user takes a guess
        $guess = Read-Host "What number am I thinking of? "
        #Write-Host $guess

        # is guess higher or lower than the secret?
        if ($guess -lt $secretNumber) {
            Write-Host "Higher!"
        } elseif ($guess -gt $secretNumber) {
            Write-Host "Lower!"
        }

        $tries++
        # Write-Host "Try: $tries"

        # if guess is correct, user wins!
    } until ($tries -eq 10 -or $guess -eq $secretNumber)

    return ($guess -eq $secretNumber), $secretNumber
}

# ask the user if they want to play again
do {
    $win, $secret = Start-HighLowGame -Minimum 1 -Maximum 1000
    if ($win) {
        Write-Host "Winner!"
    } else {
        Write-Host "You lost! The number was $secret."
    }

    $again = Read-Host "Would you like to play again? (Y/N) "
} while ( $again -eq 'Y')