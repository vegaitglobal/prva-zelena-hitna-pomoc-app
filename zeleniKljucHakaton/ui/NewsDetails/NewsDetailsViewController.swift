//
//  NewsDetailsViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class NewsDetailsViewController: UIViewController{
    var viewModel: NewsDetailsViewDelegate
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: CachedImageView!
    @IBOutlet weak var newsDescription: UILabel!
    
    init(viewModel: NewsDetailsViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "NewsDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDate.text = viewModel.news.date
        newsTitle.text = viewModel.news.title
        newsDescription.text = viewModel.news.description
        guard let imageURL = viewModel.news.image else { return }
        newsImage.loadImage(imageURL)
    }
}

extension NewsDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}
