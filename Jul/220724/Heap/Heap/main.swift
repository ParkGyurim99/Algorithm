//
//  main.swift
//  Heap
//
//  Created by Park Gyurim on 2022/07/24.
//

import Foundation

// Initialize
var heap = MaxHeap()

// Insert
print("📌 Insert")
[3, 7, 9, 10, 15, 19, 20, 30, 33].forEach { heap.insert($0) }
heap.display()

// Sorting
print("\n📌 Sorting")
print(heap.sorted())

// Sorted (in-place)
//print("\nPrint HeapSorted")
//heap.sort()
//heap.display()

// Heapify
var source : [Int] = [3, 7, 9, 10, 15, 19, 20, 30, 33]
print("\n📌 Heapify")
print(source, terminator: " → ")
MaxHeap.heapify(&source)
print(source[1..<source.endIndex])

// Pop
print("\n📌 Pop")
for _ in 0..<10 {
    if let popped = heap.pop() { print("heap pop :", popped, terminator: " → ") }
    heap.display()
}
