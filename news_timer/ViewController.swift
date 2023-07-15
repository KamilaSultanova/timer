//
//  ViewController.swift
//  news_timer
//
//  Created by Kamila Sultanova on 14.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var button: UIButton!
    
    var array = ["Елена Рыбакина проиграла в 1/4 финала Уимблдона","В США поделились ожиданиями от дебюта Азата Максума в UFC","Клуб Криштиану Роналду получил трансферный бан от ФИФА","\"Астана\" назвала состав на матч Лиги чемпионов","Главный тренер \"Реала\" предстанет перед судом - СМИ","Зайнутдинов получил высокую оценку в матче за Суперкубок России","Анчелотти рассказал о последствиях перехода Месси в США"]
    var items: [String] = []
    var timer: Timer?
    var timeState:Bool = false
    var dates: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        
        
    }
    
    
    @objc func timeFired(){
        if array.count == 0{
            return
        }else{
            items.insert(array[0], at: 0)
            array.remove(at: 0)

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            let date = dateFormatter.string(from: Date())
            dates.insert(date, at: 0)
            
            tableview.reloadData()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.textLabel!.font = UIFont.systemFont(ofSize: 14.0)
        cell.textLabel?.text = "\(items[indexPath.row])\n\(dates[indexPath.row])"
        
        
        return cell
    }
    
    
    
    @IBAction func buttonTouched(_ sender: Any) {
        if timeState{
            timer?.invalidate()
            timer = nil
        }else{
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timeFired), userInfo: nil, repeats: true)
        }
        timeState.toggle()
    }


}

