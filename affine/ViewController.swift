//
//  ViewController.swift
//  affine
//
//  Created by Eslam Moemen on 12/13/18.
//  Copyright © 2018 Eslam Moemen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var decimalFactorTextInput: UITextField!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var range: UITextField!
    @IBOutlet weak var key: UITextField!
    
    var alphabetDictionary: [Character:Int] = [
        "A": 0, "B": 1, "C": 2, "D": 3,"E"  : 4,"F" : 5,"G" : 6,"H": 7,"I": 8,"J" : 9,"K" : 10,"L" : 11,"M" : 12,"N" : 13,"O": 14,"P": 15,"Q" : 16,"R" : 17,"S" : 18,"T" : 19,"U" : 20,"V" : 21,"W" : 22,"X" : 23,"Y" : 24,"Z":25]
   
    var editedAlphabet: [Character:Int] = ["Q":16, "W":22, "E":4, "R":17, "T":19 , "Y":24]
    
    var value = 0
    var char = [Character]()
    var numbers = [Int]()
    var result = [Int]()
    var letters = [Character]()
    var trash = [Character]()
    var arrCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    func stringToChar () {
        
        let string : String = textField.text!
        let characters = Array(string)
        self.arrCount = characters.count
        for i in 0...(characters.count)-1 {
            
            
                char.append(characters[i])
            
           }
        print(char)
    
    }

    func gcd(a:Int, b:Int) -> Int {
        
        if a == b {
            return a
        }
        else {
            if a > b {
                return gcd(a:a-b,b:b)
                
            } else {
                return gcd(a:a,b:b-a)
                
            }
        }}
    
    

    func motherMethod (){
        
        if gcd(a: Int(decimalFactorTextInput.text!)! , b: 26) == 1 {
            for i in 0...char.count-1 {
            for (key,number) in editedAlphabet {
            
                if char[i] == key {
                   numbers.append(number)
                    
                }
                }
                
                if editedAlphabet.index(forKey: char[i]) == nil {
                    
                    trash.append(char[i])
                }
                
            }
            textView.text.append("\(trash)doesn't exist \n")
          
            
                    // c=((deciamlfactor*plaintext)+key)mod size
                    
                    for i in 0...numbers.count-1 {
                       result.append(((Int(decimalFactorTextInput.text!)! * numbers[i]) + Int(key.text!)!) % Int(range.text!)!)
                       
                   }
            
            for i in 0...result.count-1 {
                for (key,number) in alphabetDictionary {
                    
                    if result[i] == number {
                       textView.text.append(key)

                        
                    }
                    
                }
                
            }
        
        }
   
        
            
        }

    
    @IBAction func go(_ sender: UIButton) {
         textView.text.removeAll()
         stringToChar()
         motherMethod()
         result.removeAll()
         numbers.removeAll()
         char.removeAll()
        
    }
    
    
   
    
}

