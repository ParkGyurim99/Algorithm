//
//  MaxHeap.swift
//  Heap
//
//  Created by Park Gyurim on 2022/07/26.
//

import Foundation

struct MaxHeap : Heap {
    var array = Array<Int>()
    
    var maxValue : Int? {
        if array.count == 1 { return nil }
        else { return array[1] }
    }
    
    init() { array.append(Int.max) }
    
    init(_ data : Int) { array.append(contentsOf: [Int.max, data]) }
    
    init(heapified : [Int]) { array = heapified }
    
    mutating func insert(_ data : Int) {
        var currentIndex = array.count
        
        array.append(data)
        
        while array[getParentIndex(currentIndex)] < array[currentIndex] {
            array.swapAt(getParentIndex(currentIndex), currentIndex)
            
            currentIndex = getParentIndex(currentIndex)
        }
    }
    
    mutating func pop() -> Int? {
        if array.count == 1 { return nil }
        else if array.count == 2 { return array.removeLast() }
        
        var currentIndex = 1
        let returnValue = array[currentIndex]
        
        array[currentIndex] = array.removeLast()
        
        while true {
            switch Child.type(currentIndex, size : array.count) {
                case .both :
                    let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                    if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }
                    
                    currentIndex = greaterChildIndex
                    
                case .left :
                    if array[getLeftChildIndex(currentIndex)] > array[currentIndex] { array.swapAt(getLeftChildIndex(currentIndex), currentIndex) }
                    
                    return returnValue
                    
                case .none :
                    return returnValue
            }
        }
    }
    
    mutating func sort() {
        if array.count == 1 { return }
        else if array.count == 2 { return }
        
        var currentIndex = 1
        for i in 1..<array.count {
            currentIndex = 1
            array.swapAt(currentIndex, array.count - i)
            
            loop : while true {
                switch Child.type(currentIndex, size : array.count - i) {
                    case .both :
                        let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                        if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }
                        
                        currentIndex = greaterChildIndex
                        
                    case .left :
                        if array[getLeftChildIndex(currentIndex)] > array[currentIndex] { array.swapAt(getLeftChildIndex(currentIndex), currentIndex) }

                        break loop

                    case .none :
                        break loop
                }
            }
        }
    }
    
    func sorted() -> [Int] {
        var array = array
        
        if array.count == 1 { return [] }
        else if array.count == 2 { return array }
        
        var currentIndex = 1
        for i in 1..<array.count {
            currentIndex = 1
            array.swapAt(currentIndex, array.count - i)
            
            loop : while true {
                switch Child.type(currentIndex, size : array.count - i) {
                    case .both :
                        let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                        if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }
                        
                        currentIndex = greaterChildIndex
                        
                    case .left :
                        let leftChildIndex = currentIndex * 2
                        if array[leftChildIndex] > array[currentIndex] { array.swapAt(leftChildIndex, currentIndex) }
                        
                        break loop
                        
                    case .none :
                        break loop
                }
            }
        }
        
        return Array(array[1..<array.endIndex])
    }
    
    static func heapify(_ array: inout [Int]) {
        array.insert(Int.max, at: 0)
        
        for index in (1...(array.count - 1) / 2).reversed() {
            var currentIndex = index
            
            loop : while true {
                switch Child.type(currentIndex, size : array.count) {
                    case .both :
                        let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                        if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }
                        
                        currentIndex = greaterChildIndex
                        
                    case .left :
                        let leftChildIndex = currentIndex * 2
                        if array[leftChildIndex] > array[currentIndex] { array.swapAt(leftChildIndex, currentIndex) }
                        
                        break loop
                        
                    case .none :
                        break loop
                }
            }
        }
    }
}
