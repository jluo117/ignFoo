
import UIKit
var totalTable = 0
var videoTable = [article]()
var Curindex = 0
var articleTable = [article]()
var state = "article"
class tableSet: UITableViewController {
    
    @IBOutlet weak var article: UIButton!
    
    
    @IBOutlet weak var video: UIButton!
    @IBOutlet var theTable: UITableView!
    var red: UIColor!
    var grey: UIColor!
    // MARK: Properties
    
    
    
    
    
    // MARK: Life cycle
    
    
    @IBOutlet weak var barButton: UINavigationItem!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(named: "black")
        //self.buildTable()
        super.viewDidLoad()
        self.tableView.rowHeight = 600
        barButton.accessibilityElementsHidden = true
        print(videoTable.count)
        grey = (video.titleLabel?.textColor)!
        red = (video.titleLabel?.textColor)!
        super.viewDidLoad()
        //self.initLoad()
        self.tableView.reloadData()
            }
    
    // MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalTable
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "banner" , for: indexPath) as! APPInfo
        
        if state == "article"{
            cell.cellNum = indexPath.row
            articleTable[indexPath.row].buildCell(UICELL: cell,table:self)
        }
        else{
            cell.cellNum = indexPath.row
            videoTable[indexPath.row].buildCell(UICELL: cell,table:self)
        }
        return cell
    }
    
    
    @IBAction func toArticle(_ sender: readMore) {
        Curindex = sender.number
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Curindex = indexPath.row
        self.performSegue(withIdentifier: "toArticle", sender: self)
        
    }
    
    @IBAction func Video(_ sender: UIButton) {
        totalTable = videoTable.count
        state = "video"
        video.titleLabel?.textColor = red
        article.titleLabel?.textColor = grey
        self.tableView.reloadData()
    }
    
        
    @IBAction func Article(_ sender: UIButton) {
        totalTable = articleTable.count
        state = "article"
        self.tableView.reloadData()
        article.titleLabel?.textColor = red
        video.titleLabel?.textColor = grey
        self.tableView.reloadData()
    }
    
}


    // MARK: Action
    
    




