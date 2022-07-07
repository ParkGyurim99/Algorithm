//
//  main.swift
//  220707_2
//
//  Created by Park Gyurim on 2022/07/07.
//
//  플로이드
//  Gold 4
//  https://www.acmicpc.net/problem/11404
//

import Foundation

var n : Int = Int(readLine()!)!
var m : Int = Int(readLine()!)!
var source : [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 10000000, count: n), count: n)
(0..<n).forEach { source[$0][$0] = 0 }
for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    source[input[0] - 1][input[1] - 1] = min(input[2], source[input[0] - 1][input[1] - 1])
}

// Floyd-Warshall
for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            source[j][k] = min(source[j][i] + source[i][k], source[j][k])
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if source[i][j] >= 10000000 { source[i][j] = 0 }
    }
}
source.forEach { arr in
    arr.forEach {
        print($0, terminator: " ")
    }
    print("")
}
