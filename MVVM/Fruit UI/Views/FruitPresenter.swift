//
//  FruitPresenter.swift
//  MVVM
//
//  Created by kashif on 5/12/23.
//

import Foundation

protocol FruitLoadingView {
    func display(isLoading: Bool)
}
protocol FruitView {
    func display(fruit: [Fruit])
}

public class FruitPresenter {
    typealias Observer<T> = (T) -> Void
    
    private let fruitLoader: FruitLoader
    
    init(fruitLoader: FruitLoader) {
        self.fruitLoader = fruitLoader
    }
    
    var loadingView: FruitLoadingView?
    var fruitView: FruitView?
    
    func loadFruit() {
        loadingView?.display(isLoading: true)
        fruitLoader.load { [weak self] result in
            if let fruit = try? result.get() {
                self?.fruitView?.display(fruit: fruit)
            }
            self?.loadingView?.display(isLoading: false)
        }
    }
}
