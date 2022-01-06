import UIKit

class ViewController: UIViewController {
    let queue = DispatchQueue(label: "demo")
    let link = "https://jsonplaceholder.typicode.com/todos"
    
    @IBOutlet weak var readyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        queue.async{
            DispatchQueue.main.async {
                self.readyLabel.text = "fertig"
            }
        }
    }
    func dwnload() {
        if let url = URL(string: link) {
            let data = try? Data(contentsOf: url)
            print("data: \(data)")
            if let jsonObject = try? JSONSerialization.data(withJSONObject: data, options: []){
                if let array = jsonObject as? [[String: Any]]{
                    for obj in array {
                        let id = obj[id] as! Int
                        let tilte = obj["title"]
 as!                        print("obj=\(id)
                              
                    }
            } else {
                print("ka json")
            }
        } else {
            print("failed to download")
        }
    }
}
}


