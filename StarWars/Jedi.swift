//
//  Jedi.swift
//  StarWars
//
//  Created by Johann Kerr on 10/20/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Jedi{
    var name:String
    var height: String
    //    var hairColor: String
    //    var skinColor:String
    
    init(dict: JSON){
        self.name = dict["name"].stringValue
        self.height = dict["height"].stringValue
        
    }
    
    init(name:String, height:String){
        self.name = name
        self.height = height
    }
}

