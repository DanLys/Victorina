//
//  AnimationController.swift
//  Victorina
//
//  Created by Danil Lyskin on 11.03.2021.
//

import UIKit

class AnimationController: NSObject {
    let animationDuration: Double
    let animationType: AnimationType

    enum AnimationType {
        case present
        case dismiss
    }
    
    init(animationDuration: Double, animationType: AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }
}

extension AnimationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            transitionContext.containerView.addSubview(fromViewController.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
        }
    }
    
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning,
                          viewToAnimate: UIView) {
        let moveOut = CGAffineTransform(translationX: -viewToAnimate.frame.width, y: 0)
        
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            viewToAnimate.transform = moveOut
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning,
                          viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        viewToAnimate.frame.origin = CGPoint(x: -viewToAnimate.frame.width, y: 0)
        
        let moveTo = CGAffineTransform(translationX: viewToAnimate.frame.width, y: 0)
        
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            viewToAnimate.transform = moveTo
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }
    
    
}
