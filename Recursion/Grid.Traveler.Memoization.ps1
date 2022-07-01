<#
Say you are a traveler on a 2D grid.  You begin in the top-left corner and your goal is to travel to the bottom-right corner.
You may only move down or right.

In how many ways can you travel to the goal on a grid with dimensions r * c?
#>

function GridTraveler {
    param (
        [Parameter(Mandatory, Position=0)]    
        [int]$r,
        [Parameter(Mandatory, Position=1)]
        [int]$c
    )
    # base cases
    if ($r -eq 0 -or $c -eq 0) {Write-Output 0}
    if ($r -eq 1 -and $c -eq 1) {Write-Output 1}
    # recursion logic
    $RowMinus = GridTraveler -r ($r - 1) -c $c
    $ColumnMinus = GridTraveler -r $r -c ($c - 1)
    $Output = $RowMinus + $ColumnMinus
    Write-Output $Output
}