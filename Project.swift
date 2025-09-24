import ProjectDescription
import ProjectDescriptionHelpers


let appName = ProjectConstants.appName
let bundleID = ProjectConstants.bundleID

let project = Project(
    name: appName,
    settings: .settings(base: baseSettings),
    targets: [
        .target(
            name: appName,
            destinations: .iOS,
            product: .app,
            bundleId: bundleID,
            infoPlist: .extendingDefault(
                with: [
                    applicationSceneManifest: .dictionary(defaultSceneManifest),
                    launchStoryboardName: .string("LaunchScreen")
                ]),
            buildableFolders: [
                BuildableFolder(stringLiteral: "\(appName)/Sources"),
                BuildableFolder(stringLiteral: "\(appName)/Resources")
            ],
            dependencies: [
                .external(name: Dependencies.fontsPackage.name)
            ],
            settings: .settings(base: baseSettings),
        ),
    ]
)
