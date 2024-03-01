//
//  Singar+CoreDataProperties.swift
//  CoreData2
//
//  Created by Droadmin on 01/09/23.
//
//

import Foundation
import CoreData


extension Singar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singar> {
        return NSFetchRequest<Singar>(entityName: "Singar")
    }

    @NSManaged public var name: String?
    @NSManaged public var songs: NSSet?

}

// MARK: Generated accessors for songs
extension Singar {

    @objc(addSongsObject:)
    @NSManaged public func addToSongs(_ value: Song)

    @objc(removeSongsObject:)
    @NSManaged public func removeFromSongs(_ value: Song)

    @objc(addSongs:)
    @NSManaged public func addToSongs(_ values: NSSet)

    @objc(removeSongs:)
    @NSManaged public func removeFromSongs(_ values: NSSet)

}

extension Singar : Identifiable {

}
