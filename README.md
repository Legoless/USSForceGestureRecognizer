# USSForceGestureRecognizer

**USSForceGestureRecognizer** is an **experimental** force gesture recognizer for iOS. It is written in **Swift 2.0** and supports iOS 9 and onwards. The purpose of this project is to test out developer APIs for 3D Touch (previously Force Touch, which is still referenced in the APIs) and provide a convenience API with `UIGestureRecognizer` pattern, instead of `UITouch`.

Because we currently cannot use [3D Touch APIs](https://developer.apple.com/library/prerelease/ios/documentation/UserExperience/Conceptual/Adopting3DTouchOniPhone/3DTouchAPIs.html#//apple_ref/doc/uid/TP40016543-CH4-SW1) in the simulator, we are patiently waiting for iPhone 6s to be released, so we can test them.

The recognizer is implemented in `USSForceGestureRecognizer` class. It has a property `touchType` to differentiate between both levels of 3D Touch - Deep and Shallow.


# Installation

The easiest way to install **USSForceGestureRecognizer** is to drag & drop `USSForceGestureRecognizer.swift` file in your project.

# Usage

**USSForceGestureRecognizer** is easily added to an `UIView`, just like a normal `UIGestureRecognizer`.

```swift
let recognizer = USSForceGestureRecognizer(target: self, action: "forceTouchDeepwRecognized:")
recognizer.touchType = .Deep
```

To support all 3 types of finger interaction on specific `UIView`, three recognizers have to be added:
- UITapGestureRecognizer
- USSForceGestureRecognizer - With `touchType` property set to `.Shallow` *(default)*.
- USSForceGestureRecognizer - With `touchType` property set to `.Deep`.

Contact
======

Dal Rupnik

- [legoless](https://github.com/legoless) on **GitHub**
- [@thelegoless](https://twitter.com/thelegoless) on **Twitter**
- [dal@unifiedsense.com](mailto:dal@unifiedsense.com)

License
======

**USSForceGestureRecognizer** is released under the **MIT** license. See [LICENSE](https://github.com/Legoless/USSForceGestureRecognizer/blob/master/LICENSE) file for more information.
