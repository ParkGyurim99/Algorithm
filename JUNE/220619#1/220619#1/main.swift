//
//  main.swift
//  220619#1
//
//  Created by Park Gyurim on 2022/06/19.
//

import Foundation
// import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ T : inout String) -> String {
    // write your code in Swift 4.2.1 (Linux)
    String(T.sorted {
        if $0 == "M" && $1 == "S" { return false }
        else if $0 == "L" && ($1 == "S" || $1 == "M") { return false }
        else { return true }
    })
}

var src1 = "MSSLS"
var src2 = "LLMS"
var src3 = "SMS"

print(solution(&src1)) // SSSML
print(solution(&src2)) // SMLL
print(solution(&src3)) // SSM
