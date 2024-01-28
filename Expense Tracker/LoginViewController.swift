//
//  LoginViewController.swift
//  Expense Tracker
//
//  Created by Tanmay Rai on 31/10/23.
//

import UIKit

import AVKit

var player : AVAudioPlayer = AVAudioPlayer()

class LoginViewController: UIViewController {
    
    var cred = [String:String]()

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(cred)
        
        password.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    
    
//  login button
    @IBAction func login(_ sender: Any) {
        
        do {
            let s = Bundle.main.path(forResource: "authentication", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
            
            player.play()
        }
        catch {
            
        }
        
        if cred.isEmpty {
            let alert = UIAlertController(title: "User not Registered", message: "Please sign up first", preferredStyle: .alert)
            
            let btn = UIAlertAction(title: "OK", style: .cancel, handler: {_ in 
                do {
                    let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
                    
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                    
                    player.play()
                }
                catch {
                    
                }
            })
        
            alert.addAction(btn)
            
            present(alert, animated: true)
        }
        
        if user.text != "" && password.text != ""{
            for(key, value) in cred {
                if key==user.text && value==password.text {
                    
                    performSegue(withIdentifier: "l2h", sender: nil)
                }
            }
        }
        else {
            
            let alert = UIAlertController(title: "Invalid Details", message: "Please enter valid details", preferredStyle: .alert)
            
            let btn = UIAlertAction(title: "OK", style: .cancel, handler: {_ in 
                do {
                    let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
                    
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                    
                    player.play()
                }
                catch {
                    
                }
            })
        
            alert.addAction(btn)
            
            present(alert, animated: true)
        }

    }
    
    
    @IBAction func logintosign(_ sender: Any) {
        
        do {
            let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
            
            player.play()
        }
        catch {
            
        }
        
        performSegue(withIdentifier: "l2s", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "l2h" {
            let dest = segue.destination as! ViewController
            
            dest.userName = user.text!
            dest.cre = cred
        }
        
        else if segue.identifier == "l2s"{
            let dest = segue.destination as! SignUpViewController
            
            dest.credentials = cred
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
