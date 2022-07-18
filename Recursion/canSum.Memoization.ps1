<#
- write a function that determines whether an array of numbers can be used to read a target sum
- input will be a target sum to reach and an array of numbers with which the sum is reached
- output should be true or false, meaning either the target sum can or cannot be reached using the array members
- members of the array can be used as many times as needed
- all input numbers are positive
#>

<#
Examples:
canSum(7, [3,4]) -> true
canSum(7, [2,4]) -> false
canSum(10, [3,4]) -> true
canSum(10, [4,7]) -> false
canSum(51, [2,2,2,2,2,2,2,2,2,2,2]) -> false
#>

function canSum {
    param (
        [Parameter(Position = 1)]    
        [int]$TargetSum,
        [Parameter(Position = 2)]
        [int[]]$Collection
    )

    foreach ($c in $Collection) {
        if ($TargetSum -eq $c) {return $true}
        if ($TargetSum -gt $c) {
            if ((canSum ($TargetSum - $c) $Collection) -eq $true) {
                return $true
            }
        }
    }
    return $false
}

function canSumMemo {
    param (
        [Parameter(Position = 1)]    
        [int]$TargetSum,
        [Parameter(Position = 2)]
        [int[]]$Collection,
        [Parameter(Position = 3)]
        $memo = @{}
    )
    # define $key
    $key = $TargetSum
    # if key exists in memo, return memo[key]
    if ($memo.ContainsKey($key)) {return $true}

    foreach ($c in $Collection) {
        if ($TargetSum -eq $c) {
            $memo[$key] = $true
            return $true}
        if ($TargetSum -gt $c) {
            if ((canSumMemo ($TargetSum - $c) $Collection $memo) -eq $true) {
                # store this value at memo[key]
                $memo[$key] = $true
                # return memo[key]
                return $true
            }
        }
    }
    return $false
}