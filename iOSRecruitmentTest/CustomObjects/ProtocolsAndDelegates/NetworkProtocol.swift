//
//  NetworkCallProtocol.swift
//  SurveyProject
//
//  Created by Mian Umair Nadeem on 23/10/2017.
//  Copyright © 2017 Mian Umair Nadeem. All rights reserved.
//

import Foundation

// This file is the generic Protocol for calling API's.
// Any class that will hit API's will implement these protocols
protocol NetworkProtocol{
    func apiCallBack(apiName:String , apiResponse:[String : AnyObject])
    //func apiCallBackWithArray(apiName:String , apiResponse:[AnyObject])
}
