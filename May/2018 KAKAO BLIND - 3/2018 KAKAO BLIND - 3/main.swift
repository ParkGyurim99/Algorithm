//
//  main.swift
//  2018 KAKAO BLIND - 3
//
//  Created by Park Gyurim on 2022/05/06.
//
//  2018 KAKAO BLIND RECRUITMENT : [1차] 프렌즈4블록
//  https://programmers.co.kr/learn/courses/30/lessons/17679
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var count = 0
    var boardCopy = board.map{$0.map{$0}}
    
    func dfs(source : inout [[Character]], row : Int, col : Int, candidate : inout [[Int]]) {
        let now = source[row][col]
        
        if (row + 1 < m && source[row + 1][col] == now) &&
            (row + 1 < m && col + 1 < n && source[row + 1][col + 1] == now) &&
            (col + 1 < n && source[row][col + 1] == now)
        {
            dfs(source: &source, row: row + 1, col: col, candidate : &candidate) // ➡️
            dfs(source: &source, row: row + 1, col: col + 1, candidate : &candidate) // ↘️
            dfs(source: &source, row: row, col: col + 1, candidate : &candidate) // ⬇️
            candidate.append(contentsOf: [[row, col], [row + 1, col], [row, col + 1], [row + 1, col + 1]])
        }
    }
    
    var temp = 0
    repeat {
        temp = 0
        var candidate : [[Int]] = []
        for i in 0..<(m-1) {
            for j in 0..<(n-1) {
                if boardCopy[i][j] != "-" {
                    dfs(source: &boardCopy, row: i, col: j, candidate : &candidate)
                }
            }
        }
        candidate.forEach { boardCopy[$0[0]][$0[1]] = "_" }
        
        var tempArr : [String] = []
        
        for j in 0..<n {
            var tempStr = "", removeCount = 0
            for i in 0..<m {
                if boardCopy[i][j] == "_" { removeCount += 1 }
                else { tempStr += String(boardCopy[i][j]) }
            }
            
            tempArr.append(Array(0..<removeCount).map{ _ in "-" } + tempStr)
            temp += removeCount
        }
        
        for j in 0..<tempArr.count {
            for i in 0..<tempArr[j].count {
                boardCopy[i][j] = tempArr[j].map{$0}[i]
            }
        }
        count += temp
    } while temp != 0
    
    // print
    for i in 0..<m {
        for j in 0..<n {
            print(boardCopy[i][j], terminator: " ")
        }
        print("")
    }
    
    return count
}

//print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
//print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
//print(solution(8, 5, ["HGNHU", "CRSHV", "UKHVL", "MJHQB", "GSHOT", "MQMJJ", "AGJKK", "QULKK"]))
print(solution(3, 8, ["AAAAAAAA", "BBAAAACC", "BBAAAACC"]))
//print(solution(7, 2, ["AA", "BB", "AA", "BB", "ZZ", "ZZ", "CC"]))

/*
 
 정확성  테스트
 
 테스트 1 〉    통과 (0.40ms, 16.3MB)
 테스트 2 〉    통과 (0.47ms, 16.5MB)
 테스트 3 〉    통과 (0.22ms, 16.3MB)
 테스트 4 〉    실패 (시간 초과)
 테스트 5 〉    통과 (1122.74ms, 16.6MB)
 테스트 6 〉    통과 (53.76ms, 16.6MB)
 테스트 7 〉    통과 (14.81ms, 17.4MB)
 테스트 8 〉    실패 (시간 초과)
 테스트 9 〉    통과 (0.35ms, 16.6MB)
 테스트 10 〉   통과 (33.40ms, 17.8MB)
 테스트 11 〉   실패 (시간 초과)
 
*/
