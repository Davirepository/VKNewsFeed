//
//  NewsfeedModels.swift
//  VKNewsFeed
//
//  Created by Давид on 05/06/2019.
//  Copyright (c) 2019 Давид Болотаев. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentNewsfeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsfeed
      }
    }
  }
  
}
