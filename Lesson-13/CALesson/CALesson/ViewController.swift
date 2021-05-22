//
//  ViewController.swift
//  CALesson
//
//  Created by Fenix Lavon on 5/21/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var someButton: UIButton = {
        var button = UIButton()
        button.setTitle("Take me", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(animateFrame), for: .touchUpInside)
        button.frame = CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 100, height: 50)
        return button
    }()
    
    @objc private func animateBasic() {
        someButton.layer.removeAllAnimations()
        let animator = CABasicAnimation(keyPath: "opacity")
        animator.fromValue = 1
        animator.toValue = 0.5
        animator.duration = 0.1
        animator.repeatCount = 3
        someButton.layer.add(animator, forKey: "firstAnimation")
    }
    
    @objc private func animateFrame() {
        let animate = CAKeyframeAnimation(keyPath: "position")
        let pathArray = [[200, 200], [300, 200], [300, 300], [200, 300], [200, 200]]
        animate.values = pathArray
        animate.duration = 4
        animate.autoreverses = true
        someButton.layer.add(animate, forKey: "secondAnimation")
        
    }
    
    @objc private func changeView() {
        let animate = CATransition()
        animate.duration = 2
        animate.timingFunction = CAMediaTimingFunction(name: .easeOut)
    }
    
    @objc private func gropuAnimate() {
        let groupAnimate = CAAnimationGroup()
        let animateFrame = CAKeyframeAnimation(keyPath: "position")
        let pathArray = [[200, 200], [300, 200], [300, 300], [200, 300], [200, 200]]
        animateFrame.values = pathArray
        animateFrame.duration = 2
        
        let animatorBasic = CABasicAnimation(keyPath: "opacity")
        animatorBasic.fromValue = 1
        animatorBasic.toValue = 0.5
        animatorBasic.duration = 1.5
        
        groupAnimate.animations = [animatorBasic, animateFrame]
        groupAnimate.duration = animateFrame.duration + animatorBasic.duration
        animateFrame.beginTime = animatorBasic.duration
        
        someButton.layer.add(groupAnimate, forKey: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(someButton)
    }

}

