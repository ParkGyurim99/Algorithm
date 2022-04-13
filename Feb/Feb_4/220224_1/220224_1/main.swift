//
//  main.swift
//  220224_1
//
//  Created by Park Gyurim on 2022/02/24.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result : [Int] = [numbers[0], numbers[0] * -1]
    var buffer : [Int] = []
    
    for n in 1..<numbers.count {
        for i in 0..<result.count {
            buffer.append(result[i] + numbers[n])
            buffer.append(result[i] - numbers[n])
        }
        result = buffer
        buffer.removeAll()
    }

    return result.filter { $0 == target }.count
}

print(solution([1,1,1,1,1], 3))
print(solution([4, 1, 2, 1], 4))
