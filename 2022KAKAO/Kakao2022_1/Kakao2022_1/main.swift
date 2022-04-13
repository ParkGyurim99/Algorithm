//
//  main.swift
//  Kakao2022_1
//
//  Created by Park Gyurim on 2022/03/01.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result : [Int] = []
    var reportDic : [String : Set<String>] = [:]
    id_list.forEach { reportDic[$0] = [] }
    var idListDic : [String : Int] = [:]
    id_list.forEach { idListDic[$0] = 0 }
    
    for rpt in report {
        let temp = rpt.components(separatedBy: " ")
        reportDic[temp[0]]!.insert(temp[1])
    }
    
    var reportedIdList : [String : Int] = [:]
    for (key,value) in reportDic {
        value.map {
            if let _ = reportedIdList[$0] { reportedIdList[$0]! += 1 }
            else { reportedIdList[$0] = 1 }
        }
    }
    
    reportedIdList = reportedIdList.filter { (key, value) in value >= k }
    var idToProcess = Set(reportedIdList.keys)
   
    print("----")
    for id in id_list {
        result.append(reportDic[id]!.intersection(idToProcess).count)
    }
    print("----")
    print(reportDic)
    print(reportedIdList)
    print(idListDic)
//
  
    return result
}


print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
