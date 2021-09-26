//
//  ViewController.swift
//  TaskExample
//
//  Created by ssd on 9/26/21.
//

import UIKit

class JodViewController: UIViewController {

    
    @IBOutlet var jokeLabel : UILabel!
    @IBOutlet var jokeDescription : UILabel!
    var jokeIndex : Int = 0
    var jokeOfDay : [JokeElement]!{
        didSet{
            DispatchQueue.main.async {
                self.jokeLabel.text = self.jokeOfDay[self.jokeIndex].joke.title
                self.jokeDescription.text = self.jokeOfDay[self.jokeIndex].joke.text
//                self.tableView.reloadData()
//                self.navigationItem.title = "\(self.holidayList.count): Holidays found"
            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func didTapButton(){
//        let vc = UIViewController()
        jokeOneGenerator()
        
//        vc.view.backgroundColor = .red
//        navigationController?.pushViewController(vc, animated: true)
    }
    func nextJoke(){
        if self.jokeOfDay.count > self.jokeIndex{
            self.jokeIndex+=1
//            print(self.jokeIndex)
        }
            
    }
    func jokeOneGenerator(){
        guard let url = URL(string: "https://api.jokes.one/jod") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url){
            data, response, error in
            guard let data = data else{
                print(error?.localizedDescription)
                return
            }
            do{
                let temp: JokesOne = try! JSONDecoder().decode(JokesOne.self, from: data)
                self.jokeOfDay = temp.contents.jokes
                //print(self.jokeOfDay.count)
                //self.jokeLabel.text = self.jokeOfDay[0].jokeDescription
            }catch{
                print(error)
            }
            
        }
        task.resume()
    }
}


