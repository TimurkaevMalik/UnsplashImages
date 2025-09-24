// swift-tools-version: 6.0
import PackageDescription
import ProjectDescriptionHelpers

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: [
        Dependencies.fontsPackage.name: .framework
    ]
)
#endif

let package = Package(
    name: "UnsplashImages",
    dependencies: [
        .package(url: Dependencies.fontsPackage.url,
                 branch: Dependencies.fontsPackage.requirement.string)
    ]
)
