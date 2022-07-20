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


# current problem is any value being checked in $Collection that meets the first condition and returns $null does not continue through the foreach loop to the next value
function howSum {
    param (
        [Parameter(Position = 1)]
        [int]$TargetSum,
        [Parameter(Position = 2)]
        [int[]]$Collection
    )

    # new base cases
    if ($TargetSum -lt 0) { return $null }
    if ($TargetSum -eq 0) { return @{} }
}