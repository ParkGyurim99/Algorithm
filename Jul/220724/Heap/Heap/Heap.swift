//
//  Heap.swift
//  Heap
//
//  Created by Park Gyurim on 2022/07/24.
//

import Foundation

protocol Heap {
    mutating func insert(_ data : Int)
    mutating func remove() -> Int?
}

struct maxHeap : Heap {
    var array = Array<Int>()
    
    init() {
        array.append(Int.max)
    }
    
    init(_ data : Int) {
        array.append(Int.max)
        array.append(data)
    }
    
    private func parentIndex(_ index : Int) -> Int { index / 2 }
    
    // private func getLeftChildIndex(_ index : Int) -> Int { index * 2 }
    // private func getRightChildIndex(_ index : Int) -> Int { index * 2  + 1 }
    
    mutating func insert(_ data : Int) {
        var currentIndex = array.count
        
        array.append(data)
        
        while array[parentIndex(currentIndex)] < array[currentIndex] {
            array.swapAt(parentIndex(currentIndex), currentIndex)
            
            currentIndex = parentIndex(currentIndex)
        }
    }
    
    mutating func remove() -> Int? {
        return nil
    }
}
