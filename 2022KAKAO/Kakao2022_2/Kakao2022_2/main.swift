
//
//  main.swift
//  Kakao2022_2
//
//  Created by Park Gyurim on 2022/03/01.
//

import Foundation

func isPrime(_ n : Int) -> Bool {
    if n == 1 || n == 0 { return false }
    else if n < 4 { return true }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
    }
    
    return true
}

// num 을 K 진수로 만드는 함수
func makeKsNum(num : Int, k : Int) -> String {
    if k == 10 { return "\(num)" }
    if num == 0 { return "" }
    
    return makeKsNum(num : num/k, k : k) + "\(num % k)"
}

func solution(_ n:Int, _ k:Int) -> Int {
    var answer = 0
    var source = makeKsNum(num: n, k: k)
    if source == "" { source = "0" }
    let sourceCharacter = Array(source).map { String($0) }
    var zerosIndex : [Int] = []
    var candidateIndex : [[Int]] = []
    
    for i in 0..<sourceCharacter.count {
        if sourceCharacter[i] == "0" { zerosIndex.append(i) }
    }
    
    print(source, sourceCharacter.count)
    print(zerosIndex)
    
    if zerosIndex.isEmpty {
        candidateIndex.append([0,sourceCharacter.count])
    } else {
        candidateIndex.append([0, zerosIndex[0]])
        for i in 0..<zerosIndex.count-1 { candidateIndex.append([zerosIndex[i] + 1, zerosIndex[i+1]]) }
        candidateIndex.append([zerosIndex.last! + 1, sourceCharacter.endIndex])
    }
    print(candidateIndex)
    
    for c in candidateIndex {
        if let n = Int(sourceCharacter[c[0]..<c[1]].joined()) {
            if isPrime(n) {
                answer += 1
            }
        }
    }

    
    return answer
}

//print(solution(437674, 3))
//print(solution(110011, 10))
print(solution(4, 3))

/*
    0P0
    0P
    P0
    P
*/

//print(makeKsNum(num: 0, k: 3))
