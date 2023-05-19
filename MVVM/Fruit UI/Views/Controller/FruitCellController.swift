//
//  FruitCellController.swift
//  MVVM
//
//  Created by kashif on 5/10/23.
//

import UIKit

public final class FruitCellController {
    private let viewModel: FruitCellViewModel
    private var cell: FruitCell?
    
    init(viewModel: FruitCellViewModel) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell") as! FruitCell
        self.cell = cell
        display()
        return cell
    }
    
    private func display() {
        cell?.fruitLabel.text = viewModel.name
        cell?.genusLabel.text = viewModel.genus
        cell?.familyLabel.text = viewModel.family
        cell?.orderLabel.text = viewModel.order
        cell?.carbohydratesLabel.text = viewModel.carbohydrates
        cell?.proteinLabel.text = viewModel.protein
        cell?.fatLabel.text = viewModel.fat
        cell?.caloriesLabel.text = viewModel.calories
        cell?.sugarLabel.text = viewModel.sugar
    }
}
