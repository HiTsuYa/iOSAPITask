//
//  ViewController.swift
//  TaskExample
//
//  Created by ssd on 9/26/21.
//

import UIKit
import Foundation

class HomeViewController: UITableViewController{


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 3){
            let url = URL(string: "https://calendarific.com")
            UIApplication.shared.open(url!)
        }
        if(indexPath.row == 4){
            let url = URL(string: "https://jokes.one/api/joke/")
            UIApplication.shared.open(url!)
        }
    }
}


