//
//  ViewController.swift
//  test
//
//  Created by Holzer Teresa on 17.09.21.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonGuess: UIButton!
    @IBOutlet weak var alreadyGuessedNumbers: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.numberToGuess = Int(arc4random_uniform(100));
        label.text = "Try to guess the number!"
        
        print(model.numberToGuess)
    }
    
    @IBAction func onChangeTextField(_ sender: UITextField) {
        if(model.isValid(guess: Int(textField.text!))){
            buttonGuess.isEnabled = true
            alreadyGuessedNumbers.isEnabled = true
        } else {
            buttonGuess.isEnabled = false
            alreadyGuessedNumbers.isEnabled = false
        }
        
        buttonGuess.isEnabled = model.isValid(guess: Int(textField.text!))
    }
    
    @IBAction func onclick(_ sender: UIButton) {
        let guess = Int(textField.text!)!
        model.addGuessedNumber(guess: guess)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let tableViewController = segue.destination as? ResultTableViewController
        tableViewController?.model = model
    }
    
    func compare(guessedString: String) -> Int! {
        let guess = Int(guessedString)!
        return model.compare(guess: guess)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(checkNumber()){
            return true
        }
        print("no")
        return false
    }
    
    func checkNumber() -> Bool{
        var compareResult = compare(guessedString: textField.text!)
            
            let text: String?
            
            switch compareResult {
            case -1:
                text = "Your number is to low"
                label.text = text
                return false
            case 1:
                text = "Your number is too high"
                label.text = text
                return false
            default:
                text = "Hurray! Thats the number!"
                label.text = text
                return true
            }
        return false
        }
    }

