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
    
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JPY/BTC"
        
        table.frame = view.frame
        view.addSubview(table)
        
        getAPI()
    }
    
    func getAPI() {
        Alamofire.request(.GET, "https://api.zaif.jp/api/1/last_price/btc_jpy")
            .responseJSON { response in
                print(response.result.value)
        }
    }
    
    
    
}
