//
//  ListScreen.swift
//  CustomTableView
//
//  Created by Dayal, Utkarsh on 08/04/21.
//

import UIKit

class ListScreen: UIViewController {
    
    var videos:[Video] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videos = createVideosList()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func createVideosList() -> [Video]{
        var tempList:[Video] = []
        
        tempList.append(Video(image: #imageLiteral(resourceName: "image_01"), title: "Image 01"))
        tempList.append(Video(image: #imageLiteral(resourceName: "image_03"), title: "Image 02"))
        tempList.append(Video(image: #imageLiteral(resourceName: "image_02"), title: "Image 03"))
        tempList.append(Video(image: #imageLiteral(resourceName: "image_06"), title: "Image 04"))
        tempList.append(Video(image: #imageLiteral(resourceName: "image_04"), title: "Image 05"))
        tempList.append(Video(image: #imageLiteral(resourceName: "image_05"), title: "Image 06"))

        return tempList
    }
}

extension ListScreen:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! ListCell
        
        cell.setDetails(video: video)
        
        return cell
        
    }
}
