Write-Output "lmao"

Set-Location "..\parallel_test_2"

$a = Get-ChildItem img_saver_txt_file*.txt

for ($i = 0; $i -lt $a.Length; $i++) {
    Rename-Item $a[$i] -NewName ("img_saver_txt_file_" + $i + ".txt")
}

Set-Location "..\power_shell_test_folder"

# .\p_1.py 1
# .\p_1.py 2

# Set-Location "..\power_shell_test_folder"
# $len = 12
# $a = 1..$len
# for ($i = 0; $i -lt $len; $i++) {
#     $a[$i] = 0
# }
# foreach ($i in $a) {
#     Write-Output $i
# }