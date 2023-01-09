//
//  ImageCommentsSnapshotTests.swift
//  EssentialFeediOSTests
//
//  Created by Trip Phillips on 1/8/23.
//

import XCTest
import EssentialFeediOS
@testable import EssentialFeed

class ImageCommentsSnapshotTests: XCTestCase {
    
    func test_feedWithContent() {
        let sut = makeSUT()
        
        sut.display(comments())
        
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "IMAGE_COMMENTS_light")
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark)), named: "IMAGE_COMMENTS_dark")
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "ImageComments", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ListViewController
        controller.loadViewIfNeeded()
        controller.tableView.showsVerticalScrollIndicator = false
        controller.tableView.showsHorizontalScrollIndicator = false
        return controller
    }

    private func comments() -> [CellController] {
        commentControllers().map { CellController($0) }
    }
    
    private func commentControllers() -> [ImageCommentCellController] {
        return [
            ImageCommentCellController(
                model: ImageCommentViewModel(message: "Today I wrote my first SwiftUI view.  It was really cool to see my code instantly compile and display in the preview.", date: "3 years ago", username: "HelloUser")),
            ImageCommentCellController(
                model: ImageCommentViewModel(message: "This is a small comment", date: "10 days ago", username: "JohnSmith")
            ),
            ImageCommentCellController(
                model: ImageCommentViewModel(message: "nice", date: "1 hour ago", username: "Thisisaverylongusernamefortesting")
            )
        ]
    }
}
