//
//  Dependencies.swift
//  Manifests
//
//  Created by Malik Timurkaev on 23.09.2025.
//

import ProjectDescription


public enum SPMDependency {
    static let snapKit = PackageModel(
        name: "SnapKit",
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .version(.init(5, 7, 0))
    )

    // MARK: - My own libraries
    static let coreKit = PackageModel(
        name: "CoreKit",
        url: "https://github.com/TimurkaevMalik/CoreKit.git",
        requirement: .version(.init(2, 0, 0))
    )
    
    static let unspAuthorization = PackageModel(
        name: "UnspAuthorization",
        url: "https://github.com/TimurkaevMalik/UnspAuthorization.git",
        requirement: .branch("master")
    )
}

public struct PackageModel: Sendable {
    public let name: String
    public let url: String
    public let requirement: Requirement
    
    init(name: String, url: String, requirement: Requirement) {
        self.name = name
        self.url = url
        self.requirement = requirement
    }
    
    public enum Requirement: Sendable{
        case version(Version)
        case branch(String)
        
        public var string: String {
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
