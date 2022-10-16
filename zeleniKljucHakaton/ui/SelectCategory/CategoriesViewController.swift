//
//  CategoriesViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol selectedCategoryProtocol: AnyObject {
    func updateSelectedCategory(category: String)
}

protocol CategoriesViewDelegating: AnyObject {
    func reloadData()
}

class CategoriesViewController: UIViewController, CategoriesViewDelegating {
    var viewModel: CategoriesViewDelegate
    weak var delegate: selectedCategoryProtocol?
    @IBOutlet weak var tableView: UITableView!
    var choosenCategory: String?
    
    init(viewModel: CategoriesViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "CategoriesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Izaberi kategoriju"
        navigationItem.largeTitleDisplayMode = .automatic
        viewModel.viewDelegate = self
        tableSetup()
        viewModel.getCategoriesFromDb()
        NotificationCenter.default.addObserver(self, selector: #selector(getCategories), name: Notification.Name.categories, object: nil)
    }
    
    @objc func getCategories(notification: NSNotification) {
        viewModel.categories = notification.object as? [CategoryModel]
    }
    
    
    func tableSetup() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        self.tableView.separatorColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func didPressOkButton(_ sender: Any) {
        NotificationCenter.default.post(name: ReportViewController.myNotification, object: choosenCategory)
        viewModel.goBack()
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell {
            guard let categoryModel = viewModel.categories?[indexPath.section] else {return cell}
            cell.cellSetup(category: categoryModel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenCategory = viewModel.categories?[indexPath.section].name
    }
}
