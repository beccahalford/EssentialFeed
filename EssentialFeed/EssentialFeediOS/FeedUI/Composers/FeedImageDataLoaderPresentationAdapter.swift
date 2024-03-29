//
//  FeedImageDataLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 29/12/2023.
//

import Combine
import Foundation
import EssentialFeed
import EssentialFeediOS

/*
final class FeedImageDataLoaderPresentationAdapter<View: FeedImageView, Image>: FeedImageCellControllerDelegate where View.Image == Image {
    private let model: FeedImage
    private let imageLoader: (URL) -> FeedImageDataLoader.Publisher
    private var cancellable: Cancellable?
    private var task: FeedImageDataLoaderTask?
    
    var presenter: FeedImagePresenter<View, Image>?
    
    init(model: FeedImage, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    func didRequestImage() {
        presenter?.didStartLoadingImageData(for: model)
        
        let model = self.model
        cancellable = imageLoader(model.url)
            .dispatchOnMainQueue()
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished: break

                    case let .failure(error):
                        self?.presenter?.didFinishLoadingImageData(with: error, for: model)
                    }

                }, receiveValue: { [weak self] data in
                    self?.presenter?.didFinishLoadingImageData(with: data, for: model)
                })
        
        
//        task = imageLoader.loadImageData(from: model.url) { [weak self] result in
//            switch result {
//            case let .success(data):
//                self?.presenter?.didFinishLoadingImageData(with: data, for: model)
//                
//            case let .failure(error):
//                self?.presenter?.didFinishLoadingImageData(with: error, for: model)
//            }
//        }
    }
    
    func didCancelImageRequest() {
        cancellable?.cancel()
//        task?.cancel()
    }
}
*/
