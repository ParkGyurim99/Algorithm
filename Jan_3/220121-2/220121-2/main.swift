//
//  main.swift
//  220121-2
//
//  Created by Park Gyurim on 2022/01/21.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var result : [String] = []
    var commands : [[Substring]] = []
    var users : [String : String] = [:]

    for str in record { commands.append(str.split(separator: " ")) }
    
    for str in commands {
        if str.count > 2 { users[String(str[1])] = String(str[2]) }
    }
    
    for cmd in commands {
        if cmd[0] == "Change" { continue }
        switch String(cmd[0]) {
            case "Enter" : result.append(users[String(cmd[1])]! + "님이 들어왔습니다.")
            case "Leave" : result.append(users[String(cmd[1])]! + "님이 나갔습니다.")
            default: print("")
        }
    }
    
    return result
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
