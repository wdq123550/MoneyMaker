//
//  MMAutoCodableColumn.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import Foundation
import WCDBSwift

public protocol MMAutoCodableColumn: TableCodable, ColumnCodable, Equatable {}

public extension MMAutoCodableColumn {
    static var columnType: ColumnType {
        return .text
    }

    init?(with value: WCDBSwift.Value) {
        let jsonString = value.stringValue
        guard let data = jsonString.data(using: .utf8),
              let object = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        self = object
    }

    func archivedValue() -> WCDBSwift.Value {
        guard let data = try? JSONEncoder().encode(self),
              let jsonString = String(data: data, encoding: .utf8) else {
            return WCDBSwift.Value(nil)
        }
        return WCDBSwift.Value(jsonString)
    }
}
