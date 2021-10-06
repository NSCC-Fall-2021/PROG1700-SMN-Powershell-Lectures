# create a program that asks the user for a decimal number and displays the roman numeral 
# equivalent
# e.g. 1 = I, 2 = II, 3 = III, 4 = IV, 5 = V, 6 = VI, 7 = VII, 8 = VIII, 9 = IX, 10 = X

# ask user for decimal number
$number = Read-Host "Enter a decimal number"

if ($number -eq 1) {
    # if the number is 1, output I
    Write-Host "I"
} elseif ($number -eq 2) {
    # if the number is 2, output II
    Write-Host "II"
} elseif ($number -eq 3) {
    # if the number is 3, output III
    Write-Host "III"
} elseif ($number -eq 4) {
    # if the number is 4, output IV
    Write-Host "IV"
} elseif ($number -eq 5) {
    # if the number is 5, output V
    Write-Host "V"
}
# if the number is 6, output VI
if ($number -eq 6) {
    Write-Host "VI"
}
# if the number is 7, output VII
if ($number -eq 7) {
    Write-Host "VII"
}
# if the number is 8, output VIII
if ($number -eq 8) {
    Write-Host "VIII"
}
# if the number is 9, output IX
if ($number -eq 9) {
    Write-Host "IX"
}
# if the number is 10, output X
if ($number -eq 10) {
    Write-Host "X"
}
