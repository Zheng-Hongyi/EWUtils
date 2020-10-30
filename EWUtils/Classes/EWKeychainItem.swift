//
//  EWKeychainItem.swift
//  DeclarePlus
//
//  Created by Hongyi Zheng on 2018/9/14.
//  Copyright © 2018年 Hongyi Zheng. All rights reserved.
//

import Foundation

public struct EWKeychainItem {
    
    enum KeychainError: Error {
        case noInfo
        case unexpectedData
        case unhandledError(status: OSStatus)
    }
    
    private let cacheTag: String
    
    public init(aTag: String) {
        self.cacheTag = aTag
    }
    
    public func readInfo() throws -> String {
        var query = EWKeychainItem.keyChainQuery(withTag: cacheTag)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecReturnData as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        guard status != errSecItemNotFound else {
            throw KeychainError.noInfo
        }
        guard status == noErr else {
            throw KeychainError.unhandledError(status: status)
        }
        guard let existingItem = queryResult as? [String: AnyObject], let deviceIdData = existingItem[kSecValueData as String] as? Data, let deviceId = String(data: deviceIdData, encoding: .utf8)  else {
            throw KeychainError.unexpectedData
        }
        return deviceId
    }
    
    public func saveInfo(_ tmpInfo: String) throws -> Bool {
        let encodeDeviceId = tmpInfo.data(using: .utf8)!
        do {
            try _ = readInfo()
            var attributesToUpdate = [String: AnyObject] ()
            attributesToUpdate[kSecValueData as String] = encodeDeviceId as AnyObject?
            let query = EWKeychainItem.keyChainQuery(withTag: cacheTag)
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            guard status == noErr else {
                throw KeychainError.unhandledError(status: status)
            }
            return true
        } catch KeychainError.noInfo {
            var newItem = EWKeychainItem.keyChainQuery(withTag: cacheTag)
            newItem[kSecValueData as String] = encodeDeviceId as AnyObject?
            let status = SecItemAdd(newItem as CFDictionary, nil)
            guard status == noErr else {
                throw KeychainError.unhandledError(status: status)
            }
            return true
        }
    }
    
    private static func keyChainQuery(withTag aTag: String) -> [String : AnyObject] {
        var query = [String: AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrAccount as String] = aTag as AnyObject
        return query
    }
    
}
