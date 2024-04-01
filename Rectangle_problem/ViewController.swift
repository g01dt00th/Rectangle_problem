//
//  ViewController.swift
//  Rectangle_problem
//
//  Created by d-roenko on 01.04.2024.
//

import UIKit

final class BlueView: UIView {
    private let inset: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHandler)))
        
        let pathBig = UIBezierPath(rect: bounds)
        let pathSmall = UIBezierPath(rect: bounds.insetBy(dx: inset, dy: inset))
        pathBig.append(pathSmall)
        pathBig.usesEvenOddFillRule = true
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = pathBig.cgPath
        fillLayer.fillRule = .evenOdd
        fillLayer.fillColor = UIColor.blue.cgColor
        layer.addSublayer(fillLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        print("blue tapped!")
    }
}

final class GreenView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHandler)))
    }
    
    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        print("green tapped!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class YellowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(yellowTapHandler)))
    }
    
    
    @objc func yellowTapHandler(_ sender: UIGestureRecognizer) {
        print("yellow tapped!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yellowView = YellowView(frame: view.frame)
        
        let greenFrame = CGRect(
            origin: CGPoint(
                        x: view.frame.origin.x + 20,
                        y: view.frame.midY - 100
                    ),
            size: CGSize(
                width: view.frame.midX,
                height: 200
            )
        )
        let greenView = GreenView(frame: greenFrame)
        
        
        let blueFrame = CGRect(
            origin: CGPoint(
                x: view.frame.origin.x + 100,
                y: view.frame.midY - 200),
            size: CGSize(
                width: view.frame.maxX - 150,
                height: 400
            )
        )
        
        let blueView = BlueView(frame: blueFrame)
        
        yellowView.addSubview(greenView)
        yellowView.addSubview(blueView)
        
        view.addSubview(yellowView)
    }
}

