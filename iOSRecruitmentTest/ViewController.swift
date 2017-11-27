//
//  ViewController.swift
//  iOSRecruitmentTest
//
//  Created by Bazyli Zygan on 15.06.2016.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, NetworkProtocol {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        self.callAPI()
    }

    // MARK: - Functions
    
    
    // MARK: - APICalls
    func callAPI(){
        let url:String = ApiLinks.itemsList
        let params = Constants.dictionaryStandard()
        let header = Constants.dictionaryStandard()
        
        let obj = NetworkCalls(link:url , notificationName:ApiLinks.itemsList, params:params , header:header, addUSerID:false)
        obj.delegate = self
        obj.getAPICall()
    }
    
    // MARK: - APICallBacks
    func apiCallBack(apiName: String, apiResponse: [String : AnyObject]) {
        if(apiName == ApiLinks.itemsList){
            
        }
    }
    
    // MARK: - UITableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.item = nil
        
        return cell
    }
    
    
    
}
