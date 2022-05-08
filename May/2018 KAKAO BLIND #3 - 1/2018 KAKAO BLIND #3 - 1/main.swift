//
//  main.swift
//  2018 KAKAO BLIND #3 - 1
//
//  Created by Park Gyurim on 2022/05/06.
//
//  2018 KAKAO BLIND RECRUITMENT : [3차] 압축
//  https://programmers.co.kr/learn/courses/30/lessons/17684
//

/*
    압축 전의 정보를 완벽하게 복원 가능한 무손실 압축
 
 📌 LZW 압축은 다음 과정을 거친다.
 
    1. 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
    2. 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
    3. w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
    4. 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
    5. 단계 2로 돌아간다.
 
*/

import Foundation

func solution(_ msg:String) -> [Int] {
    var answer : [Int] = []
    let source : [Character] = Array(msg)

    var lzw : [String : Int] = [:], n = 1
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ".forEach{
        lzw[String($0)] = n
        n += 1
    }

    var lastQuery = ""
    func search(query : String, _ str : [Character], _ i : Int) -> Int {
        print("query :", query)
        lastQuery = query
        if let _ = lzw[query] {
            if let first = str.first {
                print("recursivce call :", "\(query)\(first)", "<-", str)
                return search(query: query + "\(first)", Array(str.suffix(from: 1)), i) + 1
            } else { return 1 }
        } else {
            //print("push :", query, lzw[query], n)
            lzw[query] = n
            var temp = query; temp.removeLast()
            if let val = lzw[temp] {
                //print("append", val)
                answer.append(val)
            }
            n += 1
            return i
        }
    }

    var i = 0
    while i < source.count {
        let k = search(query: "\(source[i])", Array(source.suffix(from: i + 1)), 0)
        i += k

        if i == (source.count - 1) {
            answer.append(lzw["\(source[i])"]!)
            i += 1
        } else if i >= source.count {
            answer.append(lzw[lastQuery]!)
        }
    }
    //lzw.sorted(by: { $0.value > $1.value }).filter{$0.value > 26}.forEach { print($0.key, $0.value) }

    return answer
}

print(solution("KAKAO"), [11, 1, 27, 15])
print("", solution("TOBEORNOTTOBEORTOBEORNOT"), "\n",[20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34])
print(solution("ABABABABABABABAB"), "\n", [1, 2, 27, 29, 28, 31, 30])

/*
 
 정확성  테스트
 
 테스트 1 〉     통과 (0.09ms, 16.3MB)
 테스트 2 〉     통과 (0.14ms, 16.3MB)
 테스트 3 〉     통과 (0.15ms, 16.5MB)
 테스트 4 〉     통과 (1.62ms, 16.7MB)
 테스트 5 〉     통과 (0.19ms, 16.7MB)
 테스트 6 〉     통과 (5.61ms, 16.5MB)
 테스트 7 〉     통과 (7.08ms, 16.8MB)
 테스트 8 〉     통과 (5.01ms, 16.8MB)
 테스트 9 〉     통과 (0.07ms, 16.2MB)
 테스트 10 〉    통과 (7.73ms, 16.5MB)
 테스트 11 〉    통과 (1.77ms, 16.4MB)
 테스트 12 〉    통과 (5.49ms, 16.6MB)
 테스트 13 〉    통과 (6.60ms, 16.7MB)
 테스트 14 〉    통과 (7.67ms, 16.7MB)
 테스트 15 〉    통과 (8.87ms, 16.6MB)
 테스트 16 〉    통과 (4.12ms, 16.6MB)
 테스트 17 〉    통과 (4.81ms, 16.6MB)
 테스트 18 〉    통과 (0.98ms, 16.6MB)
 테스트 19 〉    통과 (1.88ms, 16.5MB)
 테스트 20 〉    통과 (3.45ms, 16.4MB)

*/
