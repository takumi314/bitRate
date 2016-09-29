//
//  APIViewController.swift
//  bitRate
//
//  Created by NishiokaKohei on 2016/09/30.
//  Copyright © 2016年 NishiokaKohei. All rights reserved.
//

import UIKit

class APIViewController: UIViewController {
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "JPY/BTC"
        
        table.frame = view.frame
        view.addSubview(table)
    }
    
    
    
    
}
