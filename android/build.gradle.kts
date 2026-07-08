buildscript {
    val kotlin_version by extra("1.9.24")
    repositories {  // <-- ye wapis daal diye
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.5.2")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version")
    }
}

// allprojects me repositories nahi chahiye kyunke settings.gradle.kts de raha hai
allprojects {}

rootProject.layout.buildDirectory.set(file("../build"))

subprojects {
    layout.buildDirectory.set(rootProject.layout.buildDirectory.dir(name))
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
