//
//  main.swift
//  220507 #5
//
//  Created by Park Gyurim on 2022/05/07.
//

import Foundation

func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
    var arr = rc
    let height = rc.count, width = rc[1].count
    
    func shift() {  arr.insert(arr.removeLast(), at: 0) }
    
    func rotate() {
        let temp = arr[0][0]
        
        for row in 1..<height { arr[row - 1][0] = arr[row][0] } // ⬆️
        for col in 0..<width - 1 { arr[height - 1][col] = arr[height - 1][col + 1] } // ⬅️
        for row in (0..<height - 1).reversed() { arr[row + 1][width - 1] = arr[row][width - 1] } // ⬇️
        for col in (1..<width).reversed() { arr[0][col] = arr[0][col - 1] } // ➡️
        
        arr[0][1] = temp
    }
    
    operations.forEach {
        switch $0 {
            case "Rotate" : rotate()
            default : shift()
        }
    }
    
    return arr
}

        
print(solution([[1, 2, 3], [4, 5, 6], [7, 8, 9]], ["Rotate", "ShiftRow"]), [[8, 9, 6], [4, 1, 2], [7, 5, 3]])

/*
 
 정확성 테스트
 테스트 1 〉 통과 (0.05ms, 16.4MB)
 테스트 2 〉 통과 (2.46ms, 16.4MB)
 테스트 3 〉 통과 (0.10ms, 16.6MB)
 테스트 4 〉 통과 (1.59ms, 16.7MB)
 테스트 5 〉 통과 (13.62ms, 18.8MB)
 테스트 6 〉 통과 (26.62ms, 18.7MB)
 테스트 7 〉 통과 (0.14ms, 18.9MB)
 테스트 8 〉 통과 (83.02ms, 17.9MB)
 테스트 9 〉 통과 (54.24ms, 17.8MB)
 테스트 10 〉 통과 (0.13ms, 17.6MB)
 효율성 테스트
 테스트 1 〉 실패 (시간 초과)
 테스트 2 〉 실패 (시간 초과)
 테스트 3 〉 통과 (51.58ms, 37.2MB)
 테스트 4 〉 실패 (시간 초과)
 테스트 5 〉 통과 (699.10ms, 56.3MB)
 테스트 6 〉 실패 (시간 초과)
 테스트 7 〉 실패 (시간 초과)
 테스트 8 〉 통과 (51.52ms, 37.9MB)
 테스트 9 〉 실패 (시간 초과)
*/
