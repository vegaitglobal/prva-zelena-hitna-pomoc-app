//
//  NewsViewController.swift
//  zeleniKljuc
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol NewsViewControllerDelegating: AnyObject {
    func reloadData()
}

class NewsViewController: UIViewController, NewsViewControllerDelegating {
    var viewModel: NewsViewDelegate
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(viewModel: NewsViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "NewsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.viewDelegate = self
        configureItemsInNavigationBar()
        viewModel.getNewsFromDb()
        NotificationCenter.default.addObserver(self, selector: #selector(getNews), name: Notification.Name.news, object: nil)
    }
    
    @objc func getNews(notification: NSNotification) {
        viewModel.news = notification.object as? [News]
    }
    
    private func configureItemsInNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .darkGray
        navigationItem.backButtonDisplayMode = .minimal
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "magnifyingglass"),
                style: .done,
                target: self,
                action: #selector(search)
            )
        ]
    }
    
    @objc
    func search() {
//        pritisak na lupicu
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? NewsCollectionViewCell {
            guard let news = viewModel.news?[indexPath.item] else {return cell}
                cell.cellSetup(model: news)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfNews()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        return .init(width: width, height:  300)
    }
}
