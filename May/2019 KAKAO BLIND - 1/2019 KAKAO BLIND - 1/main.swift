//
//  main.swift
//  2019 KAKAO BLIND - 1
//
//  Created by Park Gyurim on 2022/05/04.
//
//  2019 KAKAO BLIND RECRUITMENT : 실패율
//  https://programmers.co.kr/learn/courses/30/lessons/42889
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var peopleOnStage : [Int : Int] = [:]
    var failRate : [Int : Double] = [:]
    stages.forEach { peopleOnStage[$0] = peopleOnStage[$0] == nil ? 1 : peopleOnStage[$0]! + 1 }
    
    //print(peopleOnStage)
    
    var previous = 0
    for i in 1...N {
        //print("failRate \(i) : \(peopleOnStage[i] ?? 0) / \(stages.count - previous)")
        failRate[i] = Double(peopleOnStage[i] ?? 0) / Double(stages.count - previous)
        previous += peopleOnStage[i] ?? 0
    }
    //print(failRate)
    
    return Array(1...N).sorted { failRate[$0]! > failRate[$1]! }
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
print(solution(4, [4, 4, 4, 4, 4]))

/*

 테스트 1 〉    통과 (0.18ms, 16.4MB)
 테스트 2 〉    통과 (0.47ms, 16.7MB)
 테스트 3 〉    통과 (6.15ms, 16.8MB)
 테스트 4 〉    통과 (45.11ms, 21MB)
 테스트 5 〉    통과 (104.06ms, 25.6MB)
 테스트 6 〉    통과 (1.32ms, 16.5MB)
 테스트 7 〉    통과 (7.09ms, 16.9MB)
 테스트 8 〉    통과 (42.87ms, 20.9MB)
 테스트 9 〉    통과 (71.21ms, 25.6MB)
 테스트 10 〉    통과 (54.83ms, 21MB)
 테스트 11 〉    통과 (37.16ms, 20.8MB)
 테스트 12 〉    통과 (51.94ms, 23MB)
 테스트 13 〉    통과 (74.09ms, 23.9MB)
 테스트 14 〉    통과 (0.31ms, 16.4MB)
 테스트 15 〉    통과 (20.16ms, 18.5MB)
 테스트 16 〉    통과 (13.02ms, 17.3MB)
 테스트 17 〉    통과 (33.06ms, 18.4MB)
 테스트 18 〉    통과 (17.60ms, 17.3MB)
 테스트 19 〉    통과 (2.06ms, 16.7MB)
 테스트 20 〉    통과 (13.18ms, 18.4MB)
 테스트 21 〉    통과 (28.85ms, 20.8MB)
 테스트 22 〉    통과 (78.13ms, 25.7MB)
 테스트 23 〉    통과 (55.34ms, 25.6MB)
 테스트 24 〉    통과 (56.13ms, 25.5MB)
 테스트 25 〉    통과 (0.16ms, 16.5MB)
 테스트 26 〉    통과 (0.16ms, 16.4MB)
 테스트 27 〉    통과 (0.22ms, 16.2MB)
 
*/
