//
//  FruitUIComposer.swift
//  MVVM
//
//  Created by kashif on 5/11/23.
//

import UIKit

public final class FruitUIComposer {
    private init() {}
    
    public static func fruitComposedWith(fruitLoader: FruitLoader) -> FruitViewController {
        let fruitViewModel = FruitViewModel(fruitLoader: fruitLoader)
//        let refreshController = FruitRefreshViewController(viewModel: fruitViewModel)
        let fruitController = makeWithFruitController()
        let refreshController = fruitController.refreshController!
        refreshController.viewModel = fruitViewModel
        fruitViewModel.onFruitLoad = adaptFruitToCellControllers(forwardingTo: fruitController)
        return fruitController
    }
    
    private static func adaptFruitToCellControllers(forwardingTo controller: FruitViewController) -> ([Fruit]) -> Void {
        return { [weak controller] fruit in
            controller?.tableModel = fruit.map { model in
                FruitCellController(viewModel: FruitCellViewModel(model: model))
            }
        }
    }
    
    private static func makeWithFruitController() -> FruitViewController {
        let bundle = Bundle(for: FruitViewController.self)
        let storyboard = UIStoryboard(name: "Fruit", bundle: bundle)
        let fruitViewController = storyboard.instantiateInitialViewController() as! FruitViewController
        return fruitViewController
    }
}
