//
//  BBTransitionManager.swift
//  BBTransitionManager
//
//  Created by Benjamin Briggs on 10/04/2015.
//  Copyright (c) 2015 Benjamin Briggs. All rights reserved.
//

import UIKit

protocol BBTransitionManagerProtocol: UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

	func trasitionToView(toView: UIView, fromView: UIView, inContainer container: UIView, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void))
	func dissmissToView(toView: UIView, fromView: UIView, inContainer container: UIView, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void))
}

class BBTransitionManager: NSObject, BBTransitionManagerProtocol  {

	private var presenting = true
	var duration = 0.5

	// MARK: <UIViewControllerAnimatedTransitioning>

	final func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    guard let container = transitionContext.containerView() else {return}

		let fromView: UIView! = transitionContext.viewForKey(UITransitionContextFromViewKey) ?? transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
		let toView: UIView! = transitionContext.viewForKey(UITransitionContextToViewKey) ?? transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view

		let duration = self.transitionDuration(transitionContext)

		let completion: ((Bool) -> Void) = { (finish) -> Void in
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
			return
		}

		if self.presenting {
			container.addSubview(fromView)
			container.addSubview(toView)
			trasitionToView(toView, fromView: fromView, inContainer: container, withDuration: duration, completion: completion)
		} else {
			container.addSubview(toView)
			container.addSubview(fromView)
			dissmissToView(toView, fromView: fromView, inContainer: container, withDuration: duration, completion: completion)
		}
	}

	func trasitionToView(toView: UIView, fromView: UIView, inContainer container: UIView, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)) {

		toView.transform = CGAffineTransformMakeTranslation(0, container.bounds.size.height)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {

			toView.transform = CGAffineTransformIdentity
			fromView.transform = CGAffineTransformMakeScale(0.9, 0.9)
			fromView.alpha = 0.8

			}, completion: { (finish) -> Void in

				fromView.transform = CGAffineTransformIdentity
				fromView.alpha = 1.0

				completion(finish)
				return
		})
	}

	func dissmissToView(toView: UIView, fromView: UIView, inContainer container: UIView, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)) {

		toView.transform = CGAffineTransformMakeScale(0.9, 0.9)
		toView.alpha = 0.8

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {

			fromView.transform = CGAffineTransformMakeTranslation(0, container.bounds.size.height)
			toView.transform = CGAffineTransformIdentity
			toView.alpha = 1

			}, completion: { (finish) -> Void in

				fromView.transform = CGAffineTransformIdentity

				completion(finish)
				return
		})
	}

	final func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return duration
	}

	// MARK: <UIViewControllerTransitioningDelegate>

	final func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		self.presenting = true
		return self
	}

	final func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		self.presenting = false
		return self
	}

}