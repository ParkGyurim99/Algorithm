//
//  main.swift
//  220113_3
//
//  Created by Park Gyurim on 2022/01/13.
//

import Foundation

/*
 어떤 과학자가 발표한 논문 n편 중,
 h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.
 
 제한사항
 과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다. 1 <= n <= 1000
 논문별 인용 횟수는 0회 이상 10,000회 이하입니다.

 [3, 0, 6, 1, 5] -> 3
 n == 5, h-Index == 3
*/

func solution(_ citations:[Int]) -> Int {
    let sortedCitation : [Int] = citations.sorted().reversed()
    var minNum = 0
    var endNum = 0
    var minIndex = -1
        
    for index in 0..<sortedCitation.count {
        if index + 1 >= sortedCitation[index] {
            minNum = sortedCitation[index]
            minIndex = index
            break
        }
    }
    if minIndex == 0 { return 0 }
    else if minIndex != -1 { endNum = sortedCitation[minIndex - 1] }
    else { endNum = sortedCitation[sortedCitation.endIndex - 1] }
    
    var result = 0
    for i in minNum...endNum {
        var count = 0
        for e in sortedCitation { if e >= i { count += 1 } }
        if count >= i { result = i }
    }
    
    return result
}

// 6 5 3 1 0
print(solution([3, 0, 6, 1, 5]))

//[9, 7, 6, 2, 1] 3
print(solution([9, 7, 6, 2, 1]))

//[10, 8, 5, 4, 3] 4
print(solution([10, 8, 5, 4, 3]))

//[9, 9, 9, 12] 4
print(solution([9, 8, 9, 12]))

// 0
print(solution([0]))

//[25, 8, 5, 3, 3], answer: 3
print(solution([25, 8, 5, 3, 3]))

//[1, 1, 5, 7, 6], answer: 3
print(solution([1, 1, 5, 7, 6]))
