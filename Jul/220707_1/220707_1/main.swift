//
//  main.swift
//  220707_1
//
//  Created by Park Gyurim on 2022/07/07.
//
//
//  바이러스
//  Silver 3
//  https://www.acmicpc.net/problem/2606
//

import Foundation

//var n : Int = Int(readLine()!)!
//var m : Int = Int(readLine()!)!
//var source : [[Int]] = []

//for _ in 0..<m {
//    let temp = readLine()!.components(separatedBy: " ").map{Int($0)!}
//    source.append(temp)
//}

var n = 7
var m = 6
var source = [[1,2], [2,3], [1,5], [5,2], [5,6], [4,7]]

func solution(_ n : Int, _ source : [[Int]]) -> Int {
    var src : [Int : Set<Int>] = [:]
    (1...n).forEach { i in src[i] = Set<Int>() }
    source.forEach { arr in
        src[arr[0]]!.insert(arr[1])
        src[arr[1]]!.insert(arr[0])
    }
    var queue : [Int] = [1]
    var visited : [Bool] = Array<Bool>(repeating: false, count: n)
    visited[0] = true
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        let temp : [Int] = src[cur]!.filter { !visited[$0 - 1] }
        
        temp.forEach { visited[$0 - 1] = true }
        queue.append(contentsOf: temp)
    }

    return visited.filter{ $0 }.count - 1
}

print(solution(n, source), 4)

//    7
//    6
//    1 2
//    2 3
//    1 5
//    5 2
//    5 6
//    4 7
