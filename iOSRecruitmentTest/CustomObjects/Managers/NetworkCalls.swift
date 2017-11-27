//
//  NetworkCalls.swift
//  SeekerSwift1
//
//  Created by Mian Umair Nadeem on 11/01/2017.
//  Copyright © 2017 Mian Umair Nadeem. All rights reserved.
//

import UIKit
import Alamofire

class NetworkCalls: NSObject {
    
    private var isPost:Bool!
    private var link:String = ""
    private var notificationName:String = ""
    private var params = [String : String]()
    private var header = [String : String]()
    var delegate : NetworkProtocol!
    
    init(link:String ,notificationName:String , params:[String : String] , header:[String : String] , addUSerID:Bool)
    {
        self.link = Constants.baseUrl+link
        self.notificationName = notificationName
        self.params = params
        self.header = header
        
        if(addUSerID){
            self.params["access_token"] = UserDefaults.standard.object(forKey: Constants.kToken) as? String
        }
        
    }
    
    public func getAPICall() ->Void
    {
        print("Link : \(link)")
        print("header : \(header)")
        print("params : \(params)")
        
        
        Alamofire.request(link, method: .get, parameters: params, headers: header).response
            {
                response in
                
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Error: \(String(describing: response.error))")
                print("Data: \(String(describing: response.data))")
                
                if((response.error) != nil){
                    
                    var responseJSON = Constants.jsonStandard()
                    responseJSON["message"] = "-11" as AnyObject
                    self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: responseJSON)
 
                }else{
                    
                    let statusCode = (response.response?.statusCode)!
                    print("         ----------------    The Status Code     --------    \(statusCode)")
                    
                    do
                    {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers)
                        // print("The Original Data is :: \(responseJSON)")
                        if responseJSON is NSArray
                        {
                            var finalResponse = Constants.jsonStandard()
                            finalResponse["data"] = responseJSON as! NSArray
                            self.delegate.apiCallBack(apiName: self.notificationName, apiResponse:finalResponse)
                        }else
                        {
                            self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: (responseJSON as! Constants.jsonStandard))
                        }
                        
                    }
                    catch
                    {
                        print(error)
                    }
                    
                }
                
        }
        
        
    }
    
    public func postAPICall() ->Void
    {
        
        let request = Alamofire.request(link, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
         //   let validation = request.validate()
        print("\(params)")
            request.response
            {
                response in
                
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Error: \(String(describing: response.error))")
                //print("Data: \(String(describing: response.data))")
                
                if((response.error) != nil){
                    
                    var responseJSON = Constants.jsonStandard()
                    responseJSON["msg"] = "Something went wrong while fetching data from server." as AnyObject
                    let errorString = response.error?.localizedDescription
                    if((errorString?.characters.count)! > 0){
                        responseJSON["message"] = errorString! as AnyObject
                    }
                    self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: responseJSON)
                    
                }else{
                    
                    let statusCode = (response.response?.statusCode)!
                    print("         ----------------    The Status Code     --------    \(statusCode)")
                    
                    do
                    {
                        let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! Constants.jsonStandard
                        //print("The Original Data is :: \(responseJSON)")
                        self.delegate.apiCallBack(apiName: self.notificationName, apiResponse: responseJSON)
                    }
                    catch
                    {
                        print(error)
                    }
                }
                
        }
        
    }
    
    

}

