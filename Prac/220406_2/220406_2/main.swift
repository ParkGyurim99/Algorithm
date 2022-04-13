//
//  main.swift
//  220406_2
//
//  Created by Park Gyurim on 2022/04/06.
//
//  https://programmers.co.kr/learn/courses/30/lessons/12913
//

import Foundation

func getMaxAndIndex(arr : [Int]) -> [Int] { // [Max Value, Max Value's Index]
    var max = 0, maxIndex = 0
    
    for i in 0..<arr.count {
        if arr[i] > max {
            max = arr[i]
            maxIndex = i
        }
    }
    
    return [max, maxIndex]
}

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    let height = land.count
    var previousIndex = 0
    
    for startIndex in 0..<4 { // 시작점
        var answerBuffer = land[0][startIndex]
        previousIndex = startIndex
        for level in 1..<height {
            let max = getMaxAndIndex(arr: Array(land[level][0..<previousIndex] + land[level][(previousIndex + 1)..<4]))
            previousIndex = max[1]
            answerBuffer += max[0]
        }
        if answerBuffer > answer { answer = answerBuffer }
    }
    
    return answer
}

//print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
print(
    solution(
        [
            [4, 3, 2, 1],
            [2, 2, 2, 1],
            [6, 6, 6, 4],
            [8, 7, 6, 5]
        ]
    )
) //20
