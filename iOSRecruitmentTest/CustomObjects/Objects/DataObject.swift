//
//  DataObject.swift
//  iOSRecruitmentTest
//
//  Created by Mian Umair Nadeem on 22/11/2017.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import UIKit

class DataObject: NSObject {
    
    var idd:String?
    var name:String?
    var desc:String?
    var icon:String?
    var timestamp:String?
    var url:String?
    

    init(basicInfo: Constants.jsonStandard) {
        if basicInfo["id"] is String{
            idd = basicInfo["id"] as? String
        }else if basicInfo["id"] is NSNumber{
            let idInNumber = basicInfo["id"] as? NSNumber
            idd = String(describing: idInNumber)
        }
        name = basicInfo["name"] as? String
        desc = basicInfo["description"] as? String
        icon = basicInfo["icon"] as? String
        timestamp = basicInfo["timestamp"] as? String
        url = basicInfo["url"] as? String
    }
    
    func printMySelf() -> Void{
        print("id : \(String(describing: self.idd))")
        print("name : \(String(describing: self.name))")
        print("description : \(String(describing: self.description))")
        print("icon : \(String(describing: self.icon))")
        print("url : \(String(describing: self.url))")
    }

}
