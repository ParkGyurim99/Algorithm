//
//  main.swift
//  Kakao2022_4
//
//  Created by Park Gyurim on 2022/03/01.
//

import Foundation

func calculateScore(shoot1 : [Int], shoot2 : [Int]) -> [Int] {
    var score1 = 0 // 라이언
    var score2 = 0 // 어피치
    
    for i in 0..<shoot1.count {
        if shoot1[i] > shoot2[i] { score1 += 10-i }
        else { if shoot2[i] > 0 { score2 += 10-i } }
    }
    
    return [score1, score2]
}

func search(source : [Int], sourceMine : [Int], n : Int) -> [[Int]] {
    var result : [[Int]] = []
    
    func dfs(index : Int, arr : [Int], remain : Int) {
        if remain <= 0 { // 화살을 다 쏜 경우
            result.append(arr)
            return
        } else if index == 11 { // 화살을 다 못쏜 상태
            var temp = arr
            temp[index - 1] = remain
            result.append(temp)
            return
        }
        
        // 지금 index 점수 포기
        dfs(index: index + 1, arr: arr, remain : remain)
        
        // 지금 index 점수 얻기
        if remain > source[index] {
            var tempArr = arr
            tempArr[index] = source[index] + 1
            dfs(index: index + 1, arr: tempArr, remain : remain - (source[index] + 1))
        } else {
            var tempArr = arr
            tempArr[index] = remain
            dfs(index: index + 1, arr: tempArr, remain : 0)
        }
    }
    
    dfs(index: 0, arr: sourceMine, remain: n)
    print(result.count)

    return result.filter {
        let score = calculateScore(shoot1: $0, shoot2: source)
        return score[0] > score[1]
    }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let candidate = search(source: info, sourceMine: Array(repeating: 0, count: 11), n: n)
    if candidate.isEmpty { return [-1] }
    
    var max = 0
    var maxIndex = -1
    
    for i in 0..<candidate.count {
        let score = calculateScore(shoot1: candidate[i], shoot2: info)
        let diff = score[0] - score[1]
        if diff > max {
            max = diff
            maxIndex = i
        } else if diff == max {
            for j in (0..<11).reversed() {
                if candidate[maxIndex][j] == candidate[i][j] { continue }
                else {
                    if candidate[maxIndex][j] < candidate[i][j] { maxIndex = i }
                    break
                }
            }
        }
        
        //print(calculateScore(shoot1: candidate[i], shoot2: info), candidate[i], info)
    }

    for arr in candidate {
        let score = calculateScore(shoot1: arr, shoot2: info)
        let diff = score[0] - score[1]
        if diff == max {
            print(arr)
        }
        //print(calculateScore(shoot1: candidate[i], shoot2: info), candidate[i], info)
    }

    print(max, candidate[maxIndex])
    
    return candidate[maxIndex]
}

//solution(5, [2,1,1,1,0,0,0,0,0,0,0])
//solution(1, [1,0,0,0,0,0,0,0,0,0,0])
solution(9, [0,0,1,2,0,1,1,1,1,1,1])
//solution(10, [0,0,0,0,0,0,0,0,3,4,3])


var arr1 = [1, 1, 2, 0, 1, 2, 2, 0, 0, 0, 0]
var arr2 = [1, 1, 2, 3, 0, 2, 0, 0, 0, 0, 0]

for j in (0..<11).reversed() {
    if arr1[j] == arr2[j] { continue }
    else {
        if arr1[j] < arr2[j] {
            print("--", arr2)
        } else {
            print("--", arr1)
        }
        break
    }
}
