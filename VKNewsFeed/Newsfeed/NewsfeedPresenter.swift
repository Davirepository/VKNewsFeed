//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by Давид on 05/06/2019.
//  Copyright (c) 2019 Давид Болотаев. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
    
    switch response {
    case .some:
        print(".some Presentor")
        viewController?.displayData(viewModel: .displayNewsfeed)
    case .presentNewsfeed:
        print(".presentNewsfeed Presentor")
        viewController?.displayData(viewModel: .displayNewsfeed)
    }
  
  }
  
}
