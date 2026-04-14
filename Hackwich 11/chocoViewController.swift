//
//  chocoViewController.swift
//  Hackwich 11
//
//  Created by Hunter Trujillo on 4/13/26.
//

import UIKit

class chocoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chocoTableView: UITableView!
    
    var categoryThreeImagesData = [String]()
    
    var chocoArray = ["Big Island Candies", "Lindor Truffels", "Kitkat", "Hershy's"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chocoArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let text = chocoArray[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        let dict = NSDictionary(contentsOfFile: path!)
        
        categoryThreeImagesData = dict!.object(forKey: "chocoTabImages") as! [String]

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "chocoSegue"
        {
            let s1 = segue.destination as! chocoDetailViewController
            let imageIndex = chocoTableView.indexPathForSelectedRow?.row
            s1.imagePass = categoryThreeImagesData[imageIndex!]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
