//
//  main.swift
//  220226_4
//
//  Created by Park Gyurim on 2022/02/26.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var vertex = edge + edge.map { arr in return [arr[1], arr[0]] }
    vertex.sort { arr1, arr2 in arr1[0] < arr2[0] }
    
    var adjacentNode = Dictionary<Int,[Int]>()
    vertex.forEach { arr in
        if let _ = adjacentNode[arr[0]] { adjacentNode[arr[0]]!.append(arr[1]) }
        else { adjacentNode[arr[0]] = [arr[1]] }
    }
    //print(adjacentNode)
    
    // init
    var nodeQueue = [1]
    var queueBuffer = nodeQueue
    var visited : [Bool] = Array(repeating: false, count: n)
    visited[0] = true
    
    while !nodeQueue.isEmpty {
        queueBuffer = nodeQueue
        
        for _ in 0..<nodeQueue.count {
            let node = nodeQueue.removeFirst()
            //print("\nPopped Node : ", node)
            
            for n in adjacentNode[node]! {
                if visited[n - 1] == false {
                    //print("Append and Toggle \(n - 1)")
                    nodeQueue.append(n)
                    visited[n - 1] = true
                }
            }
        }
    }
    
    return queueBuffer.count
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
