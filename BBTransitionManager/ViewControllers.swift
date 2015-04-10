//
//  ViewController.swift
//  BBTransitionManager
//
//  Created by Benjamin Briggs on 10/04/2015.
//  Copyright (c) 2015 Benjamin Briggs. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

	@IBOutlet weak var presentButton: UIButton!
	let transitionManager = BBModalInsetTransition()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		presentButton.layer.cornerRadius = presentButton.bounds.size.height / 2
		presentButton.layer.borderWidth = 1
		presentButton.layer.borderColor = presentButton.titleColorForState(UIControlState.Normal)?.CGColor
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let destinationViewController = segue.destinationViewController as! UIViewController
		destinationViewController.transitioningDelegate = self.transitionManager
	}
}

class ViewController2: UIViewController {

	@IBOutlet weak var presentButton: UIButton!
	@IBOutlet weak var unwined1Button: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		presentButton.layer.cornerRadius = presentButton.bounds.size.height / 2
		presentButton.layer.borderWidth = 1
		presentButton.layer.borderColor = presentButton.titleColorForState(UIControlState.Normal)?.CGColor

		unwined1Button.layer.cornerRadius = unwined1Button.bounds.size.height / 2
		unwined1Button.layer.borderWidth = 1
		unwined1Button.layer.borderColor = unwined1Button.titleColorForState(UIControlState.Normal)?.CGColor
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

	override func updateViewConstraints() {

		if self.view.superview?.bounds == self.view.bounds {
			self.view.frame = UIEdgeInsetsInsetRect(self.view.frame, UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
		}

		super.updateViewConstraints()
	}

	@IBAction func unwindTo1(segue: UIStoryboardSegue) {
		self.presentingViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in

		})
	}
}

class ViewController3: UIViewController {

	@IBOutlet weak var unwined1Button: UIButton!
	@IBOutlet weak var unwined2Button: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		unwined1Button.layer.cornerRadius = unwined1Button.bounds.size.height / 2
		unwined1Button.layer.borderWidth = 1
		unwined1Button.layer.borderColor = unwined1Button.titleColorForState(UIControlState.Normal)?.CGColor

		unwined2Button.layer.cornerRadius = unwined2Button.bounds.size.height / 2
		unwined2Button.layer.borderWidth = 1
		unwined2Button.layer.borderColor = unwined2Button.titleColorForState(UIControlState.Normal)?.CGColor
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

	@IBAction func unwindTo1(segue: UIStoryboardSegue) {
		self.presentingViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in

		})
	}

	@IBAction func unwindTo2(segue: UIStoryboardSegue) {
		self.presentingViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in

		})
	}
}

