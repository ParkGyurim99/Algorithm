//
//  main.swift
//  220225_4
//
//  Created by Park Gyurim on 2022/02/25.
//
 
import Foundation

var distances : [Int : Int] = [ : ]

func dfs(vertex : [[Int]], visited : [Bool], distance : Int, current : Int, target : Int) {
    let candidate : [[Int]] = vertex.filter { arr in arr[0] == current && visited[current - 1] == false }
    
    if current == target {
        if let d = distances[target] {
            //if distance < d { distances[target] = distance }
            distances[target] = distance
        } else { distances[target] = distance }
        
        return
    } else if visited.allSatisfy({ $0 == true }) { return }
    
    if let d = distances[target] { if distance >= d { return } }
    
    for v in candidate {
        var visitedCopy = visited
        visitedCopy[current - 1] = true
        
        dfs(vertex: vertex, visited: visitedCopy, distance: distance + 1, current: v[1], target: target)
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var vertex = edge
    vertex += edge.map { arr in return [arr[1], arr[0]] }
    //vertex.sort { arr1, arr2 in arr1[0] < arr2[0] }
    
    for i in 2...n { dfs(vertex: vertex, visited: Array(repeating: false, count: n), distance: 0, current: 1, target: i) }
    
    var distanceCount : [Int : Int] = [:]
    for (_, value) in distances {
        if let _ = distanceCount[value] { distanceCount[value]! += 1 }
        else { distanceCount[value] = 1 }
    }

    let maxDistance = distanceCount.keys.max()!
    let answer = distanceCount[maxDistance]!
    
    return answer
}


//print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 3)
//print(solution(11, [[1, 2], [1, 3], [2, 4], [2, 5], [3, 5], [3, 6], [4, 8], [4, 9], [5, 9], [5, 10], [6, 10], [6, 11]]), 4)
//print(solution(4, [[1, 2], [2, 3], [3, 4]]), 1)
//print(solution(2, [[1, 2]]), 1)
//print(solution(5, [[4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 2)
//print(solution(4, [[1, 4], [1, 3], [2, 3], [2, 1]]), 3)
//print(solution(4, [[1, 2], [1, 3], [2, 3], [2, 4], [3, 4]]), 1)
//print(solution(4, [[3, 4], [1, 3], [2, 3], [2, 1]]), 1)
print(solution(4,  [[4, 3], [1, 3], [2, 3]]), 2)
