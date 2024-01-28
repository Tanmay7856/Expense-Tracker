//
//  SignUpViewController.swift
//  Expense Tracker
//
//  Created by Tanmay Rai on 31/10/23.
//

import UIKit

import AVKit

class SignUpViewController: UIViewController {
    
    var credentials = [String:String]()
    
    @IBOutlet weak var newpass: UITextField!
    
    @IBOutlet weak var retype: UITextField!
    @IBOutlet weak var newuser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(credentials)
        
        newpass.isSecureTextEntry = true
        retype.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signup(_ sender: Any) {
        
        do {
            let s = Bundle.main.path(forResource: "authentication", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
            
            player.play()
        }
        catch {
            
        }
        
        if retype.text != newpass.text {
            
            let alert = UIAlertController(title: "Re enter Password", message: "Please enter same password in both the text fields", preferredStyle: .alert)
            
            let btn = UIAlertAction(title: "Retry", style: .cancel, handler: {_ in 
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
        
        if newuser.text != "" && newpass.text != "" && retype.text != "" {
            
            credentials[newuser.text!] = newpass.text!
            
            let alert = UIAlertController(title: nil, message: "Successfully Signed Up", preferredStyle: .alert)
            
            let btn = UIAlertAction(title: "Go to Log In", style: .default, handler: { [self]_ in
                
                do {
                    let s = Bundle.main.path(forResource: "buttontap", ofType: "mp3")
                    
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: s!) as URL)
                    
                    player.play()
                }
                catch {
                    
                }
                
                print(credentials)
                
                performSegue(withIdentifier: "s2l", sender: nil)
            
            })
        
            alert.addAction(btn)
            
            present(alert, animated: true)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "s2l"{
            
            let dest = segue.destination as! LoginViewController
            
            dest.cred = credentials
            
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
