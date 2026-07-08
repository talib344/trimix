buildscript {
    val kotlin_version by extra("1.9.24")
    dependencies {
        classpath("com.android.tools.build:gradle:8.5.2")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version")
    }
}

// repositories yahan se hata diye - ab sirf settings.gradle.kts dega
allprojects {
    // khaali chhod do
}

rootProject.layout.buildDirectory.set(file("../build"))

subprojects {
    layout.buildDirectory.set(rootProject.layout.buildDirectory.dir(name))
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
