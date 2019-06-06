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
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
        
    case .some:
        print(".some Interactor")
        presenter?.presentData(response: .some)
    case .getFeed:
        print(".getFeed Interactor")
        presenter?.presentData(response: .presentNewsfeed)
    @unknown default:
        print("new case")
    }
    
    
  }
  
}
