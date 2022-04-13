//
//  main.swift
//  220316_1
//
//  Created by Park Gyurim on 2022/03/16.
//

import Foundation

// 모의고사 - 그리디
// https://programmers.co.kr/learn/courses/30/lessons/42840
//
//func solution(_ answers:[Int]) -> [Int] {
//    var answer : [Int] = []
//    let student1 : [Int] = [1,2,3,4,5]
//    let student2 : [Int] = [2,1,2,3,2,4,2,5]
//    let student3 : [Int] = [3,3,1,1,2,2,4,4,5,5]
//    var grade : [Int] = Array(repeating: 0, count: 3)
//
//    for index in answers.indices {
//        grade[0] += answers[index] == student1[index % student1.count] ? 1 : 0
//        grade[1] += answers[index] == student2[index % student1.count] ? 1 : 0
//        grade[2] += answers[index] == student3[index % student1.count] ? 1 : 0
//    }
//
//    for index in grade.indices { if grade[index] == grade.max() { answer.append(index + 1) } }
//
//    print(grade)
//    print(answer)
//
//    return answer
//}
//
//_ = solution([1,2,3,4,5,1,2,3,2,1])
//_ = solution([1,3,2,4,2])


// 음양 더하기
// https://programmers.co.kr/learn/courses/30/lessons/76501
//
//func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
//    var result = 0
//    for index in absolutes.indices { result += signs[index] ? absolutes[index] : -absolutes[index] }
//    return result
//}
//
//print(solution([4, 7, 12], [true, false, true]))
//print(solution([1,2,3], [false, false, true]))


// 약수의 개수와 덧셈
// https://programmers.co.kr/learn/courses/30/lessons/77884

//func getDivisorNum(_ n : Int) -> Int {
//    var count = 0
//    for i in 1...n { count += n % i == 0 ? 1 : 0 }
//    return count
//}
//
//func solution(_ left:Int, _ right:Int) -> Int {
//    var result = 0
//    for n in left...right { result += getDivisorNum(n) % 2 == 0 ? n : -n }
//
//    return result
//}
//
//print(solution(13,17)) // 43
//print(solution(24,27)) // 52

//var arr = [1,2,3,4]
//print(arr.reduce(0,+))

// 2016년
// https://programmers.co.kr/learn/courses/30/lessons/12901
// 2016.1.1. -> Fri.

func solution(_ a:Int, _ b:Int) -> String {
    let weekday = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let monthDay = [1:31, 2:29, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31]
    var day = b
    for i in 1..<a { day += monthDay[i]! }
    return weekday[(day + 4) % 7]
}

print(solution(5, 24))
