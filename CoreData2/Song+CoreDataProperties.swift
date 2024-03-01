//
//  Song+CoreDataProperties.swift
//  CoreData2
//
//  Created by Droadmin on 01/09/23.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var singer: Singar?

}

extension Song : Identifiable {

}
