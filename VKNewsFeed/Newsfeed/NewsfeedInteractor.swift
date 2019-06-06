//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Давид on 05/06/2019.
//  Copyright (c) 2019 Давид Болотаев. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
  
    // извлечение данных
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
    case .getNewsfeed:
        fetcher.getFeed { [weak self](feedResponse) in
            guard let feedResponse = feedResponse else { return }
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse))
        }
    }
  }
  
}
