//
//  main.swift
//  220426_2
//
//  Created by Park Gyurim on 2022/04/26.
//
//  두 개 뽑아서 더하기
//  https://programmers.co.kr/learn/courses/30/lessons/68644
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = Array<Int>()//Set<Int>()
    
    for i in 0..<numbers.count {
        for n in 0..<numbers.count {
            if i != n {
                //answer.insert(numbers[i] + numbers[n])
                answer.append(numbers[i] + numbers[n])
            }
        }
    }
    return answer.sorted()
}

print(solution([2,1,3,4,1]))
print(solution([5,0,2,7]))
print(solution([100,100]))
