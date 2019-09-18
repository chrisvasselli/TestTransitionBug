//
//  ViewController.swift
//  TestTransitionBug
//
//  Created by Wedge on 9/18/19.
//  Copyright © 2019 Serpenti Sei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.transitioningDelegate = self
    }


}

extension ViewController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if transitionContext.view(forKey: .from) == nil {
            print("From view does NOT exist.")
        }
        else {
            print("From view DOES exist.")
        }
        
        
        transitionContext.completeTransition(false)
    }
    
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}


