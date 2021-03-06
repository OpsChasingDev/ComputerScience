<#
- write a function that returns a combination of numbers from an array set that adds up to a target number
- input will be a targetSum to add up to and an array of numbers that can be used as options to reach that targetSum
- output will be the combination of numbers used to add up to the targetSum
- if multiple options exist, only one needs to be returned
- if no options exist, return null
#>

<#
Examples:

howSum 7 3,4 => [3,4]
howSum 7 2,3 => [2,2,3]
howSum 7 5,4 => null
#>


function howSum {
    param (
        [Parameter(Position = 1)]
        [int]$TargetSum,
        [Parameter(Position = 2)]
        [int[]]$Collection
    )

    if ($TargetSum -lt 0) { return $null }
    if ($TargetSum -eq 0) { return @{} }

    foreach ($c in $Collection) {
        $Result = howSum ($TargetSum - $c) $Collection
        if ($Result) {
            $Result.Add("$TargetSum", "$c")
            return $Result
        }
    }
    return $null
}
function howSumMemo {
    param (
        [Parameter(Position = 1)]
        [int]$TargetSum,
        [Parameter(Position = 2)]
        [int[]]$Collection,
        [Parameter(Position = 3)]
        $Memo = @{}
    )

    if ($Memo.ContainsKey("$TargetSum")) { return $Memo["$TargetSum"]}
    if ($TargetSum -lt 0) { return $null }
    if ($TargetSum -eq 0) { return @{} }

    foreach ($c in $Collection) {
        $Remainder = $TargetSum - $c
        $Result = howSumMemo $Remainder $Collection $Memo
        if ($Result) {
            $Result.Add("$TargetSum", "$c")
            return $Result
        }
    }
    $Memo["$TargetSum"] = $null
    return $Memo["$TargetSum"]
}