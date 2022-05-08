//
//  main.swift
//  220507 #2
//
//  Created by Park Gyurim on 2022/05/07.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var sum1 : Int64 = queue1.reduce(0) { $0 + Int64($1) }, sum2 : Int64 = queue2.reduce(0) { $0 + Int64($1) }
    let targetSum = (sum1 + sum2) / 2
    var count = 0, maxCount = 3 * queue1.count// + queue2.count
    var operationQueue = queue1, sourceQueue = queue2
    
    var sourceRemoveIndex = 0
    var operationRemoveIndex = 0
    
    while sum1 != targetSum {
        if count > maxCount { return -1 }
        
        if sum1 < targetSum {
            let temp = sourceQueue[sourceRemoveIndex]//.removeFirst()
            sourceRemoveIndex += 1
            operationQueue.append(temp)
            sum1 += Int64(temp)
        } else {
            let temp = operationQueue[operationRemoveIndex]//.removeFirst()
            operationRemoveIndex += 1
            sourceQueue.append(temp)
            sum1 -= Int64(temp) 
        }
        
        count += 1
        //print(count, sum1, operationQueue, operationRemoveIndex, sourceQueue, sourceRemoveIndex)
    }
    
    return count
}

print(solution([3, 2, 7, 2], [4, 6, 5, 1]), 2)
print(solution([1, 2, 1, 2], [1, 10, 1, 2]), 7)
print(solution([1, 10, 1, 2], [1, 2, 1, 2]), 7)
print(solution([1, 1], [1, 5]), -1)

/*
 //    func operation(biggerQueue : [Int], smallerQueue : [Int], biggerSum : Int, smallerSum : Int) {
 //        if biggerSum == smallerSum { return }
 //
 //
 //    }
 //
 //    if sum1 > sum2 {
 //        operation(biggerQueue: q1, smallerQueue: q2, biggerSum: sum1, smallerSum: sum2)
 //    } else {
 //        operation(biggerQueue: q2, smallerQueue: q1, biggerSum: sum2, smallerSum: sum1)
 //    }
 //
*/

/*
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue : [Int] = []
    var smallSum = 0, bigSum = 0, count = 0
    var middlePoint = queue1.count, startPoint = 0
    
    if queue1.reduce(0, +) > queue2.reduce(0, +) {
        queue = queue2 + queue1
        smallSum = queue2.reduce(0, +)
        bigSum = queue1.reduce(0, +)
    } else {
        queue = queue1 + queue2
        bigSum = queue2.reduce(0, +)
        smallSum = queue1.reduce(0, +)
    }
    let targetSum = bigSum + smallSum
    var isChanged : Bool = false
    
    while true { // MARK: !!
        print("op #\(count)", startPoint, middlePoint)
        //        isChanged = false
        
        if smallSum == bigSum { break }
        
        // move middle (->)
        if smallSum + queue[middlePoint] <= bigSum - queue[middlePoint] {
            smallSum += queue[middlePoint]
            bigSum -= queue[middlePoint]
            middlePoint += 1
            
            continue
        }
        
        // move end (<-)
        if smallSum + queue[startPoint] <= bigSum - queue[startPoint] {
            smallSum += queue[startPoint]
            bigSum -= queue[startPoint]
            startPoint += 1
            
            isChanged = true
            continue
        }
        
        //count += isChanged ? 1 : 0
    }
    
    for i in 0..<middlePoint {
        print(queue[i], terminator: " ")
    }
    print("")
    
    return count
}
*/
