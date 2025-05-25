import Foundation
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var dueDate: Date
    var priority: Priority
    var isCompleted: Bool
    var category: Category
    var createdAt: Date
    var updatedAt: Date
    
    enum Priority: String, Codable, CaseIterable {
        case low
        case medium
        case high
    }
    
    enum Category: String, Codable, CaseIterable {
        case personal
        case work
        case shopping
        case health
        case other
    }
    
    init(id: String? = nil,
         title: String,
         description: String,
         dueDate: Date,
         priority: Priority = .medium,
         isCompleted: Bool = false,
         category: Category = .personal,
         createdAt: Date = Date(),
         updatedAt: Date = Date()) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.priority = priority
        self.isCompleted = isCompleted
        self.category = category
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
} 