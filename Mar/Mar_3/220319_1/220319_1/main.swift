//
//  main.swift
//  220319_1
//
//  Created by Park Gyurim on 2022/03/19.
//

import Foundation

let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] // 26

func indexDistance(cur : Int, next : Int, length : Int) -> Int {
    if next > cur {
        let distanceRight = next - cur
        let distanceLeft = cur + length - next
        
        if distanceRight < distanceLeft { return distanceRight }
        else { return distanceLeft }
    } else { // cur > next
        let distanceRight = cur - next
        let distanceLeft = next + length - cur
        
        if distanceRight < distanceLeft { return distanceRight }
        else { return distanceLeft }
    }
}

func alphaDistance(next : String) -> Int {
    let distanceTop = alphabets.firstIndex(of: next)! - alphabets.firstIndex(of: "A")!
    let distanceDown = alphabets.firstIndex(of: "A")! + 26 - alphabets.firstIndex(of: next)!
    if distanceTop < distanceDown { return distanceTop }
    else { return distanceDown }
}

func findNextDistance(cur : Int, candidate : [Int], length : Int) -> (Int, Int) {
    var min = 20
    var minIndex = 0
    
    // Determine Left or Right move
    let S = cur - length/2 < 0 ? cur + length/2 : cur - length/2
    var leftCount = 0
    var rightCount = 0
    
    if cur < S {
        // count left
        for index in S..<length { if candidate.contains(index) { leftCount += 1 } }
        for index in 0..<cur { if candidate.contains(index) { leftCount += 1 } }
        // count right
        for index in cur..<S { if candidate.contains(index) { rightCount += 1 } }
    } else { // S < cur
        // count left
        for index in S..<cur { if candidate.contains(index) { leftCount += 1 } }
        // count right
        for index in S..<length { if candidate.contains(index) { rightCount += 1 } }
        for index in 0..<cur { if candidate.contains(index) { rightCount += 1 } }
    }
    
    var check = false
    
    if leftCount > rightCount { check = false } // -> : minIndex must be larger than cur
    else { check = true } // <- : minIndex must be smaller than cur
    
    for c in (check ? candidate.reversed() : candidate)  {
        let temp = indexDistance(cur: cur, next: c, length: length)
        if temp < min {
            min = temp
            minIndex = c
        }
    }
    
    return (minIndex, min) // next index, distance
}

func solution(_ name:String) -> Int {
    let length = name.count
    let nameCopy = name.map { String($0) }
    var curIndex = 0
    var count = 0
    var indexToManipulate : [Int] = []
    for index in 0..<nameCopy.count { if nameCopy[index] != "A" { indexToManipulate.append(index) } }
    while !indexToManipulate.isEmpty {
        let temp = findNextDistance(cur: curIndex, candidate: indexToManipulate, length: length)
        count += (alphaDistance(next: nameCopy[temp.0]) + temp.1)
        curIndex = indexToManipulate.remove(at: indexToManipulate.firstIndex(of: temp.0)!)
    }

    return count
}

print(solution("JAZ"), 11)
print(solution("JEROEN"), 56)
print(solution("JAN"), 23)
print(solution("ABAAAAAAAAABB"), 7)
print(solution("BBABAAAABBBAAAABABB"), 26)
print(solution("BBAAAAAABBBAAAAAABB"), 20)
print(solution("BBAABB"), 8)
print(solution("BBBAAAAABAAAAAAAAAAA"), 12)
print(solution("BAAAAAAAAAABAAAAAABB"), 13)
print(solution("AAABBAB"), 7)
print(solution("BBBBAAAAAB"), 10)
print(solution("BBBAAAAAAAB"), 8)
print(solution("AAAZAAZA"), 7)
print(solution("AAABAAAAAB"), 7)
