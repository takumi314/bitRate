//
//  APIViewController.swift
//  bitRate
//
//  Created by NishiokaKohei on 2016/09/30.
//  Copyright © 2016年 NishiokaKohei. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

private let API_TRADES_HISTORY = "https://api.zaif.jp/api/1/trades/btc_jpy"
private let API_LAST_PRICE = "https://api.zaif.jp/api/1/last_price/btc_jpy"

class APIViewController : UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var table : UITableView!
    var dataPrices = [[String:AnyObject]]()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JPY/BTC"
        
        getAPI()
        
    }
    
    
    // MARK: - API
    
    func getAPI() {
        Alamofire.request(.GET, API_TRADES_HISTORY)
            .responseJSON { (responseData) -> Void in
                if responseData.result.value != nil {
                    let swiftyJasonVar = JSON(responseData.result.value!)
                    self.getData(swiftyJasonVar)
                }
        }
    }

    func getData(swifyJSON:JSON) {
        if let data = swifyJSON.arrayObject {
            self.dataPrices = data as! [[String:AnyObject]]
            print(swifyJSON)
        }
        self.refreshTable()
    }
    
    func refreshTable() {
        if self.dataPrices.count > 0 {
            self.table.reloadData()
        }
    }
    
    // MARK: - UITableView
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : BitTableViewCell
            = tableView.dequeueReusableCellWithIdentifier("bitCell", forIndexPath: indexPath) as! BitTableViewCell
        var currncies = dataPrices[indexPath.row]
        cell.lastPriceLabel.text = currncies["price"]?.description
        cell.dateLabel.text = currncies["date"]?.description
        print(currncies["date"])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPrices.count
    }
        

}



