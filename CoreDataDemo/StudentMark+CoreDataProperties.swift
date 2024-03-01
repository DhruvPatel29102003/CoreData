//
//  StudentMark+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Droadmin on 01/09/23.
//
//

import Foundation
import CoreData


extension StudentMark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentMark> {
        return NSFetchRequest<StudentMark>(entityName: "StudentMark")
    }

    @NSManaged public var mark: Int64
    @NSManaged public var names: StudentName?

}

extension StudentMark : Identifiable {

}
