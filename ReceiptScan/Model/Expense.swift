import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

struct Expense: Identifiable {
    let id: String
    let userId: String
    let amount: Double
    let category: String
    let storeName: String
    let date: Date
    let createdAt: Date
}

final class ExpensesViewModel: ObservableObject {
    @Published private(set) var expenses: [Expense] = []
    @Published private(set) var isLoading: Bool = false
    @Published var lastErrorMessage: String?
    
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    deinit {
        stopListening()
    }
    
    func startListening() {
        guard let user = Auth.auth().currentUser else {
            DispatchQueue.main.async {
                self.expenses = []
            }
            stopListening()
            return
        }
        
        isLoading = true
        stopListening()
        
        listener = db.collection("expenses")
            .whereField("userId", isEqualTo: user.uid)
            .order(by: "date", descending: true)
            .addSnapshotListener { [weak self] snapshot, error in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    if let error = error {
                        self.lastErrorMessage = error.localizedDescription
                        return
                    }
                    
                    guard let documents = snapshot?.documents else {
                        self.expenses = []
                        return
                    }
                    
                    self.expenses = documents.compactMap { document in
                        let data = document.data()
                        
                        guard
                            let userId = data["userId"] as? String,
                            let amount = data["amount"] as? Double,
                            let category = data["category"] as? String,
                            let storeName = data["storeName"] as? String,
                            let dateTimestamp = data["date"] as? Timestamp,
                            let createdAtTimestamp = data["createdAt"] as? Timestamp
                        else {
                            return nil
                        }
                        
                        return Expense(
                            id: document.documentID,
                            userId: userId,
                            amount: amount,
                            category: category,
                            storeName: storeName,
                            date: dateTimestamp.dateValue(),
                            createdAt: createdAtTimestamp.dateValue()
                        )
                    }
                }
            }
    }
    
    func stopListeningAndClear() {
        stopListening()
        DispatchQueue.main.async {
            self.expenses = []
        }
    }
    
    private func stopListening() {
        listener?.remove()
        listener = nil
    }
    
    func addExpense(amount: Double, category: String, storeName: String, date: Date, completion: ((Error?) -> Void)? = nil) {
        guard let user = Auth.auth().currentUser else {
            let error = NSError(domain: "ExpensesViewModel", code: 401, userInfo: [NSLocalizedDescriptionKey: "Пользователь не авторизован"])
            lastErrorMessage = error.localizedDescription
            completion?(error)
            return
        }
        
        let now = Date()
        let collection = db.collection("expenses")
        let document = collection.document()
        
        let newExpense = Expense(
            id: document.documentID,
            userId: user.uid,
            amount: amount,
            category: category,
            storeName: storeName,
            date: date,
            createdAt: now
        )
        
        // Оптимистично обновляем локальное состояние,
        // чтобы аналитика и календарь сразу увидели новый расход
        expenses.insert(newExpense, at: 0)
        
        let data: [String: Any] = [
            "userId": user.uid,
            "amount": amount,
            "category": category,
            "storeName": storeName,
            "date": date,
            "createdAt": now
        ]
        
        document.setData(data) { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.lastErrorMessage = error.localizedDescription
                    // В случае ошибки откатываем локальное добавление
                    self?.expenses.removeAll { $0.id == newExpense.id }
                }
                completion?(error)
            }
        }
    }
    
    func deleteExpense(_ expense: Expense, completion: ((Error?) -> Void)? = nil) {
        // Сразу убираем из локального массива, чтобы все экраны обновились
        DispatchQueue.main.async {
            self.expenses.removeAll { $0.id == expense.id }
        }
        
        db.collection("expenses").document(expense.id).delete { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.lastErrorMessage = error.localizedDescription
                    // В случае ошибки можно вернуть запись обратно (минимально — перечитать снапшот)
                    self?.startListening()
                }
                completion?(error)
            }
        }
    }
}

