//
//  main.swift
//  220225_3
//
//  Created by Park Gyurim on 2022/02/25.
//

import Foundation

func Combination(_ arr: [Int], _ r: Int, _ res: inout [[Int]], _ now: [Int] = [Int]()) {
    let n = arr.count
    guard n > 0 else { return }
    
    if r == 0 { res.append(now) }
    else if n == r { res.append(now + arr) }
    else {
        Combination(Array(arr[1...]), r - 1, &res, now + [arr.first!])
        Combination(Array(arr[1...]), r, &res, now)
    }
}

func solution(_ clothes:[[String]]) -> Int {
    var answer = 1
    var numOfClothes : [String : Int] = [:]
    var combinations : [[Int]] = []
    
    for c in clothes {
        if let _ = numOfClothes[c[1]] { numOfClothes[c[1]]! += 1 }
        else { numOfClothes[c[1]] = 1 }
    }
    
    let nums : [Int] = numOfClothes.map { key, value in return value }
    
    Combination(nums, nums.count, &combinations)
    
    combinations.first!.forEach { answer *= ($0 + 1) }
    
    return answer - 1
}

print(solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"], ["mask", "face"]]))
