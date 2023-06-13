//
//  LocalDBManager.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 13.06.2023.
//

import RealmSwift

class LocalDBManager {
    
    static let currentSchemaVersion: UInt64 = 1
    
    //Delete All Local Data
    func deleteAll(success: @escaping (Bool) -> Void){
        try! database.safeWrite {
            database.deleteAll()
            success(true)
        }
    }
    
    //Configure Local Database
    static func configureMigration() {
        var config = Realm.Configuration(schemaVersion: currentSchemaVersion, migrationBlock: { (migration, oldSchemaVersion) in
            debugPrint("oldSchemaVersion: " + String(oldSchemaVersion))
        })
        config.deleteRealmIfMigrationNeeded = true
        Realm.Configuration.defaultConfiguration = config
    }
    
    private var database:Realm
    static let sharedInstance = LocalDBManager()
    
    private init() {
        database = try! Realm()
    }
    
    func saveMovieItem(movie:MovieItem!, result: @escaping (String) -> Void) {
        let localItems:Results<MovieItem>! = database.objects(MovieItem.self).filter("id = %@", movie.id)
        
        if localItems.count == 0
        {
            try! database.write {
                database.add(movie)
            }
            result(movie.id)
        }
        else
        {
            result(movie.id)
        }
    }
    
    func getMovieItems(result: @escaping ([MovieItem]) -> Void) {
        let results: Results<MovieItem> = database.objects(MovieItem.self)
        result(results.toArray(type: MovieItem.self))
    }
    
    func getMovieItem(id:String, result: @escaping (MovieItem?) -> Void) {
        let results: Results<MovieItem> = database.objects(MovieItem.self).filter("id = %@" , id)
        if results.count > 0 {
            let movie : MovieItem? = results.first
            result(movie)
        }
        else {
            result(nil)
        }
    }
    
    
}

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}

extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
