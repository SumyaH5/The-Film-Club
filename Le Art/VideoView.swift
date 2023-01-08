//
//  VideoView.swift
//  Le Art
//
//  Created by Sumya Hoque on 1/8/23.
//

import Foundation
class Videos: Identifiable, Decodable {
    
    var id:UUID?
    var title:String
    var fileName:String
    
}

class DataService {
    
    static func getLocalData() -> [Videos] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "files", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Videos]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let filmData = try decoder.decode([Videos].self, from: data)
                
                // Add the unique IDs
                for r in filmData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return filmData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Videos]()
    }
    
}

class VideoModel: ObservableObject {
    
    @Published var projects = [Videos]()
    
    init() {

        // Create an instance of data service and get the data
        self.projects = DataService.getLocalData()
        
        
    }
}
