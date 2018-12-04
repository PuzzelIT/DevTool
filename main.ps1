param(
  [int] $granularity = 5
)

# Returns true if at least one sequence of $granularity letters matches any part of the target.
function isSimilar {
  param (
    $content,
    $target,
    $granularity
  )

  foreach ($word in $content) {
    if ($word.Length -ge $granularity) {
      $iterations = $($($word.Length) - $($granularity))
      for ($i = 0; $i -le $iterations; $i++) {
        $sequence = $word.Substring($i, $granularity)

        if ($sequence -Match '[a-zA-Z0-9]{' + $granularity + '}') {
          if ($target -Match $($sequence)) {
            return $TRUE
          }
        }
      }
    }
  }
}



Get-ChildItem -Recurse -File | Resolve-Path -Relative | Out-File -filepath swevoDevToolTemp.txt

(Get-Content swevoDevToolTemp.txt).replace("\","/") -join "," | Set-Content swevoDevToolTemp.txt
#(Get-Content swevoDevToolTemp.txt) | Set-Content swevoDevToolTemp.txt
$classesArray = (Get-Content swevoDevToolTemp.txt).split(",")
$result = "digraph G {`n"

foreach ($cshclass1 in $classesArray) {
	
	$class1 = $cshclass1.split("/")[-1].split(".")[0]
	$pkt1 = $cshclass1.split("/")[-2]
	$content = Get-Content $cshclass1.split(",")[0]

	foreach ($cshclass2 in $classesArray) {

		$class2 = $cshclass2.split("/")[-1].split(".")[0]
		$pkt2 = $cshclass2.split("/")[-2]

		if (isSimilar -Content $content -Target $class2 -Granularity $granularity) {
                  $result += "  $class1 -> $class2`n"
		}
	}
}
$result += "}"
echo $result

Remove-Item swevoDevToolTemp.txt