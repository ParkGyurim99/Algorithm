//
//  main.swift
//  220507 #4
//
//  Created by Park Gyurim on 2022/05/07.
//

import Foundation

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var path : [Int : [[Int]]] = [:]
    paths.forEach {
        if let _ = path[$0[1]] { path[$0[1]]!.append([$0[0], $0[2]]) }
        else { path[$0[1]] = [[$0[0], $0[2]]] }
        
        if let _ = path[$0[0]] { path[$0[0]]!.append([$0[1], $0[2]]) }
        else { path[$0[0]] = [[$0[1], $0[2]]] }
    }
    
    var minIntensity = Int.max, startGate = 0
    var queue : [Int] = []
    
    func dfs(now : Int, depth : Int, intensity : Int, target : Int, startPoint : Int) {
        if depth > 2 * n { return }
        
        if now == target {
            minIntensity = min(intensity, minIntensity)
            return
        }
        
        path[now]!.forEach {
            if now == target { dfs(now: $0[0], depth: depth + 1, intensity : intensity + $0[1], target: startPoint, startPoint: target) }
            else if $0[0] != now { dfs(now: $0[0], depth: depth + 1, intensity : intensity + $0[1], target: target, startPoint: startPoint) }
        }
    }
    
    summits.forEach { summit in
        gates.forEach { gate in
            dfs(now: gate, depth: 0, intensity: 0, target: summit, startPoint: gate)
        }
    }
    
    return []
}

print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1,3], [5]))
