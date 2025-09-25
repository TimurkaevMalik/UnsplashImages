// swift-tools-version: 6.0
import PackageDescription


///MARK: - PackageSettings
#if TUIST
import struct ProjectDescription.PackageSettings
import enum ProjectDescription.Product
import enum ProjectDescription.Environment
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        Dependencies.fontsPackage.name: resolvedFramework()
    ]
)
#endif

/// MARK: - Package
let package = Package(
    name: "UnsplashImages",
    dependencies: [
        .package(url: Dependencies.fontsPackage.url,
                 branch: Dependencies.fontsPackage.requirement.string)
    ]
)

/// MARK: - Dependencies
struct Dependencies {
    
    static let fontsPackage = PackageModel(
        name: "FontsPackage",
        url: "https://github.com/TimurkaevMalik/FontsPackage.git",
        requirement: .branch("main")
    )
}

struct PackageModel: Sendable {
    let name: String
    let url: String
    let requirement: Requirement
    
    init(name: String, url: String, requirement: Requirement) {
        self.name = name
        self.url = url
        self.requirement = requirement
    }
    
    public enum Requirement: Sendable{
        case version(Version)
        case branch(String)
        
        var string: String {
            switch self {
                
            case .version(let version):
                return version.stringValue
                
            case .branch(let string):
                return string
            }
        }
    }
}

extension Version {
    var stringValue: String {
        let major = "\(major)"
        let minor = "\(minor)"
        let patch = "\(patch)"
        
        return major + "." + minor + "." + patch
    }
}
