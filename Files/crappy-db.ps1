
# initialize the database
function Initialize-Database {
    if (-not (Test-Path 'data')) {
        New-Item -Path 'data' -ItemType Directory
    }
    Set-Location 'data'
}

# insert records into the database
function Add-Data {

    $records = @(
        @('w1111111','john','doe'),
        @('w2222222','jane','smith'),
        @('w3333333','jack','sprat')
    )

    Set-Content -Path "crappy_db.txt" -Value "" -NoNewline
    foreach ($line in $records) {
        # convert array to csv record
        $record = "$($line[0]),$($line[1]),$($line[2])"
        # write record to file
        Add-Content -Path "crappy_db.txt" -Value $record
    }

}
function Add-Data2 {

    $records = @(
        @('w1111111','john','doe'),
        @('w2222222','jane','smith'),
        @('w3333333','jack','sprat')
    )

    $file = [System.IO.StreamWriter]::new("crappy_db.txt")
    foreach ($line in $records) {
        # convert array to csv record
        $record = "$($line[0]),$($line[1]),$($line[2])"
        # write record to file
        $file.WriteLine($record)
    }
    $file.Close()
}

# select a particular record from the database
function Select-Data {

    $contents = Get-Content -Path "crappy_db.txt"

    foreach ($line in $contents) {
        
        $studentID, $firstName, $lastName = $line.Split(',')

        if ($studentID -eq 'w2222222') {
            Write-Host $line
        }
    }
}
function Select-Data2 {

    $file = [System.IO.StreamReader]::new("crappy_db.txt")

    while ($line = $file.ReadLine()) {
        
        $studentID, $firstName, $lastName = $line.Split(',')

        if ($studentID -eq 'w2222222') {
            Write-Host $line
        }
    }
    $file.Close()
}

# update a record with new data
function Update-Data {

    $contents = Get-Content -Path "crappy_db.txt"

    foreach ($line in $contents) {
        
        $studentID, $firstName, $lastName = $line.Split(',')

        if ($studentID -eq 'w2222222') {
            $firstName = "Bob"
        }

        Add-Content -Path "updated_db.txt" -Value "$studentID,$firstName,$LastName"
    }

    Move-Item "updated_db.txt" "crappy_db.txt" -Force
}

# delete a record from the database
function Remove-Data {

    $contents = Get-Content -Path "crappy_db.txt"

    foreach ($line in $contents) {
        
        $studentID, $firstName, $lastName = $line.Split(',')

        if ($studentID -ne 'w1111111') {
            Add-Content -Path "updated_db.txt" -Value "$studentID,$firstName,$LastName"
        }
    }

    Move-Item "updated_db.txt" "crappy_db.txt" -Force
}

Initialize-Database
Add-Data
Select-Data2
Update-Data
Remove-Data