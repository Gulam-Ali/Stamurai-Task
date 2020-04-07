//
//  RatingHistory+CoreDataProperties.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 08/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//
//

import Foundation
import CoreData


extension RatingHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RatingHistory> {
        return NSFetchRequest<RatingHistory>(entityName: "RatingHistory")
    }

    @NSManaged public var date: String?
    @NSManaged public var rating: String?
    @NSManaged public var time: String?

}
