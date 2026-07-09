include ':app'

def localPropertiesFile = new File(rootDir, "local.properties")
def properties = new Properties()
properties.load(localPropertiesFile.newDataInputStream())

def flutterSdkPath = properties.getProperty("flutter.sdk")
if (flutterSdkPath == null) {
    throw new GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
}

apply from: "$flutterSdkPath/packages/flutter_tools/gradle/app_plugin_loader.gradle"
