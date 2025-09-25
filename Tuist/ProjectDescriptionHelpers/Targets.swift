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
        buildableFolders: [
            BuildableFolder(stringLiteral: "\(ProjectConstants.appName)/Sources"),
            BuildableFolder(stringLiteral: "\(ProjectConstants.appName)/Resources")
        ],
        dependencies: [
            .external(name: Dependencies.fontsPackage.name)
        ],
        settings: .settings(base: baseSettings),
    )
}
