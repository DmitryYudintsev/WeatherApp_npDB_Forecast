//
//  ManagerData.swift
//  SwiftJsonLesson
//


import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class ManagerData {
    
  
    
    func getJsonDataFromUrl2(name : String, completion: @escaping ([WeatherListClass]) -> Void ) { //получение данных JSON с замыканием
        let baseurl = "http://api.openweathermap.org"
        let path = "/data/2.5/forecast"
        let parameters : Parameters = [
            "q" : name,
            "units" : "metric",
            "appid" : "a2ca789171f6f6e4ec6e0ad6efdef890"]
        let url = baseurl + path
        
        Alamofire.request(url, method : .get, parameters : parameters).responseJSON {
            responseJSON in
            switch responseJSON.result {
            case .success(let rawJSON):
                let clearJSON = JSON(rawJSON)
                var weatherList = [WeatherListClass]()
                
                for (_, weatherJson) in clearJSON["list"] {
                    let weather = WeatherListClass()
                    weather.unixDate = weatherJson["dt"].doubleValue// + 25200  //+7 часов
                    weather.temperature = weatherJson["main"]["temp"].intValue
                    weather.humidity = weatherJson["main"]["humidity"].intValue
                    weather.weather = weatherJson["weather"][0]["main"].stringValue
                    weather.name = name
                    weather.dt_txt = weatherJson["dt_txt"].stringValue
                    weatherList.append(weather) //сохраняем в массив объектов
                }
                completion(weatherList)  //замыкание

            case .failure(let error):
                debugPrint(error)
                
            }
        }
    }

    
    
}
