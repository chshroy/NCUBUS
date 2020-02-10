//
//  Responses.swift
//  NCUBUS
//
//  Created by royyaha on 08.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import Foundation

struct RoutesResponse {
    let routes: [Route]
}

struct Route {
    let uid: String
    let direction: Int  // 去返程[0:'去程',1:'返程',2:'迴圈',255:'未知'].
    let stops: [Stop]
    let name: [String : String]
    #if DEBUG
    static let example: Route = Route(uid: "UID", direction: 1, stops: [Stop.example1, Stop.example2, Stop.example3, Stop.example4, Stop.example5, Stop.example6, Stop.example7, Stop.example8, Stop.example9, Stop.example10, Stop.example11, Stop.example12, Stop.example13, Stop.example14, Stop.example15, Stop.example16, Stop.example17], name: ["en":"132","zh_tw":"132"])
    #endif
    
}


struct Stop {
    let uid: String
    let latitude: Double
    let longitude: Double
    let sequence: Int
    let boarding: Int  // 上下車站別 : [-1:'可下車',0:'可上下車',1:'可上車']
    let name: [String : String]   // 站牌名稱
    
    #if DEBUG
    static let example1: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"中壢公車站"])
    static let example2: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"第一銀行"])
    static let example3: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"第一市場"])
    static let example4: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"河川教育中心"])
    static let example5: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"舊社"])
    static let example6: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"新明國中"])
    static let example7: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"廣興"])
    static let example8: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"仁愛新村"])
    static let example9: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"青果市場"])
    static let example10: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"五權"])
    static let example11: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"佑民醫院"])
    static let example12: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"高雙里"])
    static let example13: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"三民五興路口"])
    static let example14: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"土地公廟"])
    static let example15: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"三民中正路口"])
    static let example16: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"中央大學正門"])
    static let example17: Stop = Stop(uid: "uid", latitude: 12, longitude: 12.0, sequence: 1, boarding: 0, name: ["en":"Taiwan","zh_tw":"中央大學警衛室"])
    #endif
}
