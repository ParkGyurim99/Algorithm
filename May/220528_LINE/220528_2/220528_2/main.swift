//
//  main.swift
//  220528_2
//
//  Created by Park Gyurim on 2022/05/28.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var cost = Int.max
    
    func slicing(curPiece : Int, curCost : Int) {
        
        let boundary = min(curPiece, times.count)
        
        for i in 1...boundary {
            if curPiece + i == n {
                cost = min(cost, curCost + times[i-1])
                return
            } else if curPiece + i < n {
                slicing(curPiece: curPiece + i, curCost: curCost + times[i-1])
            }
        }
    }
    slicing(curPiece: 1, curCost: 0)

    return cost
}

//print(solution(4, [2,3]), 5)
//print(solution(5, [2,4,5]), 8)
//print(solution(6, [1,2,3]), 5)
print(solution(9, [2,3,4,5]))
print(solution(9,[2,3,6,7]))
print(solution(7,[2,3,6]))
