//
//  MMDatabase.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import Foundation
import WCDBSwift

public final class MMDatabase{
    
    static var isTrace: Bool = false//标识是否已经监控错误信息
    
    /// 取DB
    /// - Parameter type: 遵守了TableDecodable协议的类型
    /// - Returns: Database
    static func database(with type: any TableDecodable.Type) -> Database {
        //全局监控
        if !isTrace {
            Database.globalTraceError { error in
                print(error)
            }
            isTrace = true
        }
        //db所在目录
        let dbFileURL = preferencesDirectory?.appendingPathComponent("MMDB.db", conformingTo: .database)
        //创建db
        let database = Database(at: dbFileURL!)
        //加密db
        database.setCipher(key: "EverythingWillBeAllRight".data(using: .ascii))
        //表名
        let table = String(describing: type)
        //建表
        try? database.create(table: table, of: type)
        //返回
        return database
    }
}
