//
//  FruitViewController.swift
//  MVVM
//
//  Created by kashif on 5/10/23.
//

import UIKit

public final class FruitViewController: UITableViewController {
    @IBOutlet weak var refreshController: FruitRefreshViewController?
    
    var tableModel = [FruitCellController]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fruits"
        refresh()
    }
    
    @IBAction private func refresh() {
        refreshController?.refresh()
        refreshController?.display()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellController(forRowAt: indexPath).view(in: tableView)
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    private func cellController(forRowAt indexPath: IndexPath) -> FruitCellController {
        return tableModel[indexPath.row]
    }
}
