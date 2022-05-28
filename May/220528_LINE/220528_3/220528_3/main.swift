//
//  main.swift
//  220528_3
//
//  Created by Park Gyurim on 2022/05/28.
//

import Foundation

func nHr(_ arr: [Int], _ round : Int, _ r: Int, _ res: inout [[Int]], _ now: [Int] = [Int]()) {
    let n = arr.count
    guard n > 0 else { return }
    
    if round == r { return }
    
    for i in 0..<n {
        var temp = arr
        temp[i] += 1
        res.append(temp)
        nHr(temp, round + 1, r, &res)
    }
}

func solution(_ fuel:Int, _ powers:[Int], _ distances:[Int]) -> Int {
    var minTime = Int.max
    var combinations : [[Int]] = []
    
    nHr(Array(repeating: 1, count: powers.count), 0, fuel-powers.count, &combinations)
    
    combinations = Array(Set(combinations).filter({ $0.reduce(0,+) == fuel}))
    
    for i in 0..<combinations.count {
        let times = combinations[i].indices.map { Float(combinations[i][$0]) + Float(distances[$0]/(powers[$0] * combinations[i][$0])) - Float(combinations[i][$0] / 2) }
        
        minTime = min(minTime, Int(times.max()!))
    }
    return minTime
}

print(solution(8, [20, 30], [750, 675]))
//print(solution(19, [40,30,20.10], [1000,2000,3000,4000]))
//print(solution(100, [100,150], [1,1000000]))
//print(solution(5, [1,2,3,4,5], [50,40,30,20,10]))
