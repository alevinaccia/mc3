//
//  CDStation+CoreDataProperties.swift
//  tracks
//
//  Created by Valerio Mosca on 10/03/23.
//
//

import Foundation
import CoreData


extension CDStation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDStation> {
        return NSFetchRequest<CDStation>(entityName: "CDStation")
    }

    @NSManaged public var name: String?
    @NSManaged public var code: String?

}

extension CDStation : Identifiable {

}
