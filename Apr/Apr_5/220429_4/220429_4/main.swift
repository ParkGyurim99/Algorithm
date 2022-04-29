//
//  main.swift
//  220429_4
//
//  Created by Park Gyurim on 2022/04/29.
//
//  핸드폰 번호 가리기
//  https://programmers.co.kr/learn/courses/30/lessons/12948
//

import Foundation

func solution(_ phone_number:String) -> String {
    String(Array(1...phone_number.count)
        .map { $0 > 4 ? "*" : phone_number[phone_number.index(phone_number.endIndex, offsetBy: -$0)]
    }.reversed())
}

print(solution("01033334444"),"*******4444")
print(solution("027778888"),"*****8888")

