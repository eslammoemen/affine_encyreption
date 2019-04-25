//
//  aViewController.swift
//  affine
//
//  Created by Eslam Moemen on 12/13/18.
//  Copyright © 2018 Eslam Moemen. All rights reserved.
//

import UIKit

class aViewController: UIViewController {
    @IBOutlet weak var decmfactor: UITextField!
    @IBOutlet weak var cyper: UITextField!
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var range: UITextField!
    @IBOutlet weak var textView: UITextView!

    var final = [Character]()
    var cyperArr = [Character]()
    var charCount = 0
    var result = [Int]()
    var numbers = [Int]()
    var localMMI = 0
    var trash = [Character]()
    
    override func viewDidLoad() { super.viewDidLoad() }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true) }
    
    var alphabetDictionary: [Character:Int] = [
        "A": 0, "B": 1, "C": 2, "D": 3,"E"  : 4,"F" : 5,"G" : 6,"H": 7,"I": 8,"J" : 9,"K" : 10,"L" : 11,"M" : 12,"N" : 13,"O": 14,"P": 15,"Q" : 16,"R" : 17,"S" : 18,"T" : 19,"U" : 20,"V" : 21,"W" : 22,"X" : 23,"Y" : 24,"Z":25]
   
    var editedAlphabet: [Character:Int] = ["Q":16, "W":22, "E":4, "R":17, "T":19 , "Y":24]
   
    // var MMI: [Int:Int] = [1:1, 3:9, 5:21, 7:15, 9:3, 11:19, 15:7, 17:23, 19:11, 21:5, 23:17, 25:25 ]
    
    func stringToChar () {
    
    let string : String = cyper.text!
    let characters = Array(string)
    
    self.charCount = characters.count
    for i in 0...(characters.count)-1 {
    
    
    cyperArr.append(characters[i]) }
     
    }
    
    func modInverse () {
        let DF = Int(decmfactor.text!)!
        let Range = Int(range.text!)!
        
        
        let temp = DF % Range
        for i in 1..<Range {
            if (temp * i % Range == 1 ){
            localMMI = i
                
            }
            
            
        }
        
        
    }
    
    func charToNumbers (){
        
        for i in 0...cyperArr.count-1 {
            for (key,number) in editedAlphabet {
                
                if cyperArr[i] == key {
                    numbers.append(number)
                    
                }
            }
            if editedAlphabet.index(forKey: cyperArr[i]) == nil {
                
                trash.append(cyperArr[i])
            }
            
        }
        
        textView.text.append("\(trash)doesn't exist \n")
    }
    func equation(){
        var eqresult: Int
        for i in 0...numbers.count-1 {
            // MMI *(cypher - key) mod range
            
          eqresult  = (localMMI * (numbers[i] - Int(key.text!)!) % Int(range.text!)!)
            
            if eqresult < 0 {
                eqresult = eqresult + 26
                
                result.insert(eqresult, at: i)
                
            }else {
             result.insert(eqresult, at: i)
                
            }
        }
        
        
    }
    func indexToChar (){
        
        for i in 0...result.count-1 {
            for (key,number) in alphabetDictionary {
                
                if result[i] == number {
                    textView.text.append(key)
                    
                    
                }
                
            }
            
        }
       
    }
    
    
    
    
    
    @IBAction func decyrpt(_ sender: Any) {
        
        textView.text.removeAll()
        stringToChar()
        charToNumbers()
        modInverse()
        equation()
        indexToChar()
        final.removeAll()
        cyperArr.removeAll()
        numbers.removeAll()
        result.removeAll()
        
    }
    
   
}
