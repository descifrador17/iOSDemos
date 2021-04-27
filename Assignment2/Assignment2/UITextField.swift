//
//  UITextField.swift
//  Assignment2
//
//  Created by Dayal, Utkarsh on 06/04/21.
//

import Foundation
import UIKit

extension UITextField{
    func addToolbarToKeyboard(field: UITextField?){
        let doneToolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(title: "Previous", style: .done, target: self, action: #selector(movePrev(field:))))
        items.append(UIBarButtonItem(title:"Next",style: .done,target: self,action: #selector(moveNext(field:))))
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(UIBarButtonItem(title:"Done",style: .done,target: self,action: #selector(field?.resignFirstResponder)))
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func moveNext(field: UITextField?){
        let nextTag = self.tag + 1
            let nextResponder = self.superview?.viewWithTag(nextTag) as UIResponder?
            if nextResponder != nil {
                nextResponder?.becomeFirstResponder()
            } else {
                self.resignFirstResponder()
            }
        
    }
    
    @objc func movePrev(field: UITextField?){
        let prevTag = self.tag - 1
            let prevResponder = self.superview?.viewWithTag(prevTag) as UIResponder?
            if prevResponder != nil {
                prevResponder?.becomeFirstResponder()
            } else {
                self.resignFirstResponder()
            }
    }
}
