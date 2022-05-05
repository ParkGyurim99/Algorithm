//
//  main.swift
//  2019 KAKAO WINTER INTERNSHIP - 2
//
//  Created by Park Gyurim on 2022/05/05.
//
//  2019 카카오 개발자 겨울 인턴십 : 튜플
//  https://programmers.co.kr/learn/courses/30/lessons/64065
//
//  문자열 -> 배열 하는 방식이 사람들 마다 다 달랐음

import Foundation

func solution(_ s:String) -> [Int] {
    var answer : [Int] = []
    var temp = s
    temp = temp.replacingOccurrences(of: "},{", with: "|")
    temp = temp.replacingOccurrences(of: "{", with: "")
    temp = temp.replacingOccurrences(of: "}", with: "")
    var source : [[Int]] = temp.split(separator: "|").map {
        $0.split(separator: ",").map { Int($0)! }
    }
    
    source.sort { $0.count < $1.count }
    for src in source {
        for c in src {
            if !answer.contains(c) {
                answer.append(c)
            }
        }
    }
    
    return answer
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"), "[2, 1, 3, 4]")
print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"), "[2, 1, 3, 4]")
print(solution("{{20,111},{111}}"), "[111, 20]")
print(solution("{{123}}"), "[123]")
print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"), "[3, 2, 4, 1]")

/*
 테스트 1 〉    통과 (0.38ms, 16.4MB)
 테스트 2 〉    통과 (0.34ms, 16.5MB)
 테스트 3 〉    통과 (0.32ms, 16.5MB)
 테스트 4 〉    통과 (0.59ms, 16.5MB)
 테스트 5 〉    통과 (2.69ms, 16.6MB)
 테스트 6 〉    통과 (6.89ms, 16.7MB)
 테스트 7 〉    통과 (186.78ms, 16.9MB)
 테스트 8 〉    통과 (926.24ms, 17.2MB)
 테스트 9 〉    통과 (315.50ms, 17.4MB)
 테스트 10 〉    통과 (1018.38ms, 18.1MB)
 테스트 11 〉    통과 (1417.53ms, 17.6MB)
 테스트 12 〉    통과 (2514.24ms, 20MB)
 테스트 13 〉    통과 (2326.71ms, 19.8MB)
 테스트 14 〉    통과 (2517.95ms, 20.1MB)
 테스트 15 〉    통과 (0.31ms, 16.4MB)
*/
