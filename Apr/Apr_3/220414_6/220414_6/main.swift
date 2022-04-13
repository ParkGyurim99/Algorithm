//
//  main.swift
//  220414_6
//
//  Created by Park Gyurim on 2022/04/14.
//
//  직사각형 별 찍기
//  https://programmers.co.kr/learn/courses/30/lessons/12969
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0..<b {
    for _ in 0..<a { print("*", terminator: "") }
    print("")
}
