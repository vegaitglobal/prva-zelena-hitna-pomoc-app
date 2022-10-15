//
//  PartnersViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class PartnersViewController: UIViewController {
    var viewModel: PartnersViewDelegate
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(viewModel: PartnersViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "PartnersViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PartnersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(getPartnersInfo), name: Notification.Name.partners, object: nil)
    }
    
    @objc func getPartnersInfo(notification: NSNotification) {
        viewModel.partnerScreenInfos = notification.object as? PartnersScreenModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension PartnersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PartnersCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        return .init(width: width, height:  120)
    }
}
