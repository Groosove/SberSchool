import UIKit



var arr = [1, 2, 3, 4, 5, 6, 7, 8]

var mapArr = arr.reduce([]) {
	$0 + [$1 * 2]
}

var filtArr = arr.reduce([]) {
	$0 + ($1 > 5 ? [$1] : [])
}

print(mapArr)
print(filtArr)
