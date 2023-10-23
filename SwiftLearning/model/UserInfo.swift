//
//  UserInfo.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/21.
//

import Foundation

class UserInfo {
    
    var mobile: String
    // 可以添加其他用户信息字段
    
    init(mobile: String) {
        self.mobile = mobile
        // 初始化其他用户信息字段
    }
    
    // 如果需要将用户信息转化为字典以便存储到 UserDefaults 中
    func toDictionary() -> [String: Any] {
        return [
            "mobile": mobile
            // 添加其他字段到字典
        ]
    }
    
    // 如果需要初始化用户信息对象从字典中
    init(_ dictionary: [String: Any]) {
        mobile = dictionary["mobile"] as? String ?? ""
        // 初始化其他字段从字典中
    }
}
