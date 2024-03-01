//
//  StudentName+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Droadmin on 01/09/23.
//
//

import Foundation
import CoreData


extension StudentName {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentName> {
        return NSFetchRequest<StudentName>(entityName: "StudentName")
    }

    @NSManaged public var name: String?
    @NSManaged public var marks: NSSet?

}

// MARK: Generated accessors for marks
extension StudentName {

    @objc(addMarksObject:)
    @NSManaged public func addToMarks(_ value: StudentMark)

    @objc(removeMarksObject:)
    @NSManaged public func removeFromMarks(_ value: StudentMark)

    @objc(addMarks:)
    @NSManaged public func addToMarks(_ values: NSSet)

    @objc(removeMarks:)
    @NSManaged public func removeFromMarks(_ values: NSSet)

}

extension StudentName : Identifiable {

}
