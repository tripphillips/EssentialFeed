//
//  CommentsUIComposer.swift
//  EssentialApp
//
//  Created by Trip Phillips on 1/14/23.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public final class CommentsUIComposer {
    private init() {}
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<[ImageComment], CommentsViewAdapter>
    
    static func commentsComposedWith(
        commentsLoader: @escaping () -> AnyPublisher<[ImageComment], Error>
    ) -> ListViewController {
        let presentationAdapter = FeedPresentationAdapter(loader: commentsLoader)
  
        let commentsController = makeFeedViewController(title: ImageCommentsPresenter.title)
        commentsController.onRefresh = presentationAdapter.loadResource
        
        presentationAdapter.presenter = LoadResourcePresenter(
            resourceView: CommentsViewAdapter(controller: commentsController ),
            loadingView: WeakRefVirtualProxy(commentsController),
            errorView: WeakRefVirtualProxy(commentsController),
            mapper: { ImageCommentsPresenter.map($0) })
        
        return commentsController
    }
    
    private static func makeFeedViewController(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "ImageComments", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ListViewController
        controller.title = title
        return controller
    }
}

final class CommentsViewAdapter: ResourceView {
    private weak var controller: ListViewController?
    
    init(controller: ListViewController) {
        self.controller = controller
    }
    
    func display(_ viewModel: ImageCommentsViewModel) {
        controller?.display(viewModel.comments.map { viewModel in
            CellController(viewModel, dataSource: ImageCommentCellController(model: viewModel))
        })
    }
}
