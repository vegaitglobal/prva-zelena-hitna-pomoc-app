//
//  HomeViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol HomeViewControllerDelegating: AnyObject {
    func reloadData()
}

class HomeViewController: UIViewController, UITabBarControllerDelegate, UITabBarDelegate, HomeViewControllerDelegating {
    var viewModel: HomeViewDelegate
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(viewModel: HomeViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
        self.viewModel.viewDelegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        viewModel.viewDelegate = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.getCategoiresFromDb()
        NotificationCenter.default.addObserver(self, selector: #selector(getCategories), name: Notification.Name.categories, object: nil)
    }
    
    @objc func getCategories(notification: NSNotification) {
        viewModel.categories = notification.object as? [CategoryModel]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func reportProblem(_ sender: Any) {
        viewModel.continueToReport()
    }
    
    @IBAction func seeMaps(_ sender: Any) {
        viewModel.continueToMaps()
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newModel = CategoryModel(id: "3", name: "Sume", image: "fdfsd", description: "Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do eiusmod tempor .", subcategories: [Link(id: "1", name: "ee", url: "fsf"), Link(id: "wew", name: "Dsfs", url: "1")])
        viewModel.continueToCategoriesScreen(model: newModel)
//            mealCategory: viewModel.categories[indexPath.item].name , selectedMealCategoryId: viewModel.categories[indexPath.item].id)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell {
            guard let categoryInfo = viewModel.categories?[indexPath.item] else {return cell}
            cell.cellSetUp(categoryInfo: categoryInfo)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width / 4
        return .init(width: width, height:  80)
    }
}
