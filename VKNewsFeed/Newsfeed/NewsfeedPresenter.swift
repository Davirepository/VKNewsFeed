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
    var cellLayoutCalculator: FeedCellLayoutCalculatorProtocol = FeedCellLayoutCalculator()
    
    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
    
    switch response {
    case .presentNewsfeed(let feed, let revealedPostIds):
        
        print(revealedPostIds)
        
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups, revealedPostIds: revealedPostIds)
        }
        let feedViewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel: feedViewModel))
    }
  
  }
    // преобразование данных в формат данных ячеек
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group], revealedPostIds: [Int]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        
        let photoAttachment = self.photoAttachment(feedItem: feedItem)
        
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        
        let isFullSize = revealedPostIds.contains { (postId) -> Bool in
            return postId == feedItem.postId
        }
        
        //let isFullSize = revealedPostIds.contains(feedItem.postId)
        
        let sizes = cellLayoutCalculator.sizes(postText: feedItem.text, photoAttachment: photoAttachment, isFullSizesPost: isFullSize)
        
        return FeedViewModel.Cell.init(
            postId: feedItem.postId,
            iconUrlString: profile.photo,
            name: profile.name,
            date: dateTitle,
            text: feedItem.text,
            likes: String(feedItem.likes?.count ?? 0),
            comments: String(feedItem.comments?.count ?? 0),
            shares: String(feedItem.reposts?.count ?? 0),
            views: String(feedItem.views?.count ?? 0),
            photoAttachment: photoAttachment,
            sizes: sizes
        )
    }
  
    private func profile(for sourceId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
        let profilesOrGroups: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
        let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
        // проходимся по массиву и ищем подходящий
        let profileRpresentable = profilesOrGroups.first { (myprofileRpresentable) -> Bool in
            myprofileRpresentable.id == normalSourceId
        }
        return profileRpresentable!
    }
    
    private func photoAttachment(feedItem: FeedItem) -> FeedViewModel.FeedCellPhotoAttachment? {
        guard let photos = feedItem.attachments?.compactMap({ (attachment) in
            attachment.photo
        }), let firstPhoto = photos.first else { return nil }
        return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: firstPhoto.srcBIG,
                                                          width: firstPhoto.widht,
                                                          height: firstPhoto.height)
    }
}
