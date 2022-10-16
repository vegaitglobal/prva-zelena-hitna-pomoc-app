//
//  GalleryViewController.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 16/10/2022.
//

import UIKit

protocol GalleryViewControllerDelegationg: AnyObject {
}

final class GalleryViewController: UIViewController, GalleryViewControllerDelegationg {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: GalleryViewModeling
    var images: [UIImage]  = [UIImage]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.collectionView.reloadData()
            }
        }
    }
    
    init(viewModel: GalleryViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: "GalleryViewController", bundle: Bundle(for: type(of: self)))
        self.viewModel.viewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: GalleryCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

extension GalleryViewController: UICollectionViewDelegate {
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.identifier, for: indexPath) as? GalleryCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(with: images[indexPath.row])
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension: CGFloat = collectionView.frame.height
        return CGSize(width: dimension, height: dimension)
    }
}
