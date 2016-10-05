//
//  APIViewController.swift
//  bitRate
//
//  Created by NishiokaKohei on 2016/09/30.
//  Copyright © 2016年 NishiokaKohei. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIViewController: UIViewController {
    
    @IBOutlet var table:UITableView!
    var dataPrices = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JPY/BTC"
        
        getAPI()
        
    }
    
    func getAPI() {
        Alamofire.request(.GET, "https://api.zaif.jp/api/1/last_price/btc_jpy")
            .responseJSON { (responseData) -> Void in
             
                if responseData.result.value != nil {
                    let swiftyJasonVar = JSON(responseData.result.value!)
                    self.getData(swiftyJasonVar)
                }
                
            }
    }

    func getData(swifyJSON:JSON) {
        if let data = swifyJSON["last_price"].arrayObject {
            self.dataPrices = data as! [[String:AnyObject]]
        }

        refreshTable()
    }
    
    func refreshTable() {
        if self.dataPrices.count > 0 {
            self.table.reloadData()
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("jsonCell")!
        var currncies = dataPrices[indexPath.row]
        
        cell.textLabel?.text = currncies["last_price"] as? String
        cell.detailTextLabel?.text = currncies["email"] as? String
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPrices.count
    }
        

}



