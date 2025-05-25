import Foundation

// Simple Task structure
struct Task {
    var id: String
    var title: String
    var description: String
    var dueDate: Date
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString,
         title: String,
         description: String,
         dueDate: Date,
         isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}

// Task Manager class
class TaskManager {
    private var tasks: [Task] = []
    
    func addTask(title: String, description: String, dueDate: Date) {
        let task = Task(title: title, description: description, dueDate: dueDate)
        tasks.append(task)
        print("Task added successfully!")
    }
    
    func listTasks() {
        if tasks.isEmpty {
            print("No tasks found.")
            return
        }
        
        print("\nYour Tasks:")
        print("-----------")
        for (index, task) in tasks.enumerated() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            print("\(index + 1). \(task.title)")
            print("   Description: \(task.description)")
            print("   Due Date: \(dateFormatter.string(from: task.dueDate))")
            print("   Status: \(task.isCompleted ? "Completed" : "Pending")")
            print("-----------")
        }
    }
    
    func completeTask(at index: Int) {
        guard index >= 0 && index < tasks.count else {
            print("Invalid task index!")
            return
        }
        
        tasks[index].isCompleted = true
        print("Task marked as completed!")
    }
    
    func deleteTask(at index: Int) {
        guard index >= 0 && index < tasks.count else {
            print("Invalid task index!")
            return
        }
        
        tasks.remove(at: index)
        print("Task deleted successfully!")
    }
}

// Main program
func main() {
    let taskManager = TaskManager()
    var running = true
    
    print("Welcome to Task Manager!")
    
    while running {
        print("\nPlease choose an option:")
        print("1. Add a new task")
        print("2. List all tasks")
        print("3. Complete a task")
        print("4. Delete a task")
        print("5. Exit")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Enter task title:")
                guard let title = readLine(), !title.isEmpty else {
                    print("Title cannot be empty!")
                    continue
                }
                
                print("Enter task description:")
                let description = readLine() ?? ""
                
                print("Enter due date (MM/dd/yyyy HH:mm):")
                if let dateString = readLine() {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
                    if let dueDate = dateFormatter.date(from: dateString) {
                        taskManager.addTask(title: title, description: description, dueDate: dueDate)
                    } else {
                        print("Invalid date format!")
                    }
                }
                
            case "2":
                taskManager.listTasks()
                
            case "3":
                print("Enter task number to complete:")
                if let indexString = readLine(),
                   let index = Int(indexString) {
                    taskManager.completeTask(at: index - 1)
                }
                
            case "4":
                print("Enter task number to delete:")
                if let indexString = readLine(),
                   let index = Int(indexString) {
                    taskManager.deleteTask(at: index - 1)
                }
                
            case "5":
                running = false
                print("Goodbye!")
                
            default:
                print("Invalid option! Please try again.")
            }
        }
    }
}

// Run the program
main() 