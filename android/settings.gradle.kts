pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS) // YE LINE CHANGE KI
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "trimix"
include(":app")
