//
//  APPInfo.swift
//  IGN
//
//  Created by james luo on 4/9/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit

class APPInfo: UITableViewCell {

    @IBOutlet weak var articleIndex: readMore!
    @IBOutlet weak var comments: UIButton!
    @IBOutlet weak var preViewImage: UIImageView!
    @IBOutlet weak var Preview: UILabel!
    @IBOutlet weak var Title: UILabel!
    var cellNum = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var articleMove: UIButton!
    
    @IBAction func ShowComments(_ sender: UIButton) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         
        

        // Configure the view for the selected state
    }

}
