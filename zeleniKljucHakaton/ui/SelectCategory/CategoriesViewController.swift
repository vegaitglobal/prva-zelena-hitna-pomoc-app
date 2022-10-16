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

class CategoriesViewController: UIViewController {
    var viewModel: CategoriesViewDelegate
    weak var delegate: selectedCategoryProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    let logos = [UIImage(named: "Icon-contact"),
                 UIImage(named: "Icon-contact"),
                 UIImage(named: "Icon-contact"),
                 UIImage(named: "Icon-contact"),
                 UIImage(named: "Icon-contact"),
                 UIImage(named: "Icon-contact")]
    let data = ["Voda",
                "Vazduh",
                "Šume",
                "Otpad",
                "Buka",
                "Gradnja"]
    
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
        navigationItem.title = "Kategorije"
        navigationItem.largeTitleDisplayMode = .automatic
        tableSetup()
    }
    
    func tableSetup() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: CategoryTableViewCell.identifier)
//        self.tableView.separatorColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func didPressOkButton(_ sender: Any) {
        NotificationCenter.default.post(name: ReportViewController.myNotification, object: choosenCategory)
        viewModel.goBack()
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//       viewModel.numberOfRows()
        data.count
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
            cell.categoryItem.text = data[indexPath.section]
            cell.logoImage.image = logos[indexPath.section]
//            cell.cellSetup(category: viewModel.categories[indexPath.section])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenCategory = data[indexPath.section]
    }
}
