//
//  main.swift
//  220319_2
//
//  Created by Park Gyurim on 2022/03/19.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    var dic : [Int : [Set<Int>]] = [:]
    for i in 1...n { dic[i] = Array(repeating: [], count: 2) }
    
    for r in results {
        dic[r[0]]![0].insert(r[1])
        dic[r[1]]![1].insert(r[0])
    }
        
    func dfsWinner(depth : Int, start : Int, cur : Int, losers : Set<Int>) {
        if dic[cur]![0].isEmpty || depth > n - 2 {
            dic[start]![0] = losers
            return
        }

        for l in dic[cur]![0] { dfsWinner(depth : depth + 1, start : start, cur: l, losers: losers.union(dic[cur]![0])) }
    }
    
    func dfsLoser(depth : Int, start : Int, cur : Int, winners : Set<Int>) {
        if dic[cur]![1].isEmpty || depth > n - 2 {
            dic[start]![1] = winners
            return
        }

        for w in dic[cur]![1] { dfsLoser(depth : depth + 1, start : start, cur: w, winners: winners.union(dic[cur]![1])) }
    }
    
    for (key, value) in dic {
        dfsWinner(depth : 0, start: key, cur: key, losers: value[0])
        dfsLoser(depth : 0, start: key, cur: key, winners: value[1])
    }

    for (_, value) in dic {
        if value[0].count + value[1].count == (n - 1) { answer += 1 }
    }
    
    dic.keys.sorted().forEach {
        print($0, dic[$0]!)
    }

    return answer
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])) // [a,b] : a win b
//print(solution(8, [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8]]), 8)
//print(solution(5, [[1, 4], [4, 2], [2, 5], [5, 3]]), 5)
//print(solution(4, [[1,2],[2,3],[1,4]]), 1)
//print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]), 2)
//print(solution(7, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5], [5,6], [6,7]]), 4)
//print(solution(6, [[1,2], [2,3], [3,4], [4,5], [5,6]]), 6)
//print(solution(5, [[1, 4], [4, 2], [2, 5], [5, 3]]), 5)
//print(solution(5, [[3, 5], [4, 2], [4, 5], [5, 1], [5, 2]]), 1)
//print(solution(3, [[1,2],[1,3]]), 1)
//print(solution(6, [[1,6],[2,6],[3,6],[4,6]]), 0)
//print(solution(8, [[1,2],[3,4],[5,6],[7,8]]),0)
//print(solution(9, [[1,2],[1,3],[1,4],[1,5],[6,1],[7,1],[8,1],[9,1]]), 1)
//print(solution(4, [[4,3],[4,2],[3,2],[3,1],[4,1], [2,1]]), 4)
//print(solution(3,[[3,2],[3,1]]), 1)
//print(solution(4, [[1,2],[1,3],[3,4]]), 1)
//print(solution(6, [[1,2],[2,3],[3,4],[4,5],[5,6],[2,4],[2,6]]), 6)
//print(solution(5, [[1, 2], [4, 5], [3, 4], [2, 3]]), 5)
