//
//  main.swift
//  2018 KAKAO BLIND - 4
//
//  Created by Park Gyurim on 2022/05/07.
//
//  2018 KAKAO BLIND RECRUITMENT : [1차] 비밀지도
//  https://programmers.co.kr/learn/courses/30/lessons/17681
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        var buffer = Array(repeating: " ", count : n).map{ String($0) }
        let src1 = String(arr1[i], radix : 2).reversed().map{ String($0 )}
        let src2 = String(arr2[i], radix : 2).reversed().map{ String($0 )}
        
        var char = " "
        for j in 0..<n {
            char = " "
            if j < src1.count && src1[j] == "1" { char = "#" }
            if j < src2.count && src2[j] == "1" { char = "#" }
            buffer[j] = char
        }
        answer.append(buffer.reversed().joined())
    }
    
    return answer
}

print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))//.forEach{print($0)})

/*
 정확성  테스트
 
 테스트 1 〉    통과 (0.20ms, 16.4MB)
 테스트 2 〉    통과 (0.44ms, 16.6MB)
 테스트 3 〉    통과 (0.13ms, 16.3MB)
 테스트 4 〉    통과 (0.24ms, 16.7MB)
 테스트 5 〉    통과 (0.18ms, 16.3MB)
 테스트 6 〉    통과 (0.28ms, 16.6MB)
 테스트 7 〉    통과 (0.16ms, 16.6MB)
 테스트 8 〉    통과 (0.14ms, 16.5MB)
*/
