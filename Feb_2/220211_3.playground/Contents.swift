import Foundation

//배포마다 몇 개의 기능이 배포되는지

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result : [Int] = []
    let remainProgress = progresses.map { 100 - $0 }
    let size = progresses.count
    var remainDay : [Int] = []
    for i in 0..<size {
        var remain = remainProgress[i] / speeds[i]
        if remainProgress[i] % speeds[i] != 0 { remain += 1 }
        remainDay.append(remain)
    }
    var k = remainDay[0]
    var count = 1
    for i in 1..<size {
        if remainDay[i] > k {
            k = remainDay[i]
            result.append(count)
            count = 1
        } else { count += 1 }
    }
    result.append(count)
    
    return result
}


//solution([93, 30, 55], [1, 30, 5])

solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1])
