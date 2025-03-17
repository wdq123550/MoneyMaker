import Testing
@testable import MoneyMaker

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    
    
}


//eg:
//private lazy var titleLabel: MMLabel = {
//    let label = MMLabel(
//        .font(FontSystem(size: 14, weight: .regular)),
//        .textColor(.black),
//        .textAlignment(.left),
//        .text("标题"),
//        .bgColor(.clear),
//        .layerSet(.init(cornerRadius: 10, borderWidth: 20, borderColor: nil)),
//        .numberOfLine(1),
//        .lineBreakMode(.byTruncatingTail)
//    )
//    self.<#view#>.addSubview(label)
//    label.snp.makeConstraints { make in
//        make.center.equalToSuperview()
//    }
//    return label
//}()

//func databaseTest() {
//    let dbFileURL = preferencesDirectory?.appendingPathComponent("mmdbv.db", conformingTo: .database)
//    print(dbFileURL!)
//    let password = "password".data(using: .ascii)
//    
//    await MMDatabase.setupDatabase(databaseFileURL: dbFileURL!, databasePassword: password, isTrace: true)
//    
//    let model = MMDatabaseSmaple(phone: "123")
//    let result = model.insert()
//    print(result)
//    
//    print(MMDatabaseSmaple.delete())
//    print("gg")
//}
