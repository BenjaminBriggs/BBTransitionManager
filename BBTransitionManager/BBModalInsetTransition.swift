//
//  BBModalInsetTransition.swift
//  BBTransitionManager
//
//  Created by Benjamin Briggs on 10/04/2015.
//  Copyright (c) 2015 Benjamin Briggs. All rights reserved.
//

import UIKit

class BBModalInsetTransition: BBTransitionManager {

	var blackOut: UIView?
	var snapShot: UIView?

	override func trasitionToView(toView: UIView, fromView: UIView, inContainer container: UIView, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)) {

		snapShot = fromView.snapshotViewAfterScreenUpdates(false)

		if snapShot != nil {
			snapShot?.center = fromView.center
			container.insertSubview(snapShot!, belowSubview: toView)
		}

		blackOut = UIView(frame: fromView.frame)
		blackOut?.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.25)
		if blackOut != nil {
			blackOut?.center = fromView.center
			container.insertSubview(blackOut!, belowSubview: toView)
		}

		blackOut?.alpha = 0
		toView.transform = CGAffineTransformConcat( CGAffineTransformMakeTranslation(0, container.bounds.height),CGAffineTransformMakeScale(1.3, 1.3))

	UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: UIViewAnimationOptions(), animations: { () -> Void in

		self.blackOut?.alpha = 1
			toView.transform = CGAffineTransformIdentity

			}) { (finished) -> Void in

				completion(finished)
		}

	}

	override func dissmissToView(toView: UIView, fromView: UIView, inContainer container: UIView, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)) {

		blackOut?.alpha = 1
		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.6, options: UIViewAnimationOptions(), animations: { () -> Void in

			self.blackOut?.alpha = 0
			fromView.transform = CGAffineTransformConcat( CGAffineTransformMakeTranslation(0, container.bounds.height),CGAffineTransformMakeScale(1.1, 1.1))

		}) { (finished) -> Void in
			fromView.transform = CGAffineTransformIdentity
			self.snapShot?.removeFromSuperview()
			completion(finished)
		}

	}

}