//
//  theActualGame.swift

//
//  Created by james luo on 4/14/18.
//

import UIKit

class theActualGame: UITableViewController {
    var gameArray = [article]()
    override func viewDidLoad() {
       // super.viewDidLoad()
        if state == "article"{
            for i in 0 ... articleTable.count - 1{
                if i == Curindex{
                    continue
                }
                gameArray.append(articleTable[i])
            }
            for i in videoTable{
                gameArray.append(i)
            }
        }
        else{
            for i in 0 ... videoTable.count - 1 {
                if i == Curindex{
                    continue
                }
                gameArray.append(videoTable[i])
            }
            for i in articleTable{
                gameArray.append(i)
            }
        }
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameArray.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "gamecell" , for: indexPath) as! gameCell
        cell.articleLabel.text = gameArray[indexPath.row].title
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if state == "article"{
            for j in gameArray[indexPath.row].tags{
                for i in articleTable[Curindex].tags{
                    if j == i{
                        let alert = UIAlertController(title: "Alert", message: "Correct", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Alert", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        let OKAction = UIAlertAction(title: "Alert", style: .default) { (action:UIAlertAction!) in
                            self.performSegue(withIdentifier: "home", sender: self)
                            // Code in this block will trigger when OK button tapped.
                        }
                        return
                    }
                }
            }
            let alert = UIAlertController(title: "Alert", message: "wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            for j in gameArray[indexPath.row].tags{
                for i in videoTable[Curindex].tags{
                    if j == i{
                        let alert = UIAlertController(title: "Alert", message: "Correct", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Alert", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        let OKAction = UIAlertAction(title: "Alert", style: .default) { (action:UIAlertAction!) in
                            self.performSegue(withIdentifier: "home", sender: self)
                            // Code in this block will trigger when OK button tapped.
                        }
                        return
                    }
                }
            }
            let alert = UIAlertController(title: "Alert", message: "wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
