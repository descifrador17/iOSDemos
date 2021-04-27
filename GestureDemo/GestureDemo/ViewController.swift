//
//  ViewController.swift
//  GestureDemo
//
//  Created by Dayal, Utkarsh on 12/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var docImageView: UIImageView!
    @IBOutlet weak var dustbinImageView: UIImageView!
    
    var docOrigin : CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        docOrigin = docImageView.frame.origin
        
        addPanGestureRecognizer(view: docImageView)
    }
    
    func addPanGestureRecognizer(view:UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }

    @objc
    func handlePan(sender:UIPanGestureRecognizer){
        
        let docView = sender.view!
        let translation = sender.translation(in: view)
    
        switch sender.state {
        case .began,.changed:
            docView.center = CGPoint(x: docView.center.x + translation.x, y: docView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if docView.frame.intersects(dustbinImageView.frame){
                UIView.animate(withDuration: 0.3, animations: {
                    self.docImageView.alpha=0.0
                })
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.docImageView.frame.origin = self.docOrigin
                })
            }
        default:
            break
        }
    
    
    }

}

