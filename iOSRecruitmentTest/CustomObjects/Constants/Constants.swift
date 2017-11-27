//
//  Constants.swift
//  SeekerSwift1
//
//  Created by Mian Umair Nadeem on 11/01/2017.
//  Copyright © 2017 Mian Umair Nadeem. All rights reserved.
//

import Foundation

struct Constants
{

    static let baseUrl:String = "https://nimbl3-survey-api.herokuapp.com/"
    typealias jsonStandard = [String : AnyObject]
    typealias dictionaryStandard = [String : String]
    
    static let kToken:String = "access_token"
    static let dispayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName")
    
}
