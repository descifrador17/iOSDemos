//
//  ViewController.swift
//  Animation Basics
//
//  Created by Dayal, Utkarsh on 21/04/21.
//

import UIKit

class ViewController: UIViewController {

    //this is hidden right now
    @IBOutlet weak var boxView: UIView!
    
    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()


//        Make Document Icon
//
//        makeDocument()
//
         
//        Simple Replicator
//        simpleReplicator()
        
//        Loader using Replicator
//        makeLoader()
        
        
//        Masking
        maskingExample()
        
        
//        Making Animation
//
//        layer.backgroundColor = UIColor.red.cgColor
//        layer.frame = CGRect(x: 100, y: 100, width: 75, height: 75)
//        view.layer.addSublayer(layer)
//        beatAnimation()
        
        
    }
    
    //MARK: simple color animation
    private func simpleAnimateColor(){
        UIView.animate(withDuration: 1, animations: {
            self.boxView.backgroundColor = .systemPink
        })
        
    }
    
    //MARK: Animate color with delay
    private func delayAnimateColor(){
        UIView.animate(withDuration: 1, delay: 2, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.boxView.backgroundColor = .systemPink
        })
    }
    
    //MARK: Beat Animation
    private func beatAnimation(){
        let animation = CABasicAnimation(keyPath: "transformation")
        animation.fromValue = CGPoint(x: layer.frame.origin.x, y: layer.frame.origin.y)
        animation.toValue = CGPoint(x: 300, y: 300)
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
    }
    
    //MARK: Document Icon using Core Animation
    private func makeDocument(){
        let document = CAShapeLayer()
        
        document.strokeColor = UIColor.black.cgColor
        document.lineWidth = 3
        document.fillColor = UIColor.white.cgColor
        
        let size = CGSize(width: 100, height: 120)
        let foldInset = CGFloat(30)
        
        let path = CGMutablePath()
        
        //document outlines
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: foldInset))
        path.addLine(to: CGPoint(x: size.width - foldInset, y: 0))
        path.addLine(to: .zero)
        
        //fold
        path.move(to: CGPoint(x: size.width - foldInset, y: 0))
        path.addLine(to: CGPoint(x: size.width - foldInset, y: foldInset))
        path.addLine(to: CGPoint(x: size.width, y: foldInset))
        
        document.path = path
        
        boxView.layer.addSublayer(document)
    }
    
    //MARK: Core Animation Replicator
    private func simpleReplicator(){
        let replicator = CAReplicatorLayer()
        replicator.instanceCount = 3
        
        let square = CALayer()
        square.frame.size = CGSize(width: 50, height: 50)
        square.backgroundColor = UIColor.red.cgColor
        
        replicator.addSublayer(square)
        replicator.instanceTransform = CATransform3DMakeTranslation(60, 0, 0)
        replicator.instanceRedOffset = -0.3
        
        boxView.layer.addSublayer(replicator)
    }
    
    //MARK: Custom Loader using CAReplicator()
    private func makeLoader(){
        let shape = CAShapeLayer()
        shape.frame.size = CGSize(width: 10, height: 50)
        shape.anchorPoint = CGPoint(x: 0.5, y: 1)
        shape.path = CGPath(ellipseIn: shape.frame, transform: nil)
        shape.fillColor = UIColor.black.cgColor
        
        let replicator = CAReplicatorLayer()
        replicator.instanceCount = 20

        let fullCircle = CGFloat.pi * 2
        let angle = fullCircle/CGFloat(replicator.instanceCount)

        replicator.addSublayer(shape)
        replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        replicator.bounds.size = CGSize(width: shape.frame.height * .pi, height: shape.frame.height)
        
        //infinite rotation
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Float.pi * 2.0
        rotationAnimation.duration = 10
        rotationAnimation.repeatCount = Float.infinity

        replicator.add(rotationAnimation, forKey:nil )
        
        boxView.layer.addSublayer(replicator)
        
    }
    
    //MARK: Masking
    private func maskingExample(){
        
        let mask = CAShapeLayer()
        mask.frame.size = CGSize(width: boxView.frame.size.width, height: boxView.frame.size.height)
        mask.path = CGPath(ellipseIn: mask.frame, transform: nil)
        mask.fillColor = UIColor.white.cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame.size = mask.frame.size
        gradient.colors = [UIColor.red.cgColor, UIColor.systemPink.cgColor,UIColor.blue.cgColor]
        
        gradient.mask = mask
        
        boxView.layer.addSublayer(gradient)
    }
    


}

