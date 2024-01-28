//
//  ViewController.swift
//  Expense Tracker
//
//  Created by Tanmay Rai on 28/10/23.
//

import UIKit

import AVKit

var food : [ [String:String] ] = []

var travel : [ [String:String] ] = []

var party : [ [String:String] ] = []

var foodsum:Int = 0
var travelsum:Int = 0
var partysum:Int = 0
var totalsum:Int = 0


class ViewController: UIViewController, UITextFieldDelegate {
    
    var userName = ""
    
    var cre = [String:String]()
    
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var partyexp: UILabel!
    @IBOutlet weak var travelexp: UILabel!
    @IBOutlet weak var foodexp: UILabel!
    @IBOutlet weak var totalexp: UILabel!
    @IBOutlet weak var keyboard: UITextField!
    
    
    @IBOutlet weak var welcome: UILabel!
    
    var category = ["Food","Travel","Party"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url1 = URL(string: "https://www.youtube.com/watch?v=HHXq79kt7Ew")
        let urlreq = URLRequest(url: url1!)
        web.loadRequest(urlreq)
        
        welcome.text = "Hi, \(userName):)"
        
        updated(foodsum1: foodsum, partysum1: partysum, travelsum1: travelsum, totalsum1: totalsum)
        
    }
    
    func updateSumLabel() {
        
        foodsum = sum(&food)
        travelsum = sum(&travel)
        partysum = sum(&party)
        
        totalsum = foodsum + travelsum + partysum
        
        updated(foodsum1: foodsum, partysum1: partysum, travelsum1: travelsum, totalsum1: totalsum)
        
    }
    
    func updated (foodsum1: Int, partysum1: Int, travelsum1: Int, totalsum1: Int) {
        foodexp.text = "₹ \(foodsum1)"
        travelexp.text = "₹ \(travelsum1)"
        partyexp.text = "₹ \(partysum1)"
        totalexp.text = "₹ \(totalsum1)"
        
    }
    
    func sum(_ arrayOfDictionaries: inout [[String: String]]) -> Int{
        
        var add = 0
        
        for dict in arrayOfDictionaries {
            for (_, value) in dict {
                if let intValue = Int(value) {
                    add += intValue
                }
            }
        }
        
        return add
        
    }
    
    
    @IBAction func darkMode(_ sender: Any) {
        
        if toggle.isOn {
            view.backgroundColor = .darkGray
        }
        else {
            view.backgroundColor = .systemGroupedBackground
        }
        
    }
    
    
    @IBAction func deletebtn(_ sender: Any) {
        
        do {
            let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
            
            player.play()
        }
        catch {
            
        }
        
        
        let alert = UIAlertController(title: "Warning!", message: "Do you want to delete all expenses?", preferredStyle: .alert)
        
        let cncl = UIAlertAction(title: "Cancel", style: .cancel)
        
        let btn = UIAlertAction(title: "Delete", style: .destructive, handler: { [self]_ in
            
            do {
                let s = Bundle.main.path(forResource: "flush", ofType: "mp3")
                
                try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                
                player.play()
            }
            catch {
                
            }
            
            food.removeAll()
            travel.removeAll()
            party.removeAll()
            
            foodsum = 0
            travelsum = 0
            partysum = 0
            
            updateSumLabel()
        })
        
        alert.addAction(cncl)
        alert.addAction(btn)
        
        present(alert, animated: true)
    }
    
    @IBAction func showbtn(_ sender: Any) {
        
        do {
            let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
            
            player.play()
        }
        catch {
            
        }
        
        performSegue(withIdentifier: "detailseg", sender: nil)
    }

    
    @IBAction func addExpense(_ sender: Any) {
        
        do {
            let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
            
            player.play()
        }
        catch {
            
        }
        
        let actionsheet = UIAlertController(title: "Choose the Category", message: nil, preferredStyle: .actionSheet)
//     action 1 started
        
        let action1 = UIAlertAction(title: "Food", style: .default, handler: {_ in
            
            let alert = UIAlertController(
                title: "Add your Expense", message: nil, preferredStyle: .alert)
//       text field
            alert.addTextField { exp1food in
                exp1food.placeholder = "Name of the Expense"
                exp1food.textColor = UIColor.systemPink
                exp1food.keyboardType = .default
            }
            
            alert.addTextField { exp2food in
                exp2food.placeholder = "Enter Amount"
                exp2food.textColor = UIColor.systemTeal
                exp2food.keyboardType = .numberPad
            }
            
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] _ in
                
                do {
                    let s = Bundle.main.path(forResource: "addExpense", ofType: "mp3")
                    
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                    
                    player.play()
                }
                catch {
                    
                }
                
                let field = alert.textFields
                let textField1 = field![0]
                let textField2 = field![1]
                
                if let key = textField1.text, let vall = textField2.text {
                    food.append(["key": key, "value": vall])
                }
                
                print(food)
                
                
                updateSumLabel()
                
                print("food = \(foodsum)")
                print("total = \(totalsum)")
                
                self.performSegue(withIdentifier: "detailseg", sender: nil)
                
                
            }))
            
            self.present(alert, animated: true)
    })
        
        let action2 = UIAlertAction(title: "Travel", style: .default, handler: {_ in
            
            
            let alert = UIAlertController(
                title: "Add your Expense", message: nil, preferredStyle: .alert)
           
            alert.addTextField { exp1travel-> Void in
                exp1travel.placeholder = "Name of the Expense"
                exp1travel.textColor = UIColor.brown
                exp1travel.keyboardType = .default
            }
            
            alert.addTextField { exp2travel-> Void in
                exp2travel.placeholder = "Enter Amount"
                exp2travel.textColor = UIColor.green
                exp2travel.keyboardType = .numberPad
            }
            
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
                
                do {
                    let s = Bundle.main.path(forResource: "addExpense", ofType: "mp3")
                    
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                    
                    player.play()
                }
                catch {
                    
                }
                
                guard let field = alert.textFields else {return}
                let textField1 = field[0]
                let textField2 = field[1]
                
                if let key = textField1.text, let vall = textField2.text {
                    travel.append(["key": key, "value": vall])
                }
                
                self.updateSumLabel()
                
                print("travel = \(travelsum)")
                print("total = \(totalsum)")
                
                self.performSegue(withIdentifier: "detailseg", sender: nil)
                
                
            }))
            
            self.present(alert, animated: true)
            
            
        })
        
        let action3 = UIAlertAction(title: "Party", style: .default, handler: {_ in
            
            
            let alert = UIAlertController(
                title: "Add your Expense", message: nil, preferredStyle: .alert)
           
            alert.addTextField { exp1party-> Void in
                exp1party.placeholder = "Name of the Expense"
                exp1party.textColor = UIColor.brown
                exp1party.keyboardType = .default
            }
            
            alert.addTextField { exp2party-> Void in
                exp2party.placeholder = "Enter Amount"
                exp2party.textColor = UIColor.green
                exp2party.keyboardType = .numberPad
            }
            
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
                
                do {
                    let s = Bundle.main.path(forResource: "addExpense", ofType: "mp3")
                    
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                    
                    player.play()
                }
                catch {
                    
                }
                
                guard let field = alert.textFields else {return}
                let textField1 = field[0]
                let textField2 = field[1]
                
                if let key = textField1.text, let vall = textField2.text {
                    party.append(["key": key, "value": vall])
                }
                
                self.updateSumLabel()
                
                print("party = \(partysum)")
                print("total = \(totalsum)")
                
                self.performSegue(withIdentifier: "detailseg", sender: nil)
                
                
            }))
            
            self.present(alert, animated: true)
            
        })
        
        let action4 = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionsheet.addAction(action1)
        actionsheet.addAction(action2)
        actionsheet.addAction(action3)
        actionsheet.addAction(action4)
        
        present(actionsheet, animated: true)
        
        
    }
    
    @IBAction func logout(_ sender: Any) {
    }
    
    
    @IBAction func logout2(_ sender: Any) {
        performSegue(withIdentifier: "h2l", sender: nil)
        
    }
    @IBAction func lastbtn(_ sender: Any) {
        performSegue(withIdentifier: "h2last", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailseg" {
            
            let dest = segue.destination as! TableViewController
            
            dest.food2 = food
            
            dest.travel2 = travel
            
            dest.party2 = party
        }
        
        else if segue.identifier == "h2l" {
            
            let dest = segue.destination as! LoginViewController
            
            dest.cred = cre
        }
    }
    
}

