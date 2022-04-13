import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCount = 0, match = 0
    var maxRank : Int {
        if match == 0 && zeroCount == 0 { return 6 }
        return 7 - match - zeroCount
    }
    var minRank : Int {
        if match < 2 { return 6}
        return 7 - match
    }
    
    for n in lottos {
        if n == 0 { zeroCount += 1 }
        else if win_nums.contains(n) { match += 1 }
    }
    
    return [maxRank, minRank]
}

// test case
let result = solution([1,2,3,4,5,6], [7,8,9,10,11,12])
print(result)
