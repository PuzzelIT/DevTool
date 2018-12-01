Get-ChildItem -Recurse -File | Resolve-Path -Relative | Out-File -filepath test.txt

(Get-Content test.txt).replace("\","/") -join "," | Set-Content test.txt
#(Get-Content test.txt) | Set-Content test.txt
$classesArray = Get-Content test.txt

foreach ($cshclass1 in $classesArray) {
	
	$class1 = $cshclass1.split("/")[-1].split(".")[0]
	$pkt1 = $cshclass1.split("/")[-2]
	#echo $cshclass1
	echo $pkt1
	$content = Get-Content $cshclass1.split(",")[0]

	foreach ($cshclass2 in $classesArray) {

		$class2 = $cshclass2.split("/")[-1].split(".")[0]
		$pkt2 = $cshclass2.split("/")[-2]

		if ($content -Match "\b$class2\b") {

			echo "$class1 -> $class2"

		}
	}
}
Remove-Item test.txt