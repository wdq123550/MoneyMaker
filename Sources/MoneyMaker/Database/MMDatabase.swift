//
//  MMDatabase.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

public struct MMDatabase{
    
    //MARK: - private
    static private var isTrace: Bool = false//标识是否已经监控错误信息
    static private var database: Database?//全局db
    
    
    //MARK: - public
    /// 初始化数据库(为避免多线程重复调用引起的初始化失败，请在主线程调用此方法，如初始化失败会在控制台打印相关错误信息)
    /// - Parameters:
    ///   - databaseFileURL: db所在的沙盒目录，要长这样的URL:file:///Users/Zhuanz/Library/Developer/CoreSimulator/Devices/695B4915-F0A3-48CB-BD63-A27F891C2B72/data/Library/PreferencePanes/mmdb.db
    ///   - databasePassword: eg: "password".data(using: .ascii) 是否加密数据库，请注意，当你第一次没有加密数据库，同一个DB再也无法加密。请谨慎选择，建议早加密早安心.
    ///   - isTrace: 是否追踪错误信息
    @MainActor public static func setupDatabase(databaseFileURL: URL,
                                                databasePassword: Data?,
                                                isTrace: Bool)
    {
        if isTrace {
            //全局监控
            if self.isTrace == false {
                Database.globalTraceError { print($0) }
                self.isTrace = true
            }
        }
        //如果已经初始化过了就返回
        if self.database != nil { return }
        //根据传进来的DB路径创建DB
        let database = Database(at: databaseFileURL)
        //是否加密
        if let password = databasePassword {
            database.setCipher(key: password)
        }
        //强引用
        self.database = database
    }
    
    /// 取DB
    /// - Parameter type: 遵守了TableDecodable协议的类型
    /// - Returns: Database
    public static func database(with type: any TableDecodable.Type) -> Database {
        if let database = self.database {
            //表名
            let table = String(describing: type)
            //建表(已经建了表的不会重新建表)
            try? database.create(table: table, of: type)
            //返回
            return database
        }else{
            fatalError("哥们，你DB没初始化")
        }
    }
}
