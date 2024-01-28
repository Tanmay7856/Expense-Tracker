//
//  detailedDataView.swift
//  Expense Tracker
//
//  Created by Tanmay Rai on 29/10/23.
//

import UIKit

class detailedDataView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var category = ["Food","Travel","Party"]
    
    var food2 = [ [String:String] ]()
    
    var travel2 = [ [String:String] ]()
    
    var party2 = [ [String:String] ]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return category[section]
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return food2.count
        }
        else if section == 1{
            return travel2.count
        }
        else {
            return party2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        if indexPath.section == 0{
            cell?.textLabel?.text = food2[indexPath.row]["key"]
            cell?.detailTextLabel?.text = food2[indexPath.row]["value"]
        }
        else if indexPath.section == 1{
            cell?.textLabel?.text = travel2[indexPath.row]["key"]
            cell?.detailTextLabel?.text = travel2[indexPath.row]["value"]
        }
        else {
            cell?.textLabel?.text = party2[indexPath.row]["key"]
            cell?.detailTextLabel?.text = party2[indexPath.row]["value"]
        }
        
        return cell!
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
