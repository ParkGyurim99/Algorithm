import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result : [Int] = []

    for arr in commands {
        let startIndex = arr[0] - 1
        let endIndex = arr[1] - 1
        var tempArr = array[startIndex...endIndex].sorted()
        print(tempArr)

        result.append(tempArr[arr[2] - 1])
    }

    return result
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))

//let str = "155, 155"
//let str2 = "152.132141, 223.1332"
//let str3 = "152.132141,223.1332"
//let coordinate = str2.components(separatedBy: [","," "])
//print(coordinate)
