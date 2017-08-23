//
//  TableViewController.swift
//  SwiftJsonLesson
//

import UIKit
import SwiftyJSON
import RealmSwift
import Alamofire

class TableViewController: UITableViewController {

    var weather: [String] = []
    var temperature: [String] = []
    let managerData = ManagerData() //создаем объект
    var defaultSties: [String] = ["Novokuznetsk", "Novosibirsk", "Aktash", "Sheregesh"]
    var weatherList = [WeatherListClass]()



    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        
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
        
        return defaultSties.count
        //return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell..
        
//        managerData.getJsonDataFromUrl2(name: "Novokuznetsk") {
//            [weak self]  weatherList in
//            self?.weatherList = weatherList
//            cell.textLabel?.text = self?.weatherList[indexPath.row].name
//        }
        cell.textLabel?.text = defaultSties[indexPath.row]
        return cell
    }
  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            defaultSties.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let dest = segue.destination as? DetailTableViewController //ссылка на var из DTVC
            let cell = self.tableView.indexPathForSelectedRow!
            let myRow = cell.row
            dest?.detailSegue = defaultSties[myRow]  //передаем город в detail...
            
            
        }
    }
}
