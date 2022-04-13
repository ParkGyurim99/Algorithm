//
//  main.swift
//  220104_3
//
//  Created by Park Gyurim on 2022/01/04.
//

import Foundation

func solution(_ s:String) -> Int {
    let length = s.count
    var minLength = 1000
    
    for size in 1...length {
    //for size in 2...2 {
        var result = ""
        var i = 0
        while(i < length - size) {
            let startingIndex = s.index(s.startIndex, offsetBy: i)
            let endingIndex = s.index(startingIndex, offsetBy : size)
            let range = startingIndex..<endingIndex
            
            if i % size != 0 {
                result += s[startingIndex...startingIndex]
                i += 1
                continue
            }
            var count = 0
            //var str = String(s[startingIndex..<s.endIndex])
            count = checkRight(str: String(s[startingIndex..<s.endIndex]), word: String(s[range]), wordSize: size, count: &count)
            
            if count <= 1 {
                result += s[startingIndex...startingIndex]
                i += 1
            } else {
                result += "\(count)" + String(s[range])
                i += count * size
            }
        }
        result += s.substring(from: s.index(s.startIndex, offsetBy: i))
        
        print(result)
        if minLength > result.count { minLength = result.count }
    }
    
    return minLength
}

func checkRight(str : String, word : String, wordSize : Int, count : inout Int) -> Int {
    if str.count >= wordSize {
        if str[str.startIndex..<str.index(str.startIndex, offsetBy : wordSize)] == word {
            count += 1
            checkRight(str : str.substring(from: str.index(str.startIndex, offsetBy: wordSize)), word : word, wordSize : wordSize, count : &count)
        }
    }
    return count
}

let testString = "abcabcdede"
print("length : \(solution(testString))")
