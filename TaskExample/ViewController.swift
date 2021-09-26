//
//  ViewController.swift
//  TaskExample
//
//  Created by ssd on 9/26/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tableView :UITableView!
    @IBOutlet var tableCell :UITableViewCell!
    @IBOutlet weak var searchBar: UISearchBar!
    var countryCode : String = "mn"{
        didSet{
//            holidayGenerator()
            print(self.countryCode)
        }
    }
    var holidayList = [Holiday](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
//                self.navigationItem.title = "\(self.holidayList.count): Holidays found"
            }
           
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        holidayGenerator()
        // Do any additional setup after loading the view.
    }

    func holidayGenerator(){
        
        guard let url = URL(string: "https://calendarific.com/api/v2/holidays?&api_key=a5c11a6f8708999ecf1340665323eedda8d3f01f&country=\(self.countryCode)&year=2021") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url){
            data, response, error in
            guard let data = data else{
                print(error?.localizedDescription)
                return
            }
            do{
                let temp: Holidays = try! JSONDecoder().decode(Holidays.self, from: data)
                self.holidayList = temp.response.holidays
            }catch{
                print(error)
            }
            
        }
        task.resume()
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holidayCell", for: indexPath)
        let holiday = holidayList[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
//        print(holiday.date.iso)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.holidayList.count
    }
}

extension ViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        //print (searchBarText)
        self.countryCode = searchBarText
    }
}
