//
//  ListData.swift
//  ListApp
//
//  Created by logesh on 12/15/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation
import CoreData

public class Personal: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
}

extension Personal {
    static func getAllTodosRequest() -> NSFetchRequest<Personal> {
        let request: NSFetchRequest<Personal> = Personal.fetchRequest() as! NSFetchRequest<Personal>
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        return request
    }
}
