//
//  SuccessfulReportViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class SuccessfulReportViewController: UIViewController {
    var viewModel: SuccessfulReportViewDelegate
    @IBOutlet weak var dateOfReport: UILabel!
    
    init(viewModel: SuccessfulReportViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "SuccessfulReportViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTodaysDate()

    }
    
    func getTodaysDate() {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long

        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        dateOfReport.text = formatter.string(from: currentDateTime)
    }
}

