//
//  Heap+Protocol.swift
//  Heap
//
//  Created by Park Gyurim on 2022/07/24.
//

import Foundation

enum Child {
    case none
    case left
    case both
    
    static func type(_ index : Int, size : Int) -> Self {
        if size < index * 2 + 1 { return .none }
        else if size == index * 2 + 1 { return .left }
        else { return .both }
    }
}

protocol Heap {
    var array : [Int] { get set }
    
    mutating func insert(_ data : Int)
    mutating func pop() -> Int?
    
    mutating func sort()
    func sorted() -> [Int]
    
    static func heapify(_ array: inout [Int])
}

extension Heap {
    func display() {
        if array.count == 1 { print("Empty!") }
        else { print(array[1..<array.endIndex]) }
    }
    
    func getParentIndex(_ index : Int) -> Int { index / 2 }
    
    func getLeftChildIndex(_ index : Int) -> Int { index * 2 }
    
    func getRightChildIndex(_ index : Int) -> Int { index * 2 + 1 }
}
