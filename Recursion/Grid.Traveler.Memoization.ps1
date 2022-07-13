<#
Say you are a traveler on a 2D grid.  You begin in the top-left corner and your goal is to travel to the bottom-right corner.
You may only move down or right.

In how many ways can you travel to the goal on a grid with dimensions r * c?
#>

# example with NO memoization
function GridTraveler {
    param (
        [Parameter(Position=1)]    
        $r,
        [Parameter(Position=2)]
        $c
    )
    if ($r -eq 0 -or $c -eq 0) {return 0}
    if ($r -eq 1 -and $c -eq 1) {return 1}
    return (GridTraveler $r ($c - 1)) + (GridTraveler ($r - 1) $c)
}