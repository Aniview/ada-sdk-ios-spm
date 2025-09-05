# Ada SDK (iOS)

AdaSDK is an iOS SDK for rendering **advertisement views** inside your app.  
It acts as an enhanced ad solution

## Features

- Unified interface for ads from multiple sources
- Supports Google Ad Manager ads
- Simple configuration with `AdaConfig`
- Drop-in `AdaView` for displaying ads


## Requirements

- iOS 14.0+
- Xcode 16+
- [Google Mobile Ads SDK](https://developers.google.com/ad-manager/mobile-ads-sdk/ios/quick-start)  

⚠️ **Important**:  
AdaSDK depends on the Google Mobile Ads SDK.  
You must integrate and configure Google Mobile Ads SDK in your project before using AdaSDK.  
👉 Follow Google’s official guide: [Google Ad Manager iOS Integration Guide](https://developers.google.com/ad-manager/mobile-ads-sdk/ios/quick-start)

---

## Installation

For now, AdaSDK can be added manually by including it in your project.  
(Swift Package Manager and CocoaPods support will be added soon.)

---

## Usage

### Swift Example

```swift
import UIKit
import AdaSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the ad
        let config = AdaConfig(
            pubId: "publisher id",
            tagId: "tag id"
        )

        // Create the ad view
        let adView = AdaView(config: config)
        adView.translatesAutoresizingMaskIntoConstraints = false

        // Add it to your parent view
        view.addSubview(adView)

        // Example layout constraints
        NSLayoutConstraint.activate([
            adView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            adView.widthAnchor.constraint(equalToConstant: 320),
            adView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
```

### Observing Events

The ADA library provides various events for tracking ads.  
To observe these events, implement the AdaViewDelegate protocol. 
If you need to update your layout when the ad source provides a banner with a different size,  
implement the SizeDelegate protocol to track banner height updates.

**AdaEvent list:**
```swift
enum AdaEvent {
    /**
     * New Ad was loaded
     */
    case onLoaded

    /**
     * Failed to load an Ad
     */
    case onAdError

    /**
     * Ad impression was triggered
     */
    case onImpression

    /**
     * Next Ad can now be loaded
     */
    case onAdCanRefresh

    /**
     * Ad was clicked
     */
    case onClicked
}
```

```swift
let adView = AdaView(config: config)
adView.delegate = self
adView.sizeDelegate = self

extension ViewController: AdaViewDelegate {
    func onEvent(_ event: AdaSdk.AdaEvent) {
        print("Ada event: \(event)")
    }
}

extension ViewController: SizeDelegate {
    func onHeightChange(_ height: CGFloat) {
        print("Ada view needs height: \(height)")
    }
}
```


### Example Project

A complete working example is available here:
👉 [AdaSDK Example Project](https://github.com/Aniview/ada-ios-example)
