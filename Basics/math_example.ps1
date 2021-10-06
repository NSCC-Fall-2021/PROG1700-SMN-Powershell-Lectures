# Problem: Determine where y=mx+b crosses the y-axis, given m and b.
# Assumption 1: If you need the y-coordinate, assume x=0.
Write-Host "Enter the values needed for y = mx + b"
$m = Read-Host "m"
$b = Read-Host "b"
$y = $m * 0 + $b
Write-Host "y =" $y