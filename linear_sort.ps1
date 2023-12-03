Write-Output "Initialising..."
$N = 10_000
$arr = 1..$N
for ($i = 0; $i -lt $N; $i++) {
	$arr[$i] = 0
}

for ($i = 0; $i -lt $N; $i++) {
	do {
		$x = Get-Random -Minimum 1 -Maximum 10_000_000
	} while ($arr.Contains($x))
	$arr[$i] = $x
}

# Write-Output "Shuffling..."
# for ($i = 0; $i -lt 10 * $N; $i++) {
# 	$i_1 = Get-Random -Maximum $N
# 	$i_2 = Get-Random -Maximum $N
# 	$temp_1 = $arr[$i_1]
# 	$arr[$i_1] = $arr[$i_2]
# 	$arr[$i_2] = $temp_1
# }

# Write-Output $arr > "array.txt"

# $arr = Get-Content "array.txt"

$sw = [Diagnostics.Stopwatch]::StartNew()

Write-Output "Linear sorting..."
$max_num = 0
for ($i = 0; $i -lt $N; $i++) {
	$x = $arr[$i]
	if ($x -gt $max_num) {
		$max_num = $x
	}
}

$sorted_arr = 1..$max_num
for ($i = 0; $i -lt $max_num; $i++) {
	$sorted_arr[$i] = 0
}

for ($i = 0; $i -lt $N; $i++) {
	$x = $arr[$i]
	$sorted_arr[$x - 1] = $x
}

$b = 0
$c = 0
for ($i = 0; $i -lt $max_num; $i++) {
	if ($sorted_arr[$c] -gt 0) {
		$sorted_arr[$b] = $sorted_arr[$c]
		$b++
	}
	$c++
}

# Write-Output "Insertion sorting..."
# for ($i = 1; $i -lt $N; $i++) {
# 	$x = $arr[$i]
# 	$j = $i - 1
# 	while ($j -ge 0 -and $arr[$j] -gt $x) {
# 		$arr[$j + 1] = $arr[$j]
# 		$j--
# 	}
# 	$arr[$j + 1] = $x
# }

$sw.Elapsed
$sw.Stop()

Write-Output "Sorted."
# for ($i = 0; $i -lt $N; $i++) {
# 	Write-Output $sorted_arr[$i]
# }