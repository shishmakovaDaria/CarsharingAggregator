//
//  ReviewsCoordinator.swift
//  Carsharing Aggregator
//
//  Created by Дарья Шишмакова on 19.01.2024.
//

import UIKit

final class ReviewsCoordinator: ChildCoordinator {
    
    // MARK: - Properties
    var viewControllerRef: UIViewController?
    var navigationController: UINavigationController
    weak var parent: ProfileCoordinator?
    var userID: Int
    
    // MARK: - LifeCycle
    init(navigationController: UINavigationController, userID: Int) {
        self.navigationController = navigationController
        self.userID = userID
    }
    
    // MARK: - Methods
    func start() {
        let viewModel = ReviewsViewModel(userID: userID)
        let viewController = ReviewsViewController(viewModel: viewModel)
        viewModel.coordinator = self
        
        if let sheet = viewController.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [.custom(resolver: { _ in
                    return  496
                })]
            } else {
                sheet.detents = [.large()]
            }
            
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
        }
  
        viewControllerRef?.present(viewController, animated: true)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
        viewControllerRef?.dismiss(animated: true)
    }
}
