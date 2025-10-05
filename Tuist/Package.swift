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
        SPMDependency.coreKit.name: .framework,
        SPMDependency.snapKit.name: .framework,
        SPMDependency.unspAuthorization.name: .framework
    ]
)
#endif

/// MARK: - Package
let package = Package(
    name: "UnsplashImages",
    dependencies: [
        .make(from: SPMDependency.snapKit),
        .make(from: SPMDependency.coreKit),
        .make(from: SPMDependency.unspAuthorization),
    ]
)


/// MARK: - Dependencies
fileprivate enum SPMDependency {
    static let snapKit = PackageModel(
        name: "SnapKit",
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .version(.init(5, 7, 0))
    )
    
    // MARK: - My libraries
    static let coreKit = PackageModel(
        name: "CoreKit",
        url: "https://github.com/TimurkaevMalik/CoreKit.git",
        requirement: .version(.init(2, 0, 0))
    )
    
    // MARK: - My features
    static let unspAuthorization = PackageModel(
        name: "UnspAuthorization",
        url: "https://github.com/TimurkaevMalik/UnspAuthorization.git",
        requirement: .branch("master")
    )
}

fileprivate struct PackageModel: Sendable {
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

fileprivate extension Version {
    var stringValue: String {
        let major = "\(major)"
        let minor = "\(minor)"
        let patch = "\(patch)"
        
        return major + "." + minor + "." + patch
    }
    
    init(string: String) {
        self.init(stringLiteral: string)
    }
}

fileprivate extension Package.Dependency {
    static func make(from package: PackageModel) -> Package.Dependency {
        let url = package.url
        
        switch package.requirement {
            
        case .version(let value):
                return .package(url: url, from: value)
        case .branch(let name):
                return .package(url: url, branch: name)
        }
    }
}
