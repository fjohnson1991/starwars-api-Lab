//
//  ViewController.swift
//  StarWars
//
//  Created by Johann Kerr on 10/20/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var jediTableView: UITableView!
    var jediArray = [Jedi]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jediTableView.delegate = self
        self.jediTableView.dataSource = self
        
        var randomNumber = Int(arc4random_uniform(20))
        
    
        //print(randomNumber)
        //loadjedi(at: randomNumber)
        loadJedis()
        
    
    }
    
    func loadJedis(){
        Alamofire.request("http://swapi.co/api/people/").responseJSON { (response) in
            if let jsonData = response.data{
                var jsonObj = JSON(data: jsonData)
                var jsonArray = jsonObj["results"].arrayValue
                for jediObj in jsonArray{
                    var jedi = Jedi(dict: jediObj)
                    self.jediArray.append(jedi)
                }
                self.jediTableView.reloadData()
            }
        }
    }
    
    func loadjedi(at number:Int){
        Alamofire.request("http://swapi.co/api/people/\(number)/").responseJSON { response in
            
            // print(response.result.value)
            
            if let jsonData = response.data{
                var jsonObj = JSON(data: jsonData)
                var randomJedi = Jedi(dict: jsonObj)
                
                self.nameLabel.text = randomJedi.name
                
            }
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jediArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        ///let cell = jediTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(jediArray[indexPath.row].name)
        //cell.textLabel?.text = "help"
        return cell
    }
}

