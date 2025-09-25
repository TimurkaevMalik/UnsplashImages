import ProjectDescription
import ProjectDescriptionHelpers


let appName = ProjectConstants.appName

let project = Project(
    name: appName,
    settings: .settings(base: baseSettings),
    targets: [
        Targets.appTarget
    ]
)
