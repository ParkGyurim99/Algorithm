//
//  main.swift
//  Kakao2022_5
//
//  Created by Park Gyurim on 2022/03/01.
//

import Foundation

func dfs(status : [Int], cur : Int, info : [Int], vertex : [[Int]]) {
    var infoCopy = info
    var statusCopy = status
    
    let candidate = vertex.filter { $0[0] == cur }
    
    // status update
    if infoCopy[cur] != -1 {
        if infoCopy[cur] == 0 { statusCopy[0] += 1 }
        else { statusCopy[1] += 1 }
        infoCopy[cur] = -1
    }
    
    for c in candidate {
        dfs(status: statusCopy, cur: c[1], info: infoCopy, vertex: vertex)
    }
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {

    dfs(status : [0, 0], cur: 0, info : info, vertex: edges)
    
    return 0
}

_ = solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]])
