//
//  CategoriesInformationsViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class CategoriesInformationsViewController: UIViewController {
    var viewModel: CategoriesInformationsViewDelegate
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var categoryIcon: CachedImageView!
    
    init(viewModel: CategoriesInformationsViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "CategoriesInformationsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetup()
        screenSetup()
    }
    
    func screenSetup() {
        categoryTitle.text = viewModel.model.name
        categoryDescription.text = viewModel.model.description
        guard let imageURL = viewModel.model.image else { return }
        categoryIcon.loadImage(imageURL)
    }
    
    func tableSetup() {
        self.tableView.register(UINib(nibName: "CategoriesInformationsTableViewCell", bundle: nil), forCellReuseIdentifier: CategoriesInformationsTableViewCell.identifier)
        self.tableView.separatorColor = UIColor.clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension CategoriesInformationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesInformationsTableViewCell", for: indexPath) as? CategoriesInformationsTableViewCell {
            guard let link = viewModel.model.subcategories?[indexPath.section] else { return cell }
            cell.cellSetUp(linkModel: link)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
}
