//
//  main.swift
//  220311_2
//
//  Created by Park Gyurim on 2022/03/11.
//

import Foundation

//func solution(_ s:String) -> Int{
//    var str = s.map { String($0) }
//    var index = 0
////    print(str[0..<index])
////    print(str[(index + 2)..<str.endIndex])
////    let temp = Array(str[0..<index] + str[(index + 2)..<str.endIndex])
////
//    while(index != str.count - 2) {
//        if str[index] == str[index + 1] {
//            str = Array(str[0..<index] + str[index+2..<str.endIndex])
//            index = index == 0 ? 0 : index - 1
//        } else { index += 1 }
//    }
//    if index == 0 && (str[index] == str[index + 1]) { return 1 }
//    else { return 0 }
//}

func solution(_ s:String) -> Int{
    let str = Array(s)//s.map { String($0) }
    var list = Array<Character>()

    for k in str {
        if list.last == k { list.removeLast() }
        else { list.append(k) }
    }
    
    return list.isEmpty ? 1 : 0
}

// 모든 문자열이 짝지어 제거가 되면 -> 1, else 0
// 정확성 검사 + 효율성 검사
// 효율성 통과를 못한다면 type casting 을 없애보자

print(solution("baabaa"))
print(solution("cbcb"))
