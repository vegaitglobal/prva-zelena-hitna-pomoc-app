//
//  WasteDisposalViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/16/22.
//

import UIKit

protocol WasteDisposalControllerDelegating: AnyObject {
    func reloadData()
}

class WasteDisposalViewController: UIViewController, WasteDisposalControllerDelegating {
    var viewModel: WasteDisposalViewDelegate
    @IBOutlet weak var wasteDisposalTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var screenDescription: UILabel!
    
    init(viewModel: WasteDisposalViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "WasteDisposalViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableSetup()
        viewModel.getScreenModelFromDb()
        NotificationCenter.default.addObserver(self, selector: #selector(gotWaisteDisposalInfo), name: Notification.Name.waisteDisposal, object: nil)
    }
    
    @objc func gotWaisteDisposalInfo(notification: NSNotification) {
        viewModel.screenModel = notification.object as? WasteDisposal
        print(notification)
    }
    
    func tableSetup() {
        self.tableView.register(UINib(nibName: "WasteDisposalTableViewCell", bundle: nil), forCellReuseIdentifier: WasteDisposalTableViewCell.identifier)
        tableView.separatorColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.wasteDisposalTitle.text = self.viewModel.screenModel?.title
            self.screenDescription.text = self.viewModel.screenModel?.description
            self.tableView.reloadData()
        }
    }
}

extension WasteDisposalViewController: UITableViewDelegate, UITableViewDataSource {
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WasteDisposalTableViewCell", for: indexPath) as? WasteDisposalTableViewCell {
            cell.selectionStyle = .none
            guard let model = viewModel.screenModel?.locations?[indexPath.section] else {return cell}
            cell.cellSetUp(model: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //idi na njegov link
    }
    
}
