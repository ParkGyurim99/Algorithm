//
//  main.swift
//  220325_1
//
//  Created by Park Gyurim on 2022/03/25.
//

import Foundation

func solution(_ s:String) -> Bool {
    let source = s.map { String($0) }
    var need = 0
    
    if source.count % 2 != 0 { return false }
    
    for src in source {
        if src == "(" { need += 1 }
        else if src == ")" { need -= 1 }
        
        if need < 0 { break }
    }
    
    return need == 0
}

print(solution("()()"))
print(solution("(())()"))
print(solution(")()("))
print(solution("(()("))
