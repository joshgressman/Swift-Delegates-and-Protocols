//
//  ViewController.swift
//  Delegates and Protocals
//
//  Created by Josh Gressman on 2/2/18.
//  Copyright © 2018 Josh Gressman. All rights reserved.
//

import UIKit
//declair the protocols that the class needs to conform to
class FirstViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeToBlue(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        //perform segue function
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    //Set up the segue function type prepare to populate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {
          
            let secondVC = segue.destination as! SecondViewController
            
            //this is how the data in the text field is sent to the secondView Controller
            secondVC.data = textField.text!
            
            secondVC.delegate = self
        }
    }
    
    //function implemented to conform form the protocal in secondViewController / delegate recievs data
    func dataReceived(data: String) {
       label.text = data
    }
}

