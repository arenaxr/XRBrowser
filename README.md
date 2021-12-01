XR Browser
===============

This project is forked from Mozilla's WebXR Viewer. [WebXR Viewer](https://apps.apple.com/us/app/webxr-viewer/id1295998056) is an iOS WebXR browser available on the App Store. XR Browser will soon be available on the App Store.

This branch (WebXR-iOS-14.5)
-----------

This branch only works with Xcode 12.5.1, Swift 5, and iOS 12.0+.

Please make sure you aim your pull requests in the right direction.

Getting involved
----------------

Want to contribute but don't know where to start? Check out any open issues. Or submit an issue for a problem you're having.

Building the code
-----------------

1. Install Xcode 12.5.1 from Apple
1. Install Carthage and Node
    ```shell
    brew update
    brew install carthage
    brew install node
    ```
1. Clone the repository:
    ```shell
    git clone https://github.com/conix-center/XRBrowser
    ```
1. Pull in the project dependencies:
    ```shell
    cd WebXR-iOS
    sh ./bootstrap.sh
    ```
1. Open `Client.xcodeproj` in Xcode.
1. Build the `XRViewer` scheme in Xcode.

## Building User Scripts

User Scripts (JavaScript injected into the `WKWebView`) are compiled, concatenated and minified using [webpack](https://webpack.js.org/). User Scripts to be aggregated are placed in the following directories:

```
/Client
|-- /Frontend
    |-- /UserContent
        |-- /UserScripts
            |-- /AllFrames
            |   |-- /AtDocumentEnd
            |   |-- /AtDocumentStart
            |-- /MainFrame
                |-- /AtDocumentEnd
                |-- /AtDocumentStart
```

This reduces the total possible number of User Scripts down to four. The compiled output from concatenating and minifying the User Scripts placed in these folders resides in `/Client/Assets` and are named accordingly:

* `AllFramesAtDocumentEnd.js`
* `AllFramesAtDocumentStart.js`
* `MainFrameAtDocumentEnd.js`
* `MainFrameAtDocumentStart.js`

To simplify the build process, these compiled files are checked-in to this repository. When adding or editing User Scripts, these files can be re-compiled with `webpack` manually. This requires Node.js to be installed and all required `npm` packages can be installed by running `npm install` in the root directory of the project. User Scripts can be compiled by running the following `npm` command in the root directory of the project:

```
npm run build
```

Troubleshooting
---------------
This repository's current architecture and usage of the Carthage dependency manager often leads to build issues when new versions of Xcode, iOS, and/or Swift are released. Until improvements are made, here is a troubleshooting process that has helped:

1. Confirm you're using Xcode 12.5.1 (not Xcode 12.5 nor other versions of Xcode)
1. Confirm you're using Xcode 12.5.1 Command Line Tools (not Xcode 12.5 Command Line Tools nor other versions of Xcode Command Line Tools) in the menu: Xcode → Preferences → Locations → Command Line Tools
1. Clean Xcode's build folder: ⌘ + ⇧ + K
1. Delete Xcode's Derived Data folder, navigate there from the menu: Xcode → Preferences → Locations → click the arrow next to the DerivedData folder path to navigate there in Finder → delete the DerivedData folder
1. Delete the Carthage system cache folder: Finder → open up the Go to Folder command (⌘ + ⇧ + G) → Go to `~/Library/Caches` → delete the folder `org.carthage.CarthageKit`
1. In this repo's location on your computer delete the `Carthage` folder
1. In this repo's location on your computer delete the `Cartfile.resolved` file
1. In this repo's location on your computer run the `sh ./bootstrap.sh` command to try to pull in the depedencies again
