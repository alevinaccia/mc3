//
//  CDSavedTrip+CoreDataProperties.swift
//  tracks
//
//  Created by Valerio Mosca on 10/03/23.
//
//

import Foundation
import CoreData


extension CDSavedTrip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDSavedTrip> {
        return NSFetchRequest<CDSavedTrip>(entityName: "CDSavedTrip")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var iconName: String?
    @NSManaged public var hasAStartingPoint: CDStation?
    @NSManaged public var hasAnEndingPoint: CDStation?

}

extension CDSavedTrip : Identifiable {

}
