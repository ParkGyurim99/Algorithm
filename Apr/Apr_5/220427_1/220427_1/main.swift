//
//  main.swift
//  220427_1
//
//  Created by Park Gyurim on 2022/04/27.
//
//  https://programmers.co.kr/learn/courses/30/lessons/86491
//  최소 직사각형

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // 가로값와 세로값를 신경 쓸 필요 없음
    // 작은 값을 0번 인덱스, 큰 값을 1번 인덱스에 넣으면 됐음
    
    let sources = sizes.map { arr -> [Int] in
        if arr[0] < arr[1] { return [arr[0], arr[1]] }
        else { return [arr[1], arr[0]] }
    }
    
    var width = 0, height = 0
    for source in sources {
        if source[0] > width { width = source[0] }
        if source[1] > height { height = source[1] }
    }
    return width * height
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
