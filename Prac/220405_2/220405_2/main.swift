//
//  main.swift
//  220405_2
//
//  Created by Park Gyurim on 2022/04/05.
//
//  https://programmers.co.kr/learn/courses/30/lessons/70129
//

import Foundation

func getBinaryNumber(n : Int) -> String {
    if n == 0 { return "" }
    return "\(getBinaryNumber(n: n / 2))\(n % 2)"
}
// String(10, radix: 2) -> 2진수 String으로 변환해줌 ;;

@discardableResult
func solution(_ s:String) -> [Int] {
    var source = s
    var answer = [0,0]
    
    while (source != "1") {
        answer[0] += 1
        var temp = source.map { String($0) }
        temp.sort()
        
        let oneCount = temp.count - temp.firstIndex(of: "1")!
        answer[1] += temp.firstIndex(of: "1")!
        source = getBinaryNumber(n: oneCount)
    }
    
    print(answer)
    
    
    return answer
}

//solution("0111010")
solution("110010101001")
solution("01110")
solution("1111111")
