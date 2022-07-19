<#
- write a function that returns a combination of numbers from an array set that adds up to a target number
- input will be a targetSum to add up to and an array of numbers that can be used as options to reach that targetSum
- output will be the combination of numbers used to add up to the targetSum
- if multiple options exist, only one needs to be returned
- if no options exist, return null
#>

function howSum {
    param (
        [Parameter(Position=1)]
        [int]$TargetSum,
        [Parameter(Position=2)]
        [int[]]$Collection
    )
    # base cases (foreach on each member of collection)
    # if the TargetSum is less than the member of the collection, return null
    # if the TargetSum is equal to the member of the collection, add collection member into an array of results
    # if the TargetSum is greater than the member of the collection, work the logic
        # subtract the collection member from the current TargetSum and use that value as the new input for TargetSum
}