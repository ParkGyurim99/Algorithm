//
//  main.swift
//  Kakao2022_3
//
//  Created by Park Gyurim on 2022/03/01.
//

import Foundation

// fees : 기본 시간, 기본 요금, 단위 시간, 단위 요금

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result : [Int] = []
    var feeDic : [String : Int] = [:] // 차량 별 요금 저장 , 차량 번호 : 요금
    var parkingLot : [String : String] = [:] // 현재 주차장에 있는 경우 , 차량 번호 : 시간
    
    for record in records {
        let temp = record.components(separatedBy: " ")
//        print(temp)
        
        // 요금 계산 - 나가는 경우
        if let previousValue = parkingLot[temp[1]] {
            //print(previousValue, temp[0])
            let min = calculateMinutes(pre: previousValue, cur: temp[0])
            
            if let _ = feeDic[temp[1]] { feeDic[temp[1]]! += min }
            else { feeDic[temp[1]] = min }
            
            parkingLot[temp[1]] = nil
        } else { // 들어오는 경우
            parkingLot[temp[1]] = temp[0]
        }
    }
    
    // 주차장에 남아있는 것 처리
    for car in parkingLot {
        let min = calculateMinutes(pre: car.value, cur: "23:59")
        
        if let _ = feeDic[car.key] { feeDic[car.key]! += min }
        else { feeDic[car.key] = min }
        
        parkingLot[car.key] = nil
    }
    
    print(feeDic)
    for carNum in feeDic.keys.sorted() {
        let minute = feeDic[carNum]! - fees[0]
        
        if minute < 0 { result.append(fees[1]) }
        else {
            if minute % fees[2] == 0 { result.append(fees[1] + (minute / fees[2]) * fees[3]) }
            else { result.append(fees[1] + ((minute / fees[2]) + 1) * fees[3]) }
        }
    }
    
    return result
}

func calculateMinutes(pre : String, cur : String) -> Int {
    let previous = pre.components(separatedBy: ":")
    let current = cur.components(separatedBy: ":")
    let hour = Int(current[0])! - Int(previous[0])!
    let min = Int(current[1])! - Int(previous[1])!
   
    return hour*60 + min
}


print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
//solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"])
//solution([1, 461, 1, 10], ["00:00 1234 IN"])
