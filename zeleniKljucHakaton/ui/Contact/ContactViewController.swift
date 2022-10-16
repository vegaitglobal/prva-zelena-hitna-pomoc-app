//
//  ContactViewController.swift
//  zeleniKljuc
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class ContactViewController: UIViewController {
    var viewModel: ContactViewDelegate
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var webAdressLabel: UILabel!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    
    init(viewModel: ContactViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "ContactViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getContactInformationsFromDb()
        NotificationCenter.default.addObserver(self, selector: #selector(getContactInformations), name: Notification.Name.contact, object: nil)
    }
    
    @objc func getContactInformations(notification: NSNotification) {
        let contactInfo = notification.object as? ContactScreenModel
        descriptionLabel.text = contactInfo?.description
        phoneNumberLabel.text = "Broj telefona: \(contactInfo?.phoneNumber ?? "")"
        emailLabel.text = "Email: \(contactInfo?.email ?? "")"
        webAdressLabel.text = "Web: \(contactInfo?.webAdress ?? "")"
        facebookLabel.text = "Facebook Profile: \(contactInfo?.facebookProfile ?? "")"
        instagramLabel.text = "Instagram Profile: \(contactInfo?.instagramProfile ?? "")"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
      }
}
