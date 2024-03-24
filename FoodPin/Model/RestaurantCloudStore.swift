import CloudKit
import SwiftUI

//@Observable class RestaurantCloudStore {
@Observable class RestaurantCloudStore {
    var restaurants: [CKRecord] = []
    
    func fetchRestaurants() async throws {
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
       
        let results = try await publicDatabase.records(matching: query)
        
        for record in results.matchResults {
            self.restaurants.append(try record.1.get())
        }
    }
    
    func fetchRestaurantWithOperational() {
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name", "image"]
        queryOperation.queuePriority = .veryHigh
        queryOperation.resultsLimit = 50
        queryOperation.recordMatchedBlock = { (recordID, result) -> Void in
            if let restaurant = try? result.get() {
                DispatchQueue.main.async {
                    self.restaurants.append(restaurant)
                }
            }
        }
        
        queryOperation.queryResultBlock = { result -> Void in
            switch result {
            case .success(let cursor): print("Successfully retrieve the data from iCloud.")
            case .failure(let error): print("Failed to get data from iCloud - \(error.localizedDescription)")
            }
        }
        
        publicDatabase.add(queryOperation)
    }
}
