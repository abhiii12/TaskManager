import Foundation
import Firebase
import FirebaseFirestore
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var errorMessage: String?
    
    private let db = Firestore.firestore()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupFirebaseListener()
    }
    
    private func setupFirebaseListener() {
        db.collection("tasks")
            .order(by: "dueDate")
            .addSnapshotListener { [weak self] snapshot, error in
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    self?.errorMessage = "No documents found"
                    return
                }
                
                self?.tasks = documents.compactMap { document -> Task? in
                    try? document.data(as: Task.self)
                }
            }
    }
    
    func addTask(_ task: Task) {
        do {
            try db.collection("tasks").addDocument(from: task)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func updateTask(_ task: Task) {
        guard let taskId = task.id else { return }
        
        do {
            try db.collection("tasks").document(taskId).setData(from: task)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteTask(_ task: Task) {
        guard let taskId = task.id else { return }
        
        db.collection("tasks").document(taskId).delete { [weak self] error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    func toggleTaskCompletion(_ task: Task) {
        var updatedTask = task
        updatedTask.isCompleted.toggle()
        updatedTask.updatedAt = Date()
        updateTask(updatedTask)
    }
} 