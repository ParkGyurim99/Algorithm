//
//  main.swift
//  220311_1
//
//  Created by Park Gyurim on 2022/03/11.
//

import Foundation

@discardableResult
func solution(_ s:String) -> String {
    var answer = ""
    let str = s.lowercased().map { String($0) }
    var spaceCheck = true

    for index in str.indices {
        if spaceCheck == true { answer += str[index].uppercased() }
        else { answer += str[index] }
        
        spaceCheck = str[index]  == " " ? true : false
    }

    return answer
}

print(solution("3people  unFollowed me")) // "3people  Unfollowed Me"
print(solution("for the last week")) // "For The Last Week"

// 공백문자가 연속해서 나올 수 있습니다...!
// 공백문자는 .uppercased() 해도 공백이심
