//
//  ViewController.swift
//  helloworld
//
//  Created by AHITM05 on 20.01.22.
//

import UIKit



class ViewController: UIViewController {

    var model:Model = Model()
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.isEnabled = false
    }

    @IBAction func onclickSubmit(_ sender: UIButton) {
        if let name = nameTextField.text{
            if let comment = commentTextField.text{
                if name != "" && comment != ""{
                    model.names.append(name)
                    model.comments.append(comment)
                    nameTextField.text = ""
                    commentTextField.text = ""
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? TableViewController
        if let controller = viewController{
            controller.model = self.model
        }
    }
    
    @IBAction func OnchangedComment(_ sender: UITextField) {
        checkSubmitEnabled()
    }
    
    @IBAction func OnchangeName(_ sender: UITextField) {
        checkSubmitEnabled()
    }
    
    func checkSubmitEnabled(){
        if let name = nameTextField.text{
            if let comment = commentTextField.text{
                if name != "" && comment != ""{
                    submitButton.isEnabled = true
                    return
                
                }
            }
        }
        submitButton.isEnabled = false
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(identifier)
        return true
    }

    
}

