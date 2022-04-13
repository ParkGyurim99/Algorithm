//
//  main.swift
//  220414_5
//
//  Created by Park Gyurim on 2022/04/14.
//
//  부족한 금액 계산하기
//  https://programmers.co.kr/learn/courses/30/lessons/82612
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let multiplier = count * (count + 1) / 2
    return price * multiplier < money ? 0 : Int64(price * multiplier - money)
}


print(solution(3, 20, 4))
