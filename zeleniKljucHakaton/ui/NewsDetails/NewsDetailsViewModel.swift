//
//  NewsDetailsViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol NewsDetailsViewDelegate {
    var news: News { get set }
}

class NewsDetailsViewModel: NewsDetailsViewDelegate {
    private var coordinator: NewsDetailsCoordinator?
    var news: News

    
    init (coordinator: NewsDetailsCoordinator, newsModel: News) {
        self.coordinator = coordinator
        self.news = newsModel
    }

}
