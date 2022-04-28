//
//  main.swift
//  220428_5
//
//  Created by Park Gyurim on 2022/04/28.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    let uppercasedAlphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let lowercasedAlphabet = uppercasedAlphabet.map { $0.lowercased() }

    return s.map { c -> String in
        let temp = String(c)
        if uppercasedAlphabet.contains(temp) {
            return uppercasedAlphabet[(uppercasedAlphabet.firstIndex(of: temp)! + n) % uppercasedAlphabet.count]
        } else if temp == " " {
            return temp
        } else {
            return lowercasedAlphabet[(lowercasedAlphabet.firstIndex(of: temp)! + n) % lowercasedAlphabet.count]
        }
    }.joined()
}

print(solution("AB", 1))
print(solution("z", 1))
print(solution("a B z", 4))
