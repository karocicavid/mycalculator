//
//  ViewController.swift
//  Calculator
//
//  Created by student on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var Lastnum : Double = 0;
    var firstnum : Double = 0;
    var Operation : Int = 0;
    var Checksign : Bool = false;
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func Numbers(_ sender: UIButton) {
        if Checksign == true{
            textfield.text = String(sender.tag)
            Checksign = false
        }
        else{
            textfield.text = textfield.text! + String(sender.tag)
        }
        Lastnum = Double(textfield.text!)!
    }
    @IBAction func Signs(_ sender: UIButton) {
        if textfield.text != "" && sender.tag != 10 && sender.tag != 15{
            firstnum = Double(textfield.text!)!
            
            if sender.tag == 11{ //add
                textfield.text = "+"
                Checksign = true
            }
            else if sender.tag == 12{ //subtract
                textfield.text = "-"
                Checksign = true
            }
            else if sender.tag == 13{ //divide
                textfield.text = "/"
                Checksign = true
            }
            else if sender.tag == 14{ //multiply
                textfield.text = "*"
                Checksign = true
            }
            Operation = sender.tag
            Checksign = true;
        }
        else if sender.tag == 15 {
            if Operation==11{
                textfield.text = String(firstnum + Lastnum)
            }
            else if Operation==12{
                textfield.text = String(firstnum - Lastnum)
            }
            else if Operation==13{
                if Lastnum == 0 {
                    textfield.text = "Divide by Zero"
                }
                else{
                    textfield.text = String(firstnum / Lastnum)
                }
            }
            else if Operation==14{
                textfield.text = String(firstnum * Lastnum)

        }
        }
        else if sender.tag == 10 {
            firstnum = 0;
            Lastnum = 0;
            Operation = 0;
            Checksign = false;
            textfield.text = "";
        }
    
}

}
