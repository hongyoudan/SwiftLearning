//
//  PreferenceUtils.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/21.
//

import Foundation

class PreferenceUtils {
    
    // 获取用户信息
    static func getUserInfo() -> UserInfo? {
        let userDefaults = UserDefaults.standard
        let userInfo = userDefaults.object(forKey: ConstantsUtils.USER_INFO_KEY) as? [String: Any]
        if userInfo == nil {
            return nil
        }
        return UserInfo(userInfo!)
    }
    
    // 保存用户信息
    static func saveUserInfo(userInfo: UserInfo) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(userInfo.toDictionary(), forKey: ConstantsUtils.USER_INFO_KEY)
    }
    
    // 删除用户信息
    static func removeUserInfo() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: ConstantsUtils.USER_INFO_KEY)
    }
    
    // 获取用户手机号
    static func getUserMobile() -> String? {
        let userInfo = getUserInfo()
        if userInfo == nil {
            return nil
        }
        return userInfo!.mobile
    }
    
    // 校验是否登录
    static func checkIsLogin() -> Bool {
        let userInfo = getUserInfo()
        if userInfo == nil {
            return false
        }
        return true
    }
}
