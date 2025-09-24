// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

func resolvedProduct() -> ProjectDescription.Product {
    if case let .string(v) = Environment.productType {
        switch v.lowercased() {
        case "static", "static-framework", "staticframework":
            return .staticFramework
        case "framework", "dynamic", "dynamic-framework":
            return .framework
        default:
            return .framework
        }
    }
    return .framework
}

let packageSettings = PackageSettings(
    productTypes: [
        Dependencies.fontsPackage.name: resolvedProduct()
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
