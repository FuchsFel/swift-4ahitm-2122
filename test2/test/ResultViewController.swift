//
//  ResultViewController.swift
//  test
//
//  Created by Fuchshuber Felix on 12.11.21.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultMessage: UILabel!
    var model : Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultMessage.text = "You needed \(model.counterOfTrys) tries"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
