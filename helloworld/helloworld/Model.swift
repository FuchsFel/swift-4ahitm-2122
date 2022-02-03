//
//  Model.swift
//  helloworld
//
//  Created by AHITM05 on 20.01.22.
//

import Foundation
import UIKit

class Model{
    
    var names = [String]()
    var comments = [String]()
    var link = "https://jsonplaceholder.typicode.com/comments"
    let queue = DispatchQueue(label: "demo")
    
    
    init(){
        queue.async{
            let data = self.download()
            DispatchQueue.main.async{
                self.names = data.0
                self.comments = data.1
                
            }
        }
    }
    
    func download() -> ([String], [String]){
        
        var names = [String]()
        var comments = [String]()
        
        if let url = URL(string: link){
            if let data = try? Data(contentsOf: url){
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []){
                    if let array = jsonObject as? [[String: Any]]{
                        for obj in array {
                            let name = obj["name"] as! String
                            let comment = obj["body"] as! String
                            
                            names.append(name)
                            comments.append(comment)
                        }
                    }
                }
            }
        }
        return (names, comments)
    }
    
}
