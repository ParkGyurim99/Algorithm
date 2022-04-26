//
//  main.swift
//  220426_4
//
//  Created by Park Gyurim on 2022/04/26.
//
//  예산
//  https://programmers.co.kr/learn/courses/30/lessons/12982
//

import Foundation

// Solution with DFS
// 
//func solution(_ d:[Int], _ budget:Int) -> Int {
//    var candidate : [[Int]] = []
//
//    func dfs(list : [Int], price : Int) {
//        if price == budget {
//            candidate.append(list)
//            return
//        }
//
//        for i in 0..<list.count {
//            var temp = list
//            let itemPrice = temp.remove(at: i)
//
//            dfs(list: temp, price: price + itemPrice)
//        }
//    }
//    dfs(list: d, price: 0)
//
//    var answer = Set<Int>()
//    candidate.forEach { answer.insert($0.count) }
//
//    return d.count - answer.min()!
//}

func solution(_ d:[Int], _ budget:Int) -> Int {
    var answer = 0, price = 0
    for i in d.sorted() {
        price += i
        answer += 1
        if price == budget { break; }
        else if price > budget { answer -= 1; break }
    }
    
    return answer
}
/*
 물품을 구매해 줄 때는 각 부서가 신청한 금액만큼을 모두 지원해 줘야 합니다. 예를 들어 1,000원을 신청한 부서에는 정확히 1,000원을 지원해야 하며, 1,000원보다 적은 금액을 지원해 줄 수는 없습니다.
 
 ➡️ 항상 목표 금액으로 조합될 수 있다는 의미
 
 ➡️ 즉, 최대한 많은 부서를 지원해야하기 때문에 정렬된 배열로 탐색을 시작해도 되고, 특정 시점에 목표 금액이 만들어진다.
*/

print(solution([1,3,2,5,4], 9))
print(solution([2,2,3,3], 10))
