//
//  main.swift
//  Kakao2022_6
//
//  Created by Park Gyurim on 2022/03/01.
//

import Foundation

                                //  skill : [type, r1, c1, r2, c2, degree] -> (r1,c1) 부터 (r2, c2) 까지 degree 만큼 type == 1 : 파괴, type == 2 : 회복
//func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
//    var boardCopy = board
//
//    for operation in skill {
//        if operation[0] == 1 { // 파괴
//            for i in operation[1]...operation[3] {
//                for j in operation[2]...operation[4] {
//                    boardCopy[i][j] -= operation[5]
//                }
//            }
//        } else { // 회복
//            for i in operation[1]...operation[3] {
//                for j in operation[2]...operation[4] {
//                    boardCopy[i][j] += operation[5]
//                }
//            }
//        }
//    }
//
//    var count = 0
//    for i in 0..<board.count {
//        for j in 0..<board[i].count {
//            if boardCopy[i][j] > 0 { count += 1 }
//        }
//    }
//
//    return count
//}

//  skill : [type, r1, c1, r2, c2, degree] -> (r1,c1) 부터 (r2, c2) 까지 degree 만큼 type == 1 : 파괴, type == 2 : 회복
func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let N = board.count // row
    let M = board[0].count // column
    var operation = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
    var count = 0
    
    for s in skill {
        operation[   s[1]   ][   s[2]   ] += s[0] == 1 ? -s[5] : s[5]
        operation[ s[3] + 1 ][   s[2]   ] += s[0] == 1 ? s[5] : -s[5]
        operation[   s[1]   ][ s[4] + 1 ] += s[0] == 1 ? s[5] : -s[5]
        operation[ s[3] + 1 ][ s[4] + 1 ] += s[0] == 1 ? -s[5] : s[5]
    }

    for i in 0...N {
        var temp = 0
        for j in 0...M {
            temp += operation[i][j]
            operation[i][j] = temp
        }
    }
    
    for j in 0...M {
        var temp = 0
        for i in 0...N {
            temp += operation[i][j]
            operation[i][j] = temp
        }
    }
    for i in 0..<N {
        for j in 0..<M {
            if board[i][j] + operation[i][j] > 0 { count += 1 }
        }
    }
    
    return count
}
//print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
