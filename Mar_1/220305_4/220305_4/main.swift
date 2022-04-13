//
//  main.swift
//  220305_4
//
//  Created by Park Gyurim on 2022/03/05.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var vertex : [[Int]] = []
    for i in 0..<n {
        for j in 0..<n {
            if computers[i][j] == 1 && i != j { vertex.append([i, j]) }
         }
    }
    
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(n : Int) {
        if visited[n] == true { return } else { visited[n] = true }
        
        for next in vertex.filter({ arr in arr[0] == n }) {
            dfs(n: next[1])
        }
    }
    
    while(true) {
        if visited.allSatisfy({ $0 == true }) { break }
        
        guard let index = visited.firstIndex(of: false) else { break }
        dfs(n: index)
        count += 1
    }
    
    return count
}

//solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]) // 2
solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]) // 1
