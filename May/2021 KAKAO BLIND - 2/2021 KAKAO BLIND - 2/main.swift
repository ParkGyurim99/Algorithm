//
//  main.swift
//  2021 KAKAO BLIND - 2
//
//  Created by Park Gyurim on 2022/05/05.
//
//  2021 KAKAO BLIND RECRUITMENT : 메뉴 리뉴얼
//  https://programmers.co.kr/learn/courses/30/lessons/72411
//

import Foundation

func combination(_ arr: [String], _ r: Int, _ res: inout [[String]], _ now: [String] = [String]()) {
    let n = arr.count
    guard n > 0 else { return }
    
    if r == 0 { res.append(now) }
    else if n == r { res.append(now + arr) }
    else {
        combination(Array(arr[1...]), r - 1, &res, now + [arr.first!])
        combination(Array(arr[1...]), r, &res, now)
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var answer : [String] = []
    var menuCombis : [[String]] = []
    var menuDict : [String : Int] = [:]
    
    orders.forEach { order in course.forEach { i in combination(order.map{String($0)}, i, &menuCombis) } }
    
    menuCombis.forEach { menuCombi in
        if let _ = menuDict[menuCombi.sorted().joined()] { menuDict[menuCombi.sorted().joined()]! += 1 }
        else { menuDict[menuCombi.sorted().joined()] = 1 }
    }
    
    course.forEach { i in
        answer += menuDict.filter{ $0.key.count == i && $0.value == menuDict.filter{$0.key.count == i}.values.max() && $0.value > 1}.map{$0.key}
    }
    
    return answer.sorted()
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]), ["AC", "ACDE", "BCFG", "CDE"])
print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]), ["ACD", "AD", "ADE", "CD", "XYZ"])
print(solution(["XYZ", "XWY", "WXA"], [2,3,4]), ["WX", "XY"])

/*
 
 📌 처음 풀이 시도가 안 풀렸던 이유 :
    전체 메뉴에 대한 조합을 구하고 거기서 2개 이상이고 어쩌고 하려고 하니까 너무 양이 많고 처리하기도 힘들었음
 
 ➡️  1. orders 에 대해서 course 배열의 요소만큼 조합을 구함
     2. 메뉴 조합 딕셔너리 (menuCombis) 에 key 로 메뉴 조합, value 로 횟수를 넣음.. 이때 key로 정렬한 후 넣었음 어차피 출력을 글케 해야되니까
     3. 그리고 course 순회 하면서 정답 배열에 넣어준다.
        ( menuDict에 필터를 걸어서 key 길이가 같은 것들 중에 value가 최댓값이고 2회 이상 주문된 놈들로만.. )
     4. 마지막으로 정렬해서 리턴
 
  어렵다.
 
*/

/*
 
 테스트 1 〉    통과 (6.81ms, 16.6MB)
 테스트 2 〉    통과 (2.40ms, 16.8MB)
 테스트 3 〉    통과 (3.56ms, 16.7MB)
 테스트 4 〉    통과 (4.20ms, 16.6MB)
 테스트 5 〉    통과 (3.64ms, 16.5MB)
 테스트 6 〉    통과 (9.55ms, 16.8MB)
 테스트 7 〉    통과 (12.00ms, 16.8MB)
 테스트 8 〉    통과 (345.05ms, 17.4MB)
 테스트 9 〉    통과 (494.99ms, 17.2MB)
 테스트 10 〉    통과 (3022.37ms, 17MB)
 테스트 11 〉    통과 (931.40ms, 17.2MB)
 테스트 12 〉    통과 (1325.04ms, 17.2MB)
 테스트 13 〉    통과 (2350.39ms, 17.2MB)
 테스트 14 〉    통과 (1265.26ms, 17MB)
 테스트 15 〉    통과 (2840.26ms, 17.2MB)
 테스트 16 〉    통과 (208.53ms, 16.8MB)
 테스트 17 〉    통과 (70.12ms, 16.9MB)
 테스트 18 〉    통과 (19.89ms, 16.8MB)
 테스트 19 〉    통과 (9.67ms, 16.8MB)
 테스트 20 〉    통과 (43.62ms, 16.8MB)
 
*/
