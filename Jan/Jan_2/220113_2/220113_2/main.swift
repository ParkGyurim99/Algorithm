//
//  main.swift
//  220113_2
//
//  Created by Park Gyurim on 2022/01/13.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    for place in places {
        result.append(solution2(place))
    }
    
    return result
}

func solution2(_ place : [String]) -> Int {
    var lines : [[Character]] = []
    lines.append(["M", "M", "M", "M", "M", "M", "M"])
    
    for i in place.indices {
        if place[i].contains("PP") || place[i].contains("POP") { return 0 }
        let temp = "M" + place[i] + "M"
        lines.append(Array(temp))
    }
    lines.append(["M", "M", "M", "M", "M", "M", "M"])

    for i in 1..<6 {
        for j in 1..<6 {
            if lines[i][j] == "P" {
                if lines[i-1][j-1] == "P" && lines[i-1][j] == "O" { return 0 }
                else if lines[i-1][j] == "O" && lines[i-1][j+1] == "P" { return 0 }

                else if lines[i+1][j-1] == "P" && lines[i+1][j] == "O" { return 0 }
                else if lines[i+1][j] == "O" && lines[i+1][j+1] == "P" { return 0 }
                
                else if lines[i+1][j] == "P" { return 0 }
                else if lines[i+1][j] == "O" && lines[i+2][j] == "P" { return 0 }
            }
        }
    }
    return 1
}

/*
 
 0  ["M", "M", "M", "M", "M", "M", "M"]
 1  ["M", "O", "O", "P", "O", "O", "M"]
 2  ["M", "O", "P", "O", "O", "O", "M"]
 3  ["M", "O", "O", "O", "O", "O", "M"]
 4  ["M", "O", "O", "O", "O", "O", "M"]
 5  ["M", "O", "O", "O", "O", "O", "M"]
 6  ["M", "M", "M", "M", "M", "M", "M"]
 
 
 P OOO P
 
 O XXO X
 O PXP X
 O OXO X
 
 P OXX P
 
 
 
 
 print("\(lines[i-1][j-1]) \(lines[i-1][j]) \(lines[i-1][j+1])")
 print("\(lines[i][j-1]) \(lines[i][j]) \(lines[i][j+1])")
 print("\(lines[i+1][j-1]) \(lines[i+1][j]) \(lines[i+1][j+1])")
 print("")
*/


print(
    solution(
        [
            ["OOPOO", "OPOOO", "OOOOO", "OOOOO", "OOOOO"],
            ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
            ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"],
            ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
            ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]
        ]
    )
)
