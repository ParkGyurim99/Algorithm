//
//  main.swift
//  220224_2
//
//  Created by Park Gyurim on 2022/02/24.
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

func Permutation(_ arr : [String], depth : Int, _ res : inout [[String]]) {
    if depth == arr.count { return }
    var buffer : [[String]] = [] // Flush buffer
    
    for i in depth..<arr.count {
        var temp = arr
        temp.swapAt(depth, i)
        
        buffer.append(temp)
    }
    
    if buffer.count == 1 { res += buffer }
    
    _ = buffer.map { Permutation($0, depth: depth + 1, &res) }
}

func Combination(_ arr: [String], _ r: Int, _ res: inout [[String]], _ now: [String] = [String]()) {
    let n = arr.count
    guard n > 0 else { return }
    
    if r == 0 { res.append(now) }
    else if n == r { res.append(now + arr) }
    else {
        Combination(Array(arr[1...]), r - 1, &res, now + [arr.first!])
        Combination(Array(arr[1...]), r, &res, now)
    }
}

func solution(_ numbers:String) -> Int {
    let nums = numbers.compactMap { String($0) }
    
    var combinations : [[String]] = []
    var permutations : [[String]] = []
    
    for r in 1...nums.count { Combination(nums, r, &combinations) }
    
    for comb in combinations { Permutation(comb, depth: 0, &permutations) }
    
    let candidate : [Int] = permutations.compactMap { Int($0.joined()) }
    let candidateSet = Set(candidate)
    
    var count = 0
    _ = candidateSet.map { n in
        if isPrime(n) {
            count += 1
        }
    }
    
    return count
}

print(solution("1231"))
