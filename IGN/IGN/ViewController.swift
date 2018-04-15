//
//  ViewController.swift
//  IGN
//
//  Created by james luo on 4/9/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

   var storyTags = [String]()
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var Article: UILabel!
    @IBOutlet weak var ArticleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(named: "Black")
        super.viewDidLoad()
        if state == "article"{
            ArticleTitle.text = articleTable[Curindex].title
            Article.text = articleTable[Curindex].des
            storyTags = articleTable[Curindex].tags
            let url = URL(string: articleTable[Curindex].image)
             articleImage.kf.setImage(with: url)
        }
        else{
            storyTags = videoTable[Curindex].tags
            ArticleTitle.text = videoTable[Curindex].title
            Article.text = videoTable[Curindex].des
            let url = URL(string: videoTable[Curindex].image)
            articleImage.kf.setImage(with: url)
        }
        loadTags()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadTags(){
        var tagsText = ""
        for i in storyTags{
            tagsText += "#" + i + " "
        }
        tags.text = tagsText
    }


}

