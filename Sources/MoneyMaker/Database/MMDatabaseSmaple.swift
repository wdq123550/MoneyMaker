//
//  MMDatabaseSmaple.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//  这是一个例子，可供参考


////sub model
//struct MMPianoModel: MMAutoCodableColumn {
//    
//    var imageNames: [String] //第一张为主图
//    var price: Double //价格
//    var title: String //有简介
//    
//    enum CodingKeys: String, CodingTableKey {
//        typealias Root = MMPianoModel
//        static let objectRelationalMapping = TableBinding(CodingKeys.self)
//        case imageNames
//        case price
//        case title
//    }
//}
//
////main model
//struct MMDatabaseSmaple: MMAutoCodableColumn {
//    var phone: String
//    var collectionPiaos = [MMPianoModel]()
//    
//    enum CodingKeys: String, CodingTableKey {
//        typealias Root = MMDatabaseSmaple
//        static let objectRelationalMapping = TableBinding(CodingKeys.self)
//        case phone
//        case collectionPiaos
//    }
//    
//    //增
//    func insert() -> Bool {
//        let gg = String(describing: type(of: self))
//        print(gg)
//        do {
//            try MMDatabase.database(with: type(of: self)).insert(self, intoTable: String(describing: type(of: self)))
//            return true
//        } catch let error {
//            print(error)
//            return false
//        }
//    }
//    //删
//    static func delete() -> Bool {
//        do {
//            try MMDatabase.database(with: self).delete(fromTable: String(describing: self))
//            return true
//        } catch let error {
//            print(error)
//            return false
//        }
//    }
//    //改
//    func update() -> Bool {
//        do {
//            try MMDatabase.database(with: type(of: self)).update(table: String(describing: type(of: self)), on: Self.Properties.all, with: self)
//            return true
//        } catch let error {
//            print(error)
//            return false
//        }
//    }
//    //查
//    static func getModel() -> MMDatabaseSmaple?{
//        let model: MMDatabaseSmaple? = try? MMDatabase.database(with: self).getObject(on: Self.Properties.all, fromTable: String(describing: self))
//        return model
//    }
//}
