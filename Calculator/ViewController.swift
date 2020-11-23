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

    @IBOutlet weak var textfield: UILabel!
    
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
            else if sender.tag == 16{ //percent
                if firstnum != 0 {
                    firstnum = firstnum / 100
                    textfield.text = String(firstnum)
                }
                else if firstnum == 0 && Lastnum != 0 {
                    Lastnum = Lastnum / 100
                    textfield.text = String(Lastnum)
                }

            }
            else if sender.tag == 17{ //back
                var myint : Int;
                if firstnum != 0 {
                    myint = Int(firstnum)/10
                    textfield.text = String(myint)
                    firstnum = Double(myint)
                }
                else if firstnum == 0 && Lastnum != 0 {
                    myint = Int(Lastnum)/10
                    textfield.text = String(myint)
                    firstnum = Double(myint)
                }
            }
            else if sender.tag == 18{ //square
                var myint : Int;
                if firstnum != 0 {
                    firstnum = firstnum * firstnum
                    textfield.text = String(firstnum)
                }
                else if firstnum == 0 && Lastnum != 0 {
                    Lastnum = Lastnum * Lastnum
                    textfield.text = String(Lastnum)
                }
            }
            else if sender.tag == 19{ //negative
                if firstnum != 0 {
                    firstnum = firstnum * -1
                    textfield.text = String(firstnum)
                }
                else if firstnum == 0 && Lastnum != 0 {
                    Lastnum = Lastnum * -1
                    textfield.text = String(Lastnum)
                }

            }
            Operation = sender.tag
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
