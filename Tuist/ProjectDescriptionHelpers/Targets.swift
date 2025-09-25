//
//  Targets.swift
//  Manifests
//
//  Created by Malik Timurkaev on 25.09.2025.
//

import ProjectDescription


public enum Targets {
    public static let appTarget = Target.target(
        name: ProjectConstants.appName,
        destinations: .iOS,
        product: .app,
        bundleId: ProjectConstants.bundleID,
        infoPlist: .extendingDefault(
            with: [
                applicationSceneManifest: .dictionary(defaultSceneManifest),
                launchStoryboardName: .string("LaunchScreen")
            ]),
        sources: [Source.appSources],
        resources: [Resource.appResources],
        dependencies: [.external(name: SPMDependency.fontsPackage.name)],
        settings: .settings(base: BuildFlags.base),
    )
}

/// MARK: - Helpers
fileprivate enum Source {
    typealias SourceLiteral = SourceFilesList.ArrayLiteralElement
    
    static let appSources: SourceLiteral = "\(ProjectConstants.appName)/Sources/**"
}

fileprivate enum Resource {
    typealias ResourceLiteral = ResourceFileElements.ArrayLiteralElement
    
    static let appResources: ResourceLiteral = "\(ProjectConstants.appName)/Resources/**"
}
