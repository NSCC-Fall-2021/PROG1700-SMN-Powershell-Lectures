# program to mix two primary colours and output the resulting colour

# ask the user to input two colours
$colour1 = Read-Host "Enter in first colour"
$colour2 = Read-Host "Enter in second colour"

# if the user enters red and blue, output violet
if (($colour1 -eq "red") -and ($colour2 -eq "blue")) {
    Write-Host "violet"
}

# if the user enters red and yellow, output orange
if (($colour1 -eq "red") -and ($colour2 -eq "yellow")) {
    Write-Host "orange"
}

# if the user enters blue and yellow, output green
if (($colour1 -eq "blue") -and ($colour2 -eq "yellow")) {
    Write-Host "green"
}