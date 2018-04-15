//
//  welcome.swift
//  IGN
//
//  Created by james luo on 4/11/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit
import Alamofire
class welcome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildTable()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildTable(){
        let API =   "https://ign-apis.herokuapp.com/content?startIndex=30&count=5"
        let JSONurl = NSURL(string: API)
        URLSession.shared.dataTask(with: (JSONurl as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                
                //getting the avengers tag array from json and converting it to NSArray
                if let foundMedia = jsonObj!.value(forKey: "data") as? NSArray {
                    //looping through all the elemen
                    for media in foundMedia{
                        var IMGURL = ""
                        if let thumbnail = (media as AnyObject).value(forKey: "thumbnails") as? NSArray{
                            for i in thumbnail{
                                if ((i as AnyObject).value(forKey: "size") as? String == "compact"){
                                    if let foundURL =  (i as AnyObject).value(forKey: "url") as? String{
                                        IMGURL = foundURL
                                        break
                                    }
                                }
                            }
                        }
                        else{
                            break
                        }
                        let id = (media as AnyObject).value(forKey: "contentId") as? String
                        if let metaData = (media as AnyObject).value(forKey: "metadata") as? AnyObject{
                            let title = metaData.value(forKey: "title") as? String
                            let description = metaData.value(forKey: "description") as? String
                            let mediaType = metaData.value(forKey: "contentType") as? String
                            let newMedia = article(image: IMGURL, des: description!, title:title! , totalComments: 0,id: id!)
                            if let tags = (media as AnyObject).value(forKey: "tags") as? NSArray{
                                for i in tags{
                                    newMedia.tags.append(i as! String)
                                }
                            }
                            if (mediaType == "video"){
                                videoTable.append(newMedia)
                            }
                            else{
                                articleTable.append(newMedia)
                            }
                            
                        }
                        
                        //converting the element to a dictionary
                    }
                    print(articleTable.count)
                    print(videoTable.count)
                    totalTable = articleTable.count
                    state = "article"
                    
                    loadComments()
                    
                }
                
            }
        }).resume()
        func loadComments(){
            Alamofire.request("https://ign-apis.herokuapp.com/comments?ids=3de45473c5662f25453551a2e1cb4e6e,63a71f01cca67c9bbf5e7b6f091d551d", method: .post, encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    //to get status code
                    if let status = response.response?.statusCode {
                        switch(status){
                        case 201:
                            print("example success")
                        default:
                            print("error with response status: \(status)")
                        }
                    }
                    //to get JSON return value
                    if let result = response.result.value {
                        let JSON = result as! NSDictionary
                        let content = JSON.value(forKey: "content") as? NSArray
                        for i in content!{
                            let objectID = (i as AnyObject).value(forKey: "id") as! String
                            let count = (i as AnyObject).value(forKey: "count") as! Int
                            addComments(id: objectID, count: count)
                        }
                        
                    }
                    
            self.performSegue(withIdentifier: "launch", sender: self)
            }
            
        }
        func addComments(id:String, count: Int){
            for i in articleTable{
                if i.ID == id{
                    i.totalComments = count
                    return
                }
            }
            for i in videoTable{
                if i.ID == id{
                    i.totalComments = count
                    return
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
