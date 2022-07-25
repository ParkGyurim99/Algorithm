//
//  main.swift
//  Heap
//
//  Created by Park Gyurim on 2022/07/24.
//

import Foundation

var heap = maxHeap()

heap.insert(30)
heap.insert(20)
heap.insert(18)
heap.insert(9)
heap.insert(6)
heap.insert(50)

print(heap.array)

heap.heapSort()
print(heap.array)

//var temp : [Int] = [6, 9, 18, 50, 30, 20]
//heap.heapify(&temp)
//print(temp)


//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
//
//print("heap remove(pop) :", heap.remove())
//
//print(heap.array)
