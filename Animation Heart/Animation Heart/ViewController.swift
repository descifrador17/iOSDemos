//
//  ViewController.swift
//  Animation Heart
//
//  Created by Dayal, Utkarsh on 21/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heartImage: UIImageView!
    
    var spriteImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heartImage.image = UIImage(imageLiteralResourceName: "tile00")
        heartImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        
        for i in 0...28{
            spriteImages.append(UIImage(named: "tile0\(i)")!)
        }
    }

    @objc func animate(){
        heartImage.animationImages = spriteImages
        heartImage.animationDuration = 0.6
        heartImage.animationRepeatCount = 2
        heartImage.startAnimating()
    }

}

