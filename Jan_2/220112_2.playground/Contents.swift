import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    for place in places {
        result.append(solution2(place))
    }
    
    return result
}

func solution2(_ place : [String]) -> Int {
    //let line = Array(place[0])
    var lines : [[Character]] = []
    for i in place.indices {
        lines[i] = Array(place[i])
    }
    print(lines)
    
    return 1
}

/*
 POOOP
 
 OXXOX
 OPXPX
 OOXOX
 
 POXXP
*/


print(
    solution(
        [
            ["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"],
            ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
            ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"],
            ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
            ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]
        ]
    )
)
