// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "TaskManager",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .executable(
            name: "TaskManager",
            targets: ["TaskManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0")
    ],
    targets: [
        .executableTarget(
            name: "TaskManager",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk")
            ],
            path: "TaskManager"),
        .testTarget(
            name: "TaskManagerTests",
            dependencies: ["TaskManager"]),
    ]
) 