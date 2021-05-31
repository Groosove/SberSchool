//
//  ViewController.swift
//  CAHomework
//
//  Created by Fenix Lavon on 5/28/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy private var kindergartenView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "kindergarten"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var schoolView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "school"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var universityView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "university"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var houseView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "house"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var babyView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Baby"))
        
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(babyTapped)))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var littleGirlView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "LittleGirl"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy private var girlView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Girl"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var womanView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Woman"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var grandMotherView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "GrandMother"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var sunView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "sun"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let initialX: CGFloat = 40
    let imageViewWidth: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(kindergartenView)
        view.addSubview(schoolView)
        view.addSubview(universityView)
        view.addSubview(houseView)
        view.addSubview(babyView)
        view.addSubview(littleGirlView)
        view.addSubview(girlView)
        view.addSubview(womanView)
        view.addSubview(grandMotherView)
        view.addSubview(sunView)
        littleGirlView.isHidden = true
        girlView.isHidden = true
        womanView.isHidden = true
        grandMotherView.isHidden = true
        sunView.isHidden = true
        
        createConstrains()
    }
    
    @objc private func babyTapped() {
        let circularPathSun = UIBezierPath(arcCenter: view.center,
                                        radius: view.frame.width,
                                        startAngle: -.pi,
                                        endAngle: 0,
                                        clockwise: true)
        
        let animationSun = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animationSun.duration = 3
        animationSun.repeatCount = 10
        animationSun.path = circularPathSun.cgPath
        animationSun.timingFunction = CAMediaTimingFunction(name: .default)
        sunView.layer.add(animationSun, forKey: "myAnimation")
        
        sunView.frame.origin.x = circularPathSun.cgPath.currentPoint.x - sunView.frame.width / 2
        sunView.frame.origin.y = circularPathSun.cgPath.currentPoint.y - sunView.frame.height / 2
        
        animateView(with: babyView,
                    x: kindergartenView.center.x - babyView.frame.size.width / 2,
                    y: kindergartenView.center.y,
                    selector: #selector(littleGirlAnimate))
    }
    
    @objc private func littleGirlAnimate() {
        babyView.isHidden = true
        littleGirlView.isHidden = false
        littleGirlView.frame.origin.x = babyView.frame.origin.x
        littleGirlView.frame.origin.y = babyView.frame.origin.y
        animateScaleView(with: littleGirlView)
        Timer.scheduledTimer(withTimeInterval: TimeInterval(1.0), repeats: false, block: {_ in
            self.animateView(with: self.littleGirlView,
                             x: self.schoolView.center.x - self.littleGirlView.frame.width / 2,
                             y: self.schoolView.center.y,
                             selector: #selector(self.girlAnimate))
        })
    }
    
    @objc private func girlAnimate() {
        littleGirlView.isHidden = true
        girlView.isHidden = false
        girlView.frame.origin.x = littleGirlView.frame.origin.x
        girlView.frame.origin.y = littleGirlView.frame.origin.y
        animateScaleView(with: girlView)
        Timer.scheduledTimer(withTimeInterval: TimeInterval(1.0), repeats: false, block: {_ in
            self.animateView(with: self.girlView,
                             x: self.universityView.center.x - self.girlView.frame.width / 2,
                             y: self.universityView.center.y,
                             selector: #selector(self.womanAnimate))
        })
    }
    
    @objc private func womanAnimate() {
        girlView.isHidden = true
        womanView.isHidden = false
        womanView.frame.origin.x = girlView.frame.origin.x
        womanView.frame.origin.y = girlView.frame.origin.y
        animateScaleView(with: womanView)
        Timer.scheduledTimer(withTimeInterval: TimeInterval(1.0), repeats: false, block: {_ in
            self.animateView(with: self.womanView,
                             x: self.houseView.center.x - self.womanView.frame.width / 2,
                             y: self.houseView.center.y,
                             selector: #selector(self.grandMomAnimate))
        })
        
    }
    
    @objc private func grandMomAnimate() {
        womanView.isHidden = true
        grandMotherView.isHidden = false
        grandMotherView.frame.origin.x = womanView.frame.origin.x
        grandMotherView.frame.origin.y = womanView.frame.origin.y
        animateScaleView(with: grandMotherView)
    }
    
    @objc private func animateView(with view: UIView, x: CGFloat, y: CGFloat, selector: Selector) {
        let animate = CABasicAnimation(keyPath: "transform.scale")
        animate.fromValue = 1
        animate.toValue = 0.2
        animate.duration = 5.0
        view.layer.add(animate, forKey: "scale")
        UIView.animateKeyframes(withDuration: 5,
                                delay: 0,
                                options: [],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 5.0, animations: {
                                                        view.frame.origin.x = x
                                                        view.frame.origin.y = y
                                    })
        })
        Timer.scheduledTimer(timeInterval: TimeInterval(5.0), target: self, selector: selector, userInfo: nil, repeats: false)
    }
    
    @objc private func animateScaleView(with view: UIView) {
        let animate = CABasicAnimation(keyPath: "transform.scale")
        animate.fromValue = 0
        animate.toValue = 1
        animate.duration = 1.0
        view.layer.add(animate, forKey: "scale")
    }
    
    func createConstrains() {
        NSLayoutConstraint.activate([
            babyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            babyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            babyView.widthAnchor.constraint(equalTo: kindergartenView.widthAnchor, multiplier: 0.7),
            babyView.heightAnchor.constraint(equalTo: kindergartenView.heightAnchor, multiplier: 0.7),
            
            kindergartenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            kindergartenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            kindergartenView.widthAnchor.constraint(equalToConstant: kindergartenView.frame.width),
            kindergartenView.heightAnchor.constraint(equalToConstant: kindergartenView.frame.height),
            
            schoolView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            schoolView.bottomAnchor.constraint(equalTo: kindergartenView.topAnchor, constant: -45),
            schoolView.widthAnchor.constraint(equalToConstant: schoolView.frame.width),
            schoolView.heightAnchor.constraint(equalToConstant: schoolView.frame.height),
            
            universityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            universityView.centerYAnchor.constraint(equalTo: schoolView.centerYAnchor),
            universityView.widthAnchor.constraint(equalToConstant: universityView.frame.width),
            universityView.heightAnchor.constraint(equalToConstant: universityView.frame.height),
            
            houseView.bottomAnchor.constraint(equalTo: universityView.topAnchor, constant: -45),
            houseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            houseView.widthAnchor.constraint(equalToConstant: houseView.frame.width),
            houseView.heightAnchor.constraint(equalToConstant: houseView.frame.height),
            
            littleGirlView.centerXAnchor.constraint(equalTo: kindergartenView.centerXAnchor),
            littleGirlView.widthAnchor.constraint(equalToConstant: littleGirlView.frame.width),
            littleGirlView.heightAnchor.constraint(equalToConstant: littleGirlView.frame.height),
            
            girlView.widthAnchor.constraint(equalToConstant: girlView.frame.width),
            girlView.heightAnchor.constraint(equalToConstant: girlView.frame.height),
            
            womanView.widthAnchor.constraint(equalToConstant: womanView.frame.width),
            womanView.heightAnchor.constraint(equalToConstant: womanView.frame.height),
            
            grandMotherView.widthAnchor.constraint(equalToConstant: grandMotherView.frame.width),
            grandMotherView.heightAnchor.constraint(equalToConstant: grandMotherView.frame.height),
        ])
    }
    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }

    func resumeLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
}

