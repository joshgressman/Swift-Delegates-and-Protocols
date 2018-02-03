//
//  SecondViewController.swift
//  Delegates and Protocals
//
//  Created by Josh Gressman on 2/2/18.
//  Copyright © 2018 Josh Gressman. All rights reserved.
//

import UIKit

//protocol implemented to send data back to the first view controller
//protocol set ups the rules for engaging
protocol CanReceive {
    //requred method
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {

    //Initialize the required protocol / delegating
    var delegate : CanReceive?
    
    //data being passed from firstViewController
    var data = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func sendBackData(_ sender: Any) {
        delegate?.dataReceived(data: textField.text!)
        //navigate to first view controller
        dismiss(animated: true, completion: nil)
    }
}
