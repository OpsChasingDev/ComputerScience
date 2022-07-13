const GridTraveler = (r, c) => {
    if (r === 1 && c === 1) return 1;
    if (r === 0 || c === 0) return 0;
    return GridTraveler(r - 1, c) + GridTraveler(r, c - 1)
}
console.log(GridTraveler(3,3))