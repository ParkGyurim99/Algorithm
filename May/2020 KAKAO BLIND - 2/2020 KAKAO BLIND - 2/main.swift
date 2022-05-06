//
//  main.swift
//  2020 KAKAO BLIND - 2
//
//  Created by Park Gyurim on 2022/05/06.
//
//  2020 KAKAO BLIND RECRUITMENT : 괄호 변환
//  https://programmers.co.kr/learn/courses/30/lessons/60058
//

/*
 1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
 
 2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다.
    단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
 
 3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
     3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
 
 4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
     4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
     4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
     4-3. ')'를 다시 붙입니다.
     4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
     4-5. 생성된 문자열을 반환합니다.
*/

import Foundation

func isValid(_ str : String) -> Bool {
    var check = 0
    for c in str {
        check += c == "(" ? 1 : -1
        
        if check < 0 { return false }
    }
    return check == 0 ? true : false
}

func solution(_ str : String) -> String {
    if str.isEmpty { return "" }
    else if isValid(str) { return str }
    
    var check = 0, index = 0
    let strArr = Array(str)
    
    for i in 0..<strArr.count {
        if strArr[i] == "(" { check += 1 }
        else { check -= 1 }
        
        if check == 0 {
            index = i
            break
        }
    }
    
    let u = String(strArr[0...index])
    let v = String(strArr[index+1..<strArr.endIndex])
    
    return isValid(u) ? u + solution(v) : "(\(solution(v)))"
                                            + u[u.index(u.startIndex, offsetBy: 1)..<u.index(u.endIndex, offsetBy: -1)].indices
                                                    .map { i -> String in u[i] == ")" ? "(" : ")" }.joined()
}

print(solution("(()())()"), "(()())()")
print(solution(")("), "()")
print(solution("()))((()"), "()(())()")

/*
 
 테스트 1 〉     통과 (0.01ms, 16.1MB)
 테스트 2 〉     통과 (0.12ms, 16.3MB)
 테스트 3 〉     통과 (0.01ms, 16.3MB)
 테스트 4 〉     통과 (0.12ms, 16MB)
 테스트 5 〉     통과 (0.01ms, 16.2MB)
 테스트 6 〉     통과 (0.11ms, 16.2MB)
 테스트 7 〉     통과 (0.13ms, 16.1MB)
 테스트 8 〉     통과 (0.01ms, 16.1MB)
 테스트 9 〉     통과 (0.12ms, 16.4MB)
 테스트 10 〉    통과 (0.12ms, 16.2MB)
 테스트 11 〉    통과 (0.16ms, 16.3MB)
 테스트 12 〉    통과 (0.19ms, 16.5MB)
 테스트 13 〉    통과 (0.27ms, 16.6MB)
 테스트 14 〉    통과 (0.65ms, 16.3MB)
 테스트 15 〉    통과 (0.86ms, 16.5MB)
 테스트 16 〉    통과 (2.51ms, 16.8MB)
 테스트 17 〉    통과 (1.58ms, 16.3MB)
 테스트 18 〉    통과 (3.60ms, 16.6MB)
 테스트 19 〉    통과 (7.93ms, 16.9MB)
 테스트 20 〉    통과 (6.67ms, 17MB)
 테스트 21 〉    통과 (1.71ms, 16.6MB)
 테스트 22 〉    통과 (1.08ms, 16.4MB)
 테스트 23 〉    통과 (4.25ms, 16.8MB)
 테스트 24 〉    통과 (0.64ms, 16.4MB)
 테스트 25 〉    통과 (1.88ms, 16.6MB)
*/
