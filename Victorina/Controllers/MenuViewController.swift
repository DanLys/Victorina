//
//  MenuViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 24.01.2021.
//

import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitioningDelegate = self
        
        let menuView = MenuView(user: "Test", frame: CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.width - ConfigOffset.presentedXOffsetForSwipe, height: view.frame.height)))
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissSwipeView(_ :)))
        swipe.numberOfTouchesRequired = 1
        swipe.direction = .left
        
        menuView.addGestureRecognizer(swipe)
        menuView.isUserInteractionEnabled = true
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        view.addSubview(menuView)
    }
    
    @objc func dismissSwipeView(_ guester: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}

extension MenuViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .dismiss)
    }
}

