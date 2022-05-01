//
//  main.swift
//  220430_1
//
//  Created by Park Gyurim on 2022/04/30.
//
//  프린터
//  https://programmers.co.kr/learn/courses/30/lessons/42587
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue : [[Int]] = Array(0..<priorities.count).map{[$0, priorities[$0]]}
    var order = 1
    
    while true {
        let temp = queue.removeFirst()
        let hasMax : Bool = queue.map{$0[1]}.max() ?? -1 > temp[1]
        
        if hasMax { queue.append(temp) }
        else {
            if location == temp[0] { break; }
            else { order += 1 }
        }
    }
    
    return order
}

print(solution([2,1,3,2], 2), 1)
print(solution([1,1,9,1,1,1], 0), 5)
print(solution([1], 0))
