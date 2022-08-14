<#
    - given a target sum and a set of numbers in an array, find the smallest set of elements in the array that add up to the target sum
    - input will consist of a target sum and a collection of numbers to choose from for the addition
    - output will be the smallest set of elements from the input collection to reach the target sum
    - elements in the array can be used more than once
    - a tie between sizes of array results can return either option
    - if no result is possible, return null
#>

# must create logic upon each recursive call to see if an array of comparing length already exists
# if an existing array with a greater length exists, the new array set replaces the existing array set
# if an existing array with a lesser length exists, the new array set is dropped
# if an existing array with an equal length exists, the new array set is dropped

# error existed in child call where the key for adding to hash table already existed
<#
MethodInvocationException: C:\git\ComputerScience\Recursion\bestSum.Memoization.ps1:35:17      
Line |
  35 |                  $Result.Add("$TargetSum", "$c")
     |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | Exception calling "Add" with "2" argument(s): "Item has already been added.
     | Key in dictionary: '7'  Key being added: '7'"
#>
function bestSum {
    param (
        [Parameter(Position = 1)]
        [int]$TargetSum,
        [Parameter(Position = 2)]
        [int[]]$Collection,
        [Parameter(Position = 3)]
        $ShortestCombo
    )

    if ($TargetSum -lt 0) { return $null }
    if ($TargetSum -eq 0) { return @{} }
    if ($TargetSum -gt 0) {
        foreach ($c in $Collection) {
            $Difference = $TargetSum - $c
            $Result = bestSum $Difference $Collection $ShortestCombo
            # possible to generate remainder
            if ($Result) {
                # building array for targetsum
                $Result.Add("$TargetSum", "$c")
                # if combo is shorter than current shortest, update it
                # must also handle initial $ShortestCombo.count being 0
                if ($null -eq $ShortestCombo -or 
                    $Result.count -lt $ShortestCombo.count) {
                    $ShortestCombo += $Result
                }
            }
        }
    }
    return $ShortestCombo
}