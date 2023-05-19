# MVVM
The difference between the MVC and MVVM structures is that a ViewModel does not hold a reference to the View as the Controller does in MVC.
To make both the View and the ViewModel more reusable, the View and the ViewModel should not depend on each other directly. Their communication should be indirect through a binding mechanism.

## Code Structure of MVVM
```
.
├── AppDelegate.swift
├── Base.lproj
│   └── LaunchScreen.storyboard
├── Fruit API
│   ├── FruitItemMapper.swift
│   ├── HTTPClient.swift
│   ├── RemoteFruitLoader.swift
│   └── URLSessionHTTPClient.swift
├── Fruit Feature
│   ├── Fruit.swift
│   ├── FruitLoader.swift
│   └── Nutrition.swift
├── Fruit UI
│   ├── Composers
│   │   └── FruitUIComposer.swift
│   └── Views
│       ├── Controller
│       │   ├── Fruit.storyboard
│       │   ├── FruitCellController.swift
│       │   ├── FruitRefreshViewController.swift
│       │   └── FruitViewController.swift
│       ├── FruitCell.swift
│       ├── FruitPresenter.swift
│       └── Helpers
│           ├── UIRefreshControl+Helpers.swift
│           └── UITableView+Dequeueing.swift
├── Info.plist
├── MVVM.xctestplan
├── Main.storyboard
├── SceneDelegate.swift
├── Shared
│   ├── FruitCellViewModel.swift
│   └── FruitViewModel.swift
```
1. Fruit API
	This section is for making network calls to server. `FruitItemMapper` maps the data to our models. `URLSessionHTTPClient` make network request using `URLSession`. `RemoteFruitLoader` call the `URLSessionHTTPClient` for getting the data.
2. Fruit Feature 
	This section contains the models for our application
3. Fruit UI
	- Composers
		Composer is used whole all the object into return `View Controller` to get ready for used.
		`MainQueueDispatchDecorator` is used to run the view on main thread.
	- Views
		Views contain conrtoller and all UI specific code. 

4. Shared
	This section contain the `MVVM` for both `FruitViewController` and `FruitCellController`. these are independend from UIKit. Only contain stats and functions that are needed to used by view controller. `MVVM` manages and update the state and tells `ViewController` to update their state.