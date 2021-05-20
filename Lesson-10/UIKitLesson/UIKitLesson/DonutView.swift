//
//  DonutView.swift
//  UIKitLesson
//
//  Created by Артур Лутфуллин on 20.05.2021.
//

import UIKit

final class DonutView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .darkGray
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		let path = CGMutablePath()
		path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 50, startAngle: 0.0, endAngle: CGFloat(2.0 * Double.pi), clockwise: false)
		path.addRect(CGRect(origin: .zero, size: frame.size))
		
		let maskLayer = CAShapeLayer()
		maskLayer.backgroundColor = UIColor.black.cgColor
		maskLayer.path = path
		maskLayer.fillRule = .evenOdd
		layer.mask = maskLayer
		layer.cornerRadius = bounds.size.height / 2
		clipsToBounds = true
	}
	
	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		 let view = super.hitTest(point, with: event)
		 if view === self {
			 return nil
		 }
		 return view
	 }
}
