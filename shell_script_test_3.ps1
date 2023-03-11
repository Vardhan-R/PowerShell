$rating = 0
$download_dump_path_1 = "C:\Users\CSC\Downloads\download_dump\img_0"
$download_dump_path_2 = "C:\Users\CSC\Downloads\download_dump\img_"
$destination_path = "C:\Users\CSC\Desktop\CS\fast_download\category_" + $rating + "\category_" + $rating + "_img_"
$cnt_file = "C:\Users\CSC\Desktop\CS\fast_download\category_" + $rating + "\category_" + $rating + "_count.txt"
$offset = (Get-Content -Path $cnt_file) - 1

# Rename-Item -Path ($path + ".jpg") -NewName ("category_0_img_0.jpg")
# Write-Output 1

for ($i = 1; $i -lt 10; $i++) {
    Move-Item -Path ($download_dump_path_1 + $i + ".jpg") -Destination ($destination_path + ($i + $offset) + ".jpg")
    # Rename-Item -Path ($path + "(" + $i + ").jpg") -NewName ("category_0_img_" + $i + ".jpg")
    Write-Output $i
}

for ($i = 10; $i -lt 41; $i++) {
    Move-Item -Path ($download_dump_path_2 + $i + ".jpg") -Destination ($destination_path + ($i + $offset) + ".jpg")
    Write-Output $i
}

Write-Output ($offset + 41) > $cnt_file

# Remove-Item ($path + "README.txt")