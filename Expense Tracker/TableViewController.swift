//
//  TableViewController.swift
//  Expense Tracker
//
//  Created by Tanmay Rai on 29/10/23.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    var category = ["🍔 Food","✈️ Travel","🍾 Party"]
    
    var food2 : [ [String:String] ] = []
    
    var travel2 : [ [String:String] ] = []
    
    var party2 : [ [String:String] ] = []
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return category[section]
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        inovation coustmize cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CustomTableViewCell
        
        if indexPath.section == 0{
            cell.expName.text = food2[indexPath.row]["key"]
            cell.expPrice.text = "₹\(food2[indexPath.row]["value"]!)"
        }
        else if indexPath.section == 1{
            cell.expName.text = travel2[indexPath.row]["key"]
            cell.expPrice.text = "₹\(travel2[indexPath.row]["value"]!)"
        }
        else {
            cell.expName.text = party2[indexPath.row]["key"]
            cell.expPrice.text = "₹\(party2[indexPath.row]["value"]!)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var n = ""
        
        if indexPath.section == 0{
            n = food2[indexPath.row]["key"]!
        }
        
        else if indexPath.section == 1{
            n = travel2[indexPath.row]["key"]!
        }
        
        else {
            n = party2[indexPath.row]["key"]!
        }
        
        let alert = UIAlertController(title: "Warning!", message: "Do you want to delete this expense?", preferredStyle: .alert)
        
        let cncl = UIAlertAction(title: "Cancel", style: .cancel)
        
        let btn = UIAlertAction(title: "Delete", style: .destructive, handler: { [self]_ in
            
            for (index, dictionary) in food2.enumerated() {
                if let name = dictionary["key"], name == n {
                    food2.remove(at: index)
                    break
                }
            }
            
            for (index, dictionary) in food.enumerated() {
                if let name = dictionary["key"], let val = dictionary["value"], name == n {
                    food.remove(at: index)
                    foodsum -= Int(val)!
                    totalsum -= Int(val)!
                    break
                }
            }
            
            print("food = \(foodsum)")
            
            for (index, dictionary) in travel2.enumerated() {
                if let name = dictionary["key"], name == n {
                    travel2.remove(at: index)
                    break
                }
            }
            
            for (index, dictionary) in travel.enumerated() {
                if let name = dictionary["key"], let val = dictionary["value"], name == n {
                    travel.remove(at: index)
                    travelsum -= Int(val)!
                    totalsum -= Int(val)!
                    
                    break
                }
            }
            
            print("travel = \(travelsum)")
            
            
            for (index, dictionary) in party2.enumerated() {
                if let name = dictionary["key"], name == n {
                    party2.remove(at: index)
                    break
                }
            }
            
            for (index, dictionary) in party.enumerated() {
                if let name = dictionary["key"], let val = dictionary["value"], name == n {
                    party.remove(at: index)
                    partysum -= Int(val)!
                    totalsum -= Int(val)!
                    
                    break
                }
            }
            
            print("party = \(partysum)")
            
            print("total = \(totalsum)")
    
            table.reloadData()
            
        })
        
        alert.addAction(cncl)
        alert.addAction(btn)
        
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
