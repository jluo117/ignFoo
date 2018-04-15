//
//  article.swift
//  IGN
//
//  Created by james luo on 4/9/18.
//  Copyright © 2018 james luo. All rights reserved.
//
import UIKit
import Foundation
import Kingfisher
class article{
    var image: String
    var des: String
    var title: String
    var ID: String
    var totalComments: Int
    var tags = [String]()
    init(image: String,des: String, title: String,totalComments:Int , id: String) {
        self.des = des
        self.title = title
        self.image = image
        self.totalComments = totalComments
        self.ID = id
    }
    func buildCell(UICELL :APPInfo,table: tableSet){
        UICELL.Title.text = self.title
        UICELL.Preview.text = self.des
        UICELL.comments.setTitle("Comments  " + String(totalComments), for: .normal)
        self.loadImage(urlString: self.image,imageCell: UICELL.preViewImage)
        UICELL.backgroundColor = UIColor(named: "black")
        //creating a dataTask
        
        
    }
    
    func loadImage(urlString:String,imageCell: UIImageView)
    {
        let url = URL(string: urlString)
        imageCell.kf.setImage(with: url)
        
    }
}
