//
//  ListCell.swift
//  CustomTableView
//
//  Created by Dayal, Utkarsh on 08/04/21.
//

import UIKit

class ListCell: UITableViewCell {

 
    @IBOutlet weak var videoImageView: UIImageView!
    
    @IBOutlet weak var videoITitleLabel: UILabel!
    
    func setDetails(video:Video){
        videoImageView.image = video.image
        videoITitleLabel.text = video.title
    }
}
