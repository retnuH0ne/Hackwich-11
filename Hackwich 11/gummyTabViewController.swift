//
//  gummyTabViewController.swift
//  Hackwich 11
//
//  Created by Hunter Trujillo on 3/24/26.
//

import UIKit

class gummyTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var categoryOneImagesData = [String]()
    
    var gummyArray = ["Nerds Gummy Clusters", "Haribo Gold Bears", "Gummy Burger", "Sour Patch Kids"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gummyArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let text = gummyArray[indexPath.row]
        
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
        
        categoryOneImagesData = dict!.object(forKey: "GummyTabImages") as! [String]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gummySegue"
        {
            let s1 = segue.destination as! GummyDetailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagePass = categoryOneImagesData[imageIndex!]
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
