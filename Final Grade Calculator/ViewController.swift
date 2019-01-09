//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by Ethan Chang on 10/2/18.
//  Copyright © 2018 SomeAweApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelOut: UILabel!
    @IBOutlet weak var currText: UITextField!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var finalText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MVP
   
    //Stretch 1
    @IBAction func segControlFunc(_ sender: Any) {
        view.endEditing(true)
        //add +/- ???
        var desired = 0.0;
        switch(segControl.selectedSegmentIndex){
        case 0: desired = 90.0;
        case 1: desired = 80.0;
        case 2: desired = 70.0;
        case 3: desired = 60.0;
        case 4: desired = 50.0;
        case 5: desired = 40.0;
        default: desired = 0.0;
        }
        if let current = Double(currText.text!){
            if let finalPercent = Double(finalText.text!){
                if finalPercent == 0 {
                    labelOut.text = "Don't Bother"
                }else{
                    let normPercent = (100-finalPercent)/100
                    var needed = (desired-(current*normPercent)) / (finalPercent/100)
                    needed.round()
                    changeBackground(sender: needed,desi:desired)
                }
            }
        }
    }
    func changeBackground(sender:Double,desi: Double){
        if(sender > 100.0){
            self.view.backgroundColor = .red
            //alert msg(Chap 3)
            let alert = UIAlertController(title: "Warning", message: "You need over a hundred percent on your final to get \(desi)% overall.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.");self.view.backgroundColor = .red;
                self.currText.becomeFirstResponder();
            }))
            
            self.present(alert, animated: true, completion: nil)
            //
            labelOut.text = "You need \(sender)% on your final, give up."
            
        }else{
            self.view.backgroundColor = .green
            if (sender == 100.0){
                labelOut.text = "You need \(sender)% on your final, good luck!"
            }else if (sender >= 90){
                labelOut.text = "You need \(sender)% on your final, study hard!"
            }else if (sender >= 80){
                labelOut.text = "You need \(sender)% on your final, you can do it!"
            }else if (sender >= 70){
                labelOut.text = "You need \(sender)% on your final, I guess you can study"
            }else if (sender >= 60){
                labelOut.text = "You need \(sender)% on your final, don't worry"
            }else if(sender >= 50){
                labelOut.text = "You need \(sender)% on your final, study for this later"
            }else if (sender >= 40){
                labelOut.text = "You need \(sender)% on your final, study for this last"
            }else if (sender >= 30){
                labelOut.text = "You need \(sender)% on your final, just go take the final"
            }else if (sender >= 20){
                labelOut.text = "You need \(sender)% on your final, go to sleep right now"
            }else if (sender >= 10){
                labelOut.text = "You need \(sender)% on your final, take a nap during the test"
            }else if(sender > 0){
                labelOut.text = "You need \(sender)% on your final, don't bother showing up"
            }else if(sender <= 0){
                labelOut.text = "You need \(sender)% on your final, well..."
                self.view.backgroundColor = .gray
            }
        }
    }
}
