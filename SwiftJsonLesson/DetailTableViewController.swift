//
//  DetailTableViewController.swift
//  SwiftJsonLesson
//


import Foundation

import UIKit
import SwiftyJSON
import RealmSwift
import Alamofire

class DetailTableViewController: UITableViewController {
    
    var detailSegue = ""  //получаем имя города из TableView...
    var weatherList = [WeatherListClass]()
    let managerData = ManagerData() //создаем объект
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Погода в \(detailSegue)"
        print(detailSegue)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 39
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let detail = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath)
        // Configure the cell...
    
        managerData.getJsonDataFromUrl2(name: detailSegue) {
            [weak self]  weatherList in
            //self?.weatherList = weatherList
            detail.textLabel?.text = "\(weatherList[indexPath.row].temperature)°C and \(weatherList[indexPath.row].humidity)% \(weatherList[indexPath.row].weather)"
            //detail.detailTextLabel?.text = "\(weatherList[indexPath.row].dt_txt)"
            //====================================================================================================================
            //вывод даты
            let date = Date.init(timeIntervalSince1970: weatherList[indexPath.row].unixDate)
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "EEEE HH:mm"
            let fDate = dateFormat.string(from: date)
            detail.detailTextLabel?.text = String(describing: fDate)
            //detail.detailTextLabel?.text = String(describing: date)
        }
    
        return detail
    }
}






