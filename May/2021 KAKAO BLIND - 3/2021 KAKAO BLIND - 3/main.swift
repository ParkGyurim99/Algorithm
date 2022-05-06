//
//  main.swift
//  2021 KAKAO BLIND - 3
//
//  Created by Park Gyurim on 2022/05/05.
//
//  2021 KAKAO BLIND RECRUITMENT : 순위 검색
//  https://programmers.co.kr/learn/courses/30/lessons/72412
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

/*
 func binarySearchForFirstGreaterIndex(searchValue : Int, array : [Int]) -> Int
 : 타겟보다 첫번째로 큰 요소를 갖는 인덱스를 찾아서, 타겟보다 큰 요소의 개수 반환
 
 📌 목표값을 찾는 것과 다르게 left 와 right 가 만나야 종료된다. (be ended when left == right)
    → 타겟보다 커지는 정확한 값 (인덱스) 을 찾아야 하기 떄문 (범위니까)
*/

func binarySearchForFirstGreaterIndex(searchValue : Int, array : [Int]) -> Int {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        
        if array[middleIndex] < searchValue { leftIndex = middleIndex + 1 }
        else { rightIndex = middleIndex - 1 }
    }
    
    return array.count - leftIndex
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var answer : [Int] = []
    var infoDict : [String : [Int]] = [:]
    
    for i in info {
        var temp : [[String]] = []
        var components = i.components(separatedBy: " ")
        let score = Int(components.removeLast())!
        
        Array(0...4).forEach{n in combination(components, n, &temp)}
        temp.forEach {
            if !$0.isEmpty {
                if let _ = infoDict[$0.joined()] { infoDict[$0.joined()]! += [score] }
                else { infoDict[$0.joined()] = [score] }
            } else {
                if let _ = infoDict["-"] { infoDict["-"]! += [score] }
                else { infoDict["-"] = [score] }
            }
        }
    }
    
    infoDict.keys.forEach { key in infoDict[key]!.sort() }
    
    query.forEach { q in
        var temp = q.components(separatedBy: " and ")
        let last = temp.removeLast().components(separatedBy: " ")
        temp.append(last[0])
        let score = Int(last[1])!
        let key = temp.map { $0 == "-" ? "" : $0 }.joined()
        
        if let _ = infoDict[key] {
            answer.append(binarySearchForFirstGreaterIndex(searchValue: score, array: infoDict[key]!))
            
            //answer.append(infoDict[key]!.endIndex - infoDict[key]!.firstIndex{$0 >= score}!)
            //answer.append(infoDict[key]!.filter { $0 >= score }.count)
        } else if key.isEmpty {
            answer.append(binarySearchForFirstGreaterIndex(searchValue: score, array: infoDict["-"]!))
            
            //answer.append(infoDict["-"]!.endIndex - infoDict["-"]!.firstIndex{$0 >= score}!)
            //answer.append(infoDict["-"]!.filter{$0 >= score}.count)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}

/*
struct information {
    var lang : String
    var stack : String
    var exp : String
    var food : String
    var score : Int
    
    func compare(cond : information) -> Bool {
        if self.score < cond.score { return false }
        
        else {
            if !(cond.lang == "-" || cond.lang == self.lang) { return false }
            
            if !(cond.stack == "-" || cond.stack == self.stack) { return false }
            
            if !(cond.exp == "-" || cond.exp == self.exp) { return false }
            
            if !(cond.food == "-" || cond.food == self.food) { return false }
            
            return true
        }
    }
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var answer = Array(repeating: 0, count: query.count)
    
    let queries : [information] = query.map { q in
        var temp = q.components(separatedBy: " and ")
        let last = temp.removeLast()
        temp += last.components(separatedBy: " ")
        return information(lang: temp[0], stack: temp[1], exp: temp[2], food: temp[3], score: Int(temp[4])!)
    }
    
    for i in info {
        let temp = i.components(separatedBy: " ")
        let tempInfo = information(lang: temp[0], stack: temp[1], exp: temp[2], food: temp[3], score: Int(temp[4])!)
        for j in 0..<queries.count {
            answer[j] += tempInfo.compare(cond: queries[j]) ? 1 : 0
        }
    }
    
    return answer
}
*/

print(
    solution(
        ["java backend junior pizza 150",
         "python frontend senior chicken 210",
         "python frontend senior chicken 150",
         "cpp backend senior pizza 260",
         "java backend junior chicken 80",
         "python backend senior chicken 50"],
        ["java and backend and junior and pizza 100",
         "python and frontend and senior and chicken 200",
         "cpp and - and senior and pizza 250",
         "- and backend and senior and - 150",
         "- and - and - and chicken 100",
         "- and - and - and - 150"]
    ),
    "[1, 1, 1, 1, 2, 4]"
)

/*
 
 정확성  테스트
 
 테스트 1 〉     통과 (1.87ms, 16.7MB)
 테스트 2 〉     통과 (1.85ms, 16.7MB)
 테스트 3 〉     통과 (3.46ms, 16.7MB)
 테스트 4 〉     통과 (17.71ms, 16.8MB)
 테스트 5 〉     통과 (21.00ms, 17.2MB)
 테스트 6 〉     통과 (49.57ms, 17.2MB)
 테스트 7 〉     통과 (30.06ms, 17MB)
 테스트 8 〉     통과 (454.36ms, 17.8MB)
 테스트 9 〉     통과 (409.24ms, 18MB)
 테스트 10 〉    통과 (442.44ms, 18.1MB)
 테스트 11 〉    통과 (21.71ms, 17MB)
 테스트 12 〉    통과 (51.89ms, 17MB)
 테스트 13 〉    통과 (31.96ms, 17MB)
 테스트 14 〉    통과 (208.31ms, 17.2MB)
 테스트 15 〉    통과 (208.85ms, 17.4MB)
 테스트 16 〉    통과 (20.81ms, 17MB)
 테스트 17 〉    통과 (50.75ms, 17MB)
 테스트 18 〉    통과 (210.77ms, 17.2MB)
 
 ------------------------------------
 
 효율성  테스트
 
 테스트 1 〉    통과 (6083.51ms, 54.7MB)
 테스트 2 〉    통과 (6213.66ms, 55.2MB)
 테스트 3 〉    통과 (5679.52ms, 55.1MB)
 테스트 4 〉    통과 (5554.00ms, 55.1MB)
 
*/
