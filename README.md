# SwiftyTable
![iOS 10.0+](https://img.shields.io/badge/platform-iOS%2010%2B-blue.svg?style=flat)
![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)
![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SwiftyTable.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Pure-Swift library for statically typed table components.
- [Requirements](#requirements)
- [Installation](#installation)
- [Features](#features)
- [Usage](#usage)
- [License](#license)


## Requirements
* Xcode 10
* Swift 4.2+
* iOS 10.0+


## Installation
### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

To integrate SwiftyTable into your Xcode project using CocoaPods, add the following line to your `Podfile` and run `pod install`.

```ruby
pod 'SwiftyTable', git: 'https://github.com/jrsaruo/SwiftyTable.git'
```

### Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate SwiftyTable into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jrsaruo/SwiftyTable"
```

Run `carthage update` to build the framework and drag the built `SwiftyTable.framework` into your Xcode project.


## Features
Following implementation is hard to read and will easily cause bugs.
```swift
switch indexPath.section {
case 0:
    switch indexPath.row {
    case 0:
        cell.textLabel?.text = "Username"
    case 1:
        cell.textLabel?.text = "Email"
    case 2:
        cell.textLabel?.text = "phoneNumber"
    default:
        break
    }
case 1:
    cell.accessoryType = .disclosureIndicator
default:
    break
}
```

↓ If you use **SwiftyTable**, the code becomes much better!
```swift
switch Section(indexPath.section) {
case .profile:
    cell.textLabel?.text = ProfileRow(indexPath.row).title
case .information:
    cell.accessoryType = .disclosureIndicator
}
```

### Easy to define table sections or rows
```swift
enum Section: Int, TableSection, CaseIterable {
    case profile
    case information
}

enum ProfileRow: Int, TableRow, CaseIterable {
    case username
    case email
    case phoneNumber

    var title: String { ... }
}

enum InformationRow: Int, TableRow, CaseIterable {
    case help
    case aboutApp
}
```

### Readable and Flexible
```swift
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count // automatically returns 2.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(section) {
        case .profile:
            return ProfileRow.count // automatically returns 3.
        case .information:
            return InformationRow.count // automatically returns 2.
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell identifier", for: indexPath)

        switch Section(indexPath.section) { // default case is unnecessary.
        case .profile:
            cell.textLabel?.text = ProfileRow(indexPath.row).title
        case .information:
            cell.accessoryType = .disclosureIndicator
        }

        return cell
    }

}
```

You can easily change sections or rows like this. Even if the change causes some problems, the compiler will tell you about it.
```swift
enum InformationRow: Int, TableRow, CaseIterable {
    case contact // just add cases to increase rows
    case aboutApp // just swap cases to change the order of rows
    case help
}
```


## Usage


## License
SwiftyTable is under MIT license. See the [LICENSE](LICENSE) file for more info.
