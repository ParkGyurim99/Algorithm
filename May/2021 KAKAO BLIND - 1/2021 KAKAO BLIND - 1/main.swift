//
//  main.swift
//  2021 KAKAO BLIND - 1
//
//  Created by Park Gyurim on 2022/05/05.
//
//  2021 KAKAO BLIND RECRUITMENT : 신규 아이디 추천
//  https://programmers.co.kr/learn/courses/30/lessons/72410
//

/*
 아이디는 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.) 문자만 사용할 수 있습니다.
 단, 마침표(.)는 처음과 끝에 사용할 수 없으며 또한 연속으로 사용할 수 없습니다.
 
 1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
 만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
*/

import Foundation

func solution(_ new_id:String) -> String {
    let validChar = "abcdefghijklmnopqrstuvwxyz1234567890-_.".map{$0}
    var answer : [String] = []
    new_id.lowercased().forEach { if validChar.contains($0) {answer.append(String($0))} }
    var i = 0
    while i < (answer.count - 1) {
        if answer[i] == "." && answer[i + 1] == "." {
            answer.remove(at: i)
            i -= 1
        } else if answer[i] == "" {
            answer.remove(at: i)
            i -= 1
        }
        i += 1
    }
    
    if answer[i] == "" {
        answer.remove(at: i)
        i -= 1
    }
    
    if let first = answer.first {
        if first == "." { answer.removeFirst() }
    } else { answer.append("a") }
    
    if let last = answer.last { if last == "." { answer.removeLast() } }
    else { answer.append("a") }
    
    if answer.count > 15 {
        answer.removeLast(answer.count - 15)
        if answer.last == "." { answer.removeLast() }
    } else if answer.count < 3 { answer += Array(repeating: answer.last ?? "a", count: 3 - answer.count) }
    
    return answer.joined()
}

print(solution("...!@BaT#*..y.abcdefghijklm"), "bat.y.abcdefghi")
print(solution("z-+.^."), "z--")
print(solution("=.="), "aaa")
print(solution("123_.def"), "123_.def")
print(solution("abcdefghijklmn.p"), "abcdefghijklmn")
