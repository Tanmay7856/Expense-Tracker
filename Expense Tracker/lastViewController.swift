//
//  lastViewController.swift
//  Expense Tracker
//
//  Created by Tanmay Rai on 01/11/23.
//

import UIKit

class lastViewController: UIViewController {

    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var rateimg: UIImageView!
    @IBOutlet weak var rate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func slide(_ sender: UISlider) {
        let x =  Int (sender.value)
        rate.text = "RATE OUR APP: \(x) ⭐"
        
        switch x {
        case 1:
            rateimg.image = UIImage(named: "1")
            
        case 2:
            rateimg.image = UIImage(named: "2")
            
        case 3:
            rateimg.image = UIImage(named: "3")
            
        case 4:
            rateimg.image = UIImage(named: "4")
            
        case 5:
            rateimg.image = UIImage(named: "5")
            
        default:
            rateimg.image = UIImage(named: "2")
        }
        
        
    }
    
    
    @IBAction func advice(_ sender: Any) {
        
        if seg.selectedSegmentIndex == 0{
            let url = URL(string: "https://www.youtube.com/watch?v=dQztF220os0")
            let urlreq = URLRequest(url: url!)
            web.loadRequest(urlreq)
        }
        else if seg.selectedSegmentIndex == 1{
            let url = URL(string: "https://www.youtube.com/watch?v=6aGXr302-k4")
            let urlreq = URLRequest(url: url!)
            web.loadRequest(urlreq)
        }
        else {
            let url = URL(string: "https://www.youtube.com/watch?v=l60ZZYref_w")
            let urlreq = URLRequest(url: url!)
            web.loadRequest(urlreq)
        }
    }

}
