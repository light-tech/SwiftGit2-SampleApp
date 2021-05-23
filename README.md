LibGit2-SwiftGit2 Sample App
============================

Before building, run
```shell
./setup.sh
```
to download our [prebuilt frameworks](https://github.com/light-tech/LibGit2-On-iOS/releases) and the SwiftGit2 source code. Also, please correct the hard-coded paths
```swift
struct ContentView: View {
    let localRepoLocation = "file:///Volumes/Data/Temp/BigMac"
    let remoteRepoLocation = "https://github.com/light-tech/BigMac.git"
}
```
according to your system.

Note that our sample app was 'hacked' to work on Mac Catalyst, namely by disabling security sandbox (see `com.apple.security.app-sandbox` in `SampleApp/SampleApp.entitlements`) so that we can access git repository outside of the app's security sandboxed location.
If you want the app to work on iOS, you need to change the path to an appropriate location, for example, inside the app's Document directory.
