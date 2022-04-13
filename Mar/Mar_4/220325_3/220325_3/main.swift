//
//  main.swift
//  220325_3
//
//  Created by Park Gyurim on 2022/03/25.
//

import Foundation

func fibonacci(n : Int) -> Int {
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}

func solution(_ n:Int) -> Int {
    var fiboArray : [Int] = [0, 1]
    for index in 2...n {
        fiboArray.append(fiboArray[index - 2] + fiboArray[index - 1])
    }
    
    return fiboArray[n]
}

print(solution(5))
//print(fibonacci(n: 5))

// 재귀 호출 깊이를 초과한 경우 발생
