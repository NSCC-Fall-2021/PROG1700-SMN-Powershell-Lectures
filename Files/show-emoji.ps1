
param (
    $Name,
    $Repeat
)

#Write-Host "args: $Name"

$emojis = @{
    'happyface' = "`u{1F601}";
    'santa' = "`u{1F385}";
    'alien' = "`u{1F47E}";
    'tree' = "`u{1F384}";
    'poop' = "`u{1F4A9}";
}

Write-Host (($emojis[$Name]) * $Repeat)