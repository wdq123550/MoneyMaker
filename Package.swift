// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoneyMaker",
    platforms: [.iOS(.v15)],
    products: [.library(name: "MoneyMaker", targets: ["MoneyMaker"])],
    dependencies: [
        .package(url: "https://github.com/thii/SwiftHEXColors", from: "1.4.1"),
        .package(url: "https://github.com/JonasGessner/JGProgressHUD", from: "2.2.0"),
        .package(url: "https://github.com/SVProgressHUD/SVProgressHUD", from: "2.3.1"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
        .package(url: "https://github.com/bogdanmatasaru/KLCPopupSPM", branch: "main"),
        .package(url: "https://github.com/CoderMJLee/MJRefresh", from: "3.7.9"),
        .package(url: "https://github.com/Tencent/wcdb", from: "2.1.10"),
        .package(url: "https://github.com/ruslanskorb/RSKGrowingTextView", from: "8.0.1"),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager", from: "6.5.0"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveCocoa", from: "12.0.0"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift", from: "7.2.0"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.10.2"),
        .package(url: "https://github.com/intsig171/SmartCodable", from: "4.3.0")
    ],
    targets: [
        .target(
            name: "MoneyMaker",
            dependencies: [
                .product(name: "SwiftHEXColors", package: "SwiftHEXColors"),
                .product(name: "JGProgressHUD", package: "JGProgressHUD"),
                .product(name: "SVProgressHUD", package: "SVProgressHUD"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "KLCPopup", package: "KLCPopupSPM"),
                .product(name: "MJRefresh", package: "MJRefresh"),
                .product(name: "WCDBSwift", package: "wcdb"),
                .product(name: "RSKGrowingTextView", package: "RSKGrowingTextView"),
                .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
                .product(name: "ReactiveSwift", package: "reactiveswift"),
                .product(name: "ReactiveCocoa", package: "ReactiveCocoa"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SmartCodable", package: "SmartCodable")
            ]
        ),
        .testTarget(
            name: "MoneyMakerTests",
            dependencies: ["MoneyMaker"]
        )
    ]
)
