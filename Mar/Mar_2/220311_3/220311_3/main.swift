//
//  main.swift
//  220311_3
//
//  Created by Park Gyurim on 2022/03/11.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var timeToVillage : [Int : Int] = [:]
    for n in 1...N { timeToVillage[n] = 500000 }
    func dfs(roads : ArraySlice<[Int]>, cur : Int, depth : Int) {
        timeToVillage[cur] = depth
        for index in 0..<roads.count {
            if depth + roads[index][2] <= k {
                if roads[index][0] == cur && depth + roads[index][2] <= timeToVillage[roads[index][1]]! {
                    dfs(roads : roads[0..<index] + roads[(index+1)...], cur : roads[index][1], depth : depth + roads[index][2])
                } else if roads[index][1] == cur && depth + roads[index][2] <= timeToVillage[roads[index][0]]! {
                    dfs(roads : roads[0..<index] + roads[(index+1)...], cur : roads[index][0], depth : depth + roads[index][2])
                }
            }
        }
    }
    
    dfs(roads : road[0...].filter{arr in arr[2] <= k}, cur: 1, depth: 0)
    return timeToVillage.values.filter({ $0 <= k}).count
}

print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)) // result : 4
print(solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4)) // result : 4

// 1 <= road <= 2,000
// 1 <= K <= 500,000
// 1 <= Weight <= 10,000
