$file = Read-Host -Prompt "Enter the txt file name:"
$nameOfUser = Read-Host -Prompt "Paste or enter the first character's name:"
$personName = Read-Host -Prompt "Paste or enter the second character's name:"
$input_path = $PSScriptRoot + "\" + $file + '.txt'
$output_file = $PSScriptRoot + "\" + $file + "_" + $personName +  '_parsedLog2.txt'
$regex = '(^\[[^\]]+\] \W?(' + $personName + ').+)|(^\[[^\]]+\] \W?(' + $nameOfUser + ').+)'
select-string -Path $input_path -Pattern $regex -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value } > $output_file
