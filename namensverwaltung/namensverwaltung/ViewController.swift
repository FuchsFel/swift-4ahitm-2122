//
//  ViewController.swift
//  namensverwaltung
//
//  Created by AHITM05 on 07.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var firstnameButton: UITextField!
    @IBOutlet weak var lastnameButton: UITextField!
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isEnabled = false
    }
    
    @IBAction func onChangeVN(_ sender: UITextField) {
        print("vn changed")
        changeSubmitButtonEnable()
    }
    
    @IBAction func onChangeNN(_ sender: UITextField) {
        print("nn changed")
        changeSubmitButtonEnable()
    }
    
    func changeSubmitButtonEnable() {
        if (firstnameButton.text == nil || firstnameButton.text == "" || lastnameButton.text == nil || lastnameButton.text == "") {
            submitButton.isEnabled = false
        }else {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        print("Button clicked")
        model.add(vname: firstnameButton.text, nname: lastnameButton.text)
        firstnameButton.text = ""
        lastnameButton.text = ""
        changeSubmitButtonEnable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as? TableViewController
        resultViewController?.model = model
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
}

