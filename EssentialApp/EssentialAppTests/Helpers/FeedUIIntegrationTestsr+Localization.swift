//
//  FeedUIIntegrationTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Rebecca Woodman-Halford on 28/12/2023.
//

import XCTest
import EssentialFeed

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }

    var feedTitle: String {
        FeedPresenter.title
    }
    
    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
    
//    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
//        let table = "Feed"
//        let bundle = Bundle(for: FeedPresenter.self)
//        let value = bundle.localizedString(forKey: key, value: nil, table: table)
//        if value == key {
//            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
//        }
//        return value
//    }
}
