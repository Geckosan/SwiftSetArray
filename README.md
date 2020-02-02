# SwiftSetArray
An ordered array for Swift that conforms to SetAlgebra, Collection, and Sequence.

As the array is always in an ordered state it can be accessed directly with numbered indices guaranting that the first index is always the lowest element and the last index is always the highest.
Two identical sets are guaranteed to have the same elements in every position of the array.

## Performance
There is no real reason to use this over the standard Set as its performance is worst in nearly every usage case (see testing below).

It is only faster than a standard set in situations where multiple reads result in repeated sorting of the elements (it would probably make more sense to just cache the results instead?).

## Usage
Conforms to SetAlgebra so can be used in exactly the same as a Set
```swift
var example SetArray<Int>([1,2,3,7,8,9])
example.insert(5) // [1,2,3,5,7,8,9]
example.remove(2) // [1,3,5,7,8,9]
example.insert(7) // no change
example.remove(4) // no change
example.removeAll() // empty []

let setOne = SetArray<Int>([1,2,3,4,5,6])
let setTwo = SetArray<Int>([4,5,6,7,8,9])

let intersect = setOne.intersection(setTwo) // [4,5,6]
let subtract = setOne.subtracting(setTwo) // [1,2,3]
let difference = setOne.symmetricDifference(setTwo) // [1,2,3,7,8,9]
let union = setOne.union(setTwo) // [1,2,3,4,5,6,7,8,9]
```

## Testing
Tested each core function for 10,000 iterations

Inserting | Set | SetArray | Delta
--- |:---:|:---:| ---:
10 elements | 0.128s | 0.338s | 2.6x slower
30 elements | 0.863s | 2.84s | 3.3x slower
100 elements | 0.518s | 1.56s | 3.0x slower
**Removing** | **Set** | **SetArray** | **Delta**
10 elements | 0.0618s | 0.145s | 2.3x slower
30 elements | 0.158s | 0.428s | 2.7x slower
100 elements | 0.491s | 1.52s | 3.1x slower
**Comparing to another set** | **Set** | **SetArray** | **Delta**
10 elements | 0.0393s | 0.0415s | - same
30 elements | 0.0608s | 0.0616s | - same
100 elements | 0.131s | 0.139s | - same
**Comparing to a sorted array** | **Set** | **SetArray** | **Delta**
10 elements | 0.441s | 0.0412s | 10.7x faster
30 elements | 3.88s | 0.0625s | 62.0x faster
100 elements | 19.6s | 0.141s | 139x faster
**Intersection** | **Set** | **SetArray** | **Delta**
10 elements | 0.0362s | 0.097s | 2.7x slower
30 elements | 0.0937s | 0.251s | 2.7x slower
100 elements | 0.11s | 0.345s | 3.1x slower
**Subtraction** | **Set** | **SetArray** | **Delta**
10 elements | 0.0438s | 0.12s | 2.7x slower
30 elements | 0.1s | 0.283s | 1.6x slower
100 elements | 0.177s | 0.58s | 3.3x slower
**SymmetricDifference** | **Set** | **SetArray** | **Delta**
10 elements | 0.0355s | 0.078s | 2.2x slower
30 elements | 0.0777s | 0.178s | 2.3x slower
100 elements | 0.142s | 0.35s | 2.5x slower
**Union** | **Set** | **SetArray** | **Delta**
10 elements | 0.0323s | 0.0957s | 3.0x slower
30 elements | 0.0519s | 0.217s | 4.2x slower
100 elements | 0.0885s | 0.428s | 4.8x slower
