import Foundation

struct Medication: Equatable {
    let datePrescribed: Date
    let name: String
    let dose: String
    let route: String
    let frequency: Int
    let duration: Int
    
    var daysRemaining: Int {
        let endDate = Calendar.current.date(byAdding: .day, value: duration, to: datePrescribed)!
        let remainingDays = Calendar.current.dateComponents([.day], from: Date(), to: endDate).day ?? 0
        return max(remainingDays, 0)
    }
    
    var isCompleted: Bool {
        let endDate = Calendar.current.date(byAdding: .day, value: duration, to: datePrescribed)!
        return Date() >= endDate
    }
}
