//
//  main.swift
//  220305_2
//
//  Created by Park Gyurim on 2022/03/05.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer = bridge_length
    var onTheBridgeWeight = 0
    var onTheBridge : [Int] = Array(repeating: 0, count: bridge_length - 1)
    var index = 0
    
    while(index < truck_weights.count) {
        if onTheBridgeWeight + truck_weights[index] <= weight {
            onTheBridgeWeight += truck_weights[index]

            onTheBridge.append(truck_weights[index])
            index += 1
        } else {  onTheBridge.append(0) }
        answer += 1
        print(onTheBridge)
        
        onTheBridgeWeight -= onTheBridge.removeFirst()
    }
    
    return answer
}

//print(solution(2, 10, [7,4,5,6]))
print(solution(100,100,[10]))
//print(solution(100,100,[10,10,10,10,10,10,10,10,10,10]))
