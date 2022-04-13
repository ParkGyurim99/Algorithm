//
//  main.swift
//  220305_3
//
//  Created by Park Gyurim on 2022/03/05.
//

import Foundation

func bfs(vertex : [[Int]], current : Int) -> Int {
    var count = 0
    var queue : [Int] = [current]
    var visited : [Int : Bool] = [current : true]
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let temp = queue.removeFirst()
            visited[temp] = true
            count += 1
            
            for v in vertex.filter({ arr in arr[0] == temp || arr[1] == temp }) {
                if v[0] == temp { if visited[v[1]] == nil { queue.append(v[1]) } }
                else { if visited[v[0]] == nil { queue.append(v[0]) } }
            }
        }
    }
    
    return count
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var vertex = wires
    var temp : [Int] = []
    var minDiff = 100
    
    for i in 0..<wires.count {
        vertex = wires
        temp = vertex.remove(at: i)
        let a = bfs(vertex: vertex, current: temp[0])
        let b = bfs(vertex: vertex, current: temp[1])
        
        let diff = abs(a - b)
        if diff == 0 { return 0 }
        else if diff < minDiff { minDiff = diff }
    }
    
    return minDiff
}

print(solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])) // 3
print(solution(4, [[1,2],[2,3],[3,4]])) // 0
print(solution(7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]])) // 1
