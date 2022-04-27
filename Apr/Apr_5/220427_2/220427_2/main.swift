//
//  main.swift
//  220427_2
//
//  Created by Park Gyurim on 2022/04/27.
//
//  문자열 내 마음대로 정렬하기
//  https://programmers.co.kr/learn/courses/30/lessons/12915
//

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
//    return strings.sorted {
//        if $0[$0.index($0.startIndex, offsetBy: n)] == $1[$1.index($1.startIndex, offsetBy: n)] {
//            return $0 < $1
//        } else {
//            return $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)]
//        }
//    }
    
//    return strings.sorted {
//        $0[$0.index($0.startIndex, offsetBy: n)] == $1[$1.index($1.startIndex, offsetBy: n)] ? $0 < $1 : $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)]
//    }
    
    return strings.sorted { Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n] }
}

print(solution(["sun", "bed", "car"], 1))
print(solution(["abce", "abcd", "cdx"], 2))
