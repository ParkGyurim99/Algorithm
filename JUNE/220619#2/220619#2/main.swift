//
//  main.swift
//  220619#2
//
//  Created by Park Gyurim on 2022/06/19.
//

import Foundation
//import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

enum Direction {
    case up
    case down
    case right
    case left
    
    func changeDirection() -> Direction {
        switch self {
            case .down : return .left
            case .up : return .right
            case .right : return .down
            case .left : return .up
        }
    }
    
    func nextPoint(x : Int, y : Int) -> [Int] {
        switch self {
            case .down : return [x + 1, y]
            case .up : return [x - 1, y]
            case .right : return [x, y + 1]
            case .left : return [x, y - 1]
        }
    }
}

public func solution(_ R : inout [String]) -> Int {
    let map : [[String]] = R.map { $0.map { String($0) } }
    
    var direction : Direction = .right
    var cleaningStatus : [[Int]] = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: R[0].count), count: R.count)
    var currentPoint : [Int] = [0,0]
    
    var answer = 0
    
    if R == ["."] { return 1 }
    
    @discardableResult
    func cleaning(dir : Direction) -> Int {
//        print(currentPoint, direction)
//        print(cleaningStatus[currentPoint[0]][currentPoint[1]])
        
        let nextPoint = direction.nextPoint(x: currentPoint[0], y: currentPoint[1])
        if nextPoint[0] < 0 || nextPoint[0] >= map.count || nextPoint[1] < 0 || nextPoint[1] >= map[0].count { // boundary
            direction = direction.changeDirection()
            cleaning(dir: direction)
        } else {
            if cleaningStatus[currentPoint[0]][currentPoint[1]] > 5 { // cleaned
                return answer
            } else if cleaningStatus[currentPoint[0]][currentPoint[1]] == 0 { // not cleaned
                cleaningStatus[currentPoint[0]][currentPoint[1]] += 1
                answer += 1
            } else {
                cleaningStatus[currentPoint[0]][currentPoint[1]] += 1
            }
            
            if map[nextPoint[0]][nextPoint[1]] == "X" { // Obstacle
                direction = direction.changeDirection()
                cleaning(dir: direction)
            } else { // Empty
                currentPoint = nextPoint
                cleaning(dir: direction)
            }
        }
        
        return answer
    }
    
//    if R == ["."] {
//        return 1
//    } else {
//        cleaning(dir: direction)
//    }

    return cleaning(dir: direction)
}

var src1 = ["....X..", "X......", ".....X.", "......."]
var src2 = ["...X..", ",,,,XX", "..X..."]
var src3 = ["...X.", ".X..X", "X...X", "..X.."]
var src4 = ["."]
print(solution(&src1))
print(solution(&src2))
print(solution(&src3))
print(solution(&src4))
