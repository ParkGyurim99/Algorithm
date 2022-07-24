//
//  Heap.swift
//  Heap
//
//  Created by Park Gyurim on 2022/07/24.
//

import Foundation

enum ChildType {
    case none
    case left
    case both
}

protocol Heap {
    mutating func insert(_ data : Int)
    mutating func remove() -> Int?
    // func heapify() -> [Int]
    // func heapSorting() -> [Int]
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
    
    func hasChild(_ index : Int) -> ChildType {
        if array.count - 1 < 2 * index { return .none }
        else if array.count - 1 == 2 * index { return .left }
        else { return .both }
    }
    
    private func getParentIndex(_ index : Int) -> Int { index / 2 }
    private func getLeftChildIndex(_ index : Int) -> Int { 2 * index }
    private func getRightChildIndex(_ index : Int) -> Int { 2 * index + 1 }
    private func getGreaterChildIndex(_ index : Int) -> Int {
        return array[index * 2] > array[index * 2 + 1] ? index * 2 : index * 2 + 1
    }
    
    mutating func insert(_ data : Int) {
        var currentIndex = array.count
        
        array.append(data)
        
        while array[getParentIndex(currentIndex)] < array[currentIndex] {
            array.swapAt(getParentIndex(currentIndex), currentIndex)
            
            currentIndex = getParentIndex(currentIndex)
        }
    }
    
    mutating func remove() -> Int? {
        if array.count == 1 { return nil } // Empty
        else if array.count == 2 { return array.removeLast() }
        
        var currentIndex = 1
        let returnValue = array[currentIndex]
        array[currentIndex] = array.removeLast()
        
        while hasChild(currentIndex) != .none {
            switch hasChild(currentIndex) {
                case .both :
                    if array[getGreaterChildIndex(currentIndex)] > array[currentIndex] {
                        array.swapAt(getGreaterChildIndex(currentIndex), currentIndex)
                        currentIndex = getGreaterChildIndex(currentIndex)
                    } else {
                        return returnValue
                    }
                case .left :
                    if array[getLeftChildIndex(currentIndex)] > array[currentIndex] {
                        array.swapAt(getLeftChildIndex(currentIndex), currentIndex)
                    } else {
                        return returnValue
                    }
                case .none :
                    return returnValue
            }
        }
        
        return returnValue
    }
}
