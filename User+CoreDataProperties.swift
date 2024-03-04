//
//  User+CoreDataProperties.swift
//  RegisterLessonSwiftUI
//
//  Created by macbook pro on 4.03.2024.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var avatar: Data?
    @NSManaged public var comment: String?
    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var lessons: NSSet?

}

// MARK: Generated accessors for lessons
extension User {

    @objc(addLessonsObject:)
    @NSManaged public func addToLessons(_ value: Lesson)

    @objc(removeLessonsObject:)
    @NSManaged public func removeFromLessons(_ value: Lesson)

    @objc(addLessons:)
    @NSManaged public func addToLessons(_ values: NSSet)

    @objc(removeLessons:)
    @NSManaged public func removeFromLessons(_ values: NSSet)

}

extension User : Identifiable {

}
