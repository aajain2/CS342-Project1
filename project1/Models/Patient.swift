import Foundation

// Patient class
class Patient {
    private static var IDCounter: Int = 0 // Avoids external manipulation or duplicates
    let medicalRecordNumber: Int
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    var height: Double
    var weight: Double
    var bloodType: BloodType? // Optional variable
    private(set) var medications: [Medication] = [] // Only through prescription
    
    init (firstName: String, lastName: String, dateOfBirth: Date, height: Double, weight: Double, bloodType: BloodType? = nil) {
        self.medicalRecordNumber = Patient.generateID()
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.weight = weight
        self.bloodType = bloodType
    }
    
    private static func generateID() -> Int {
        IDCounter += 1
        return IDCounter
    }
    
    // Calculated variable
    var bmi: Double {
        weight / (height * height)
    }
    
    func fullNameAndAge() -> String {
        let age = Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year ?? 0
        return "\(lastName), \(firstName), \(age)"
    }
    
    func currentMedications() -> [Medication] {
        medications.filter { $0.isCompleted == false }.sorted { $0.datePrescribed < $1.datePrescribed }
    }
    
    // $0 and $1 represent 1st and 2nd elements (swift closure shortcut)
    func prescribeMedication(_ medication: Medication) throws {
        if medications.contains(where: { $0.name == medication.name && $0.isCompleted == false }) {
            throw NSError(domain: "Duplicate Medication", code: 1, userInfo: nil)
        }
        medications.append(medication)
    }
    
    func compatibleDonorBloodTypes() -> [BloodType] {
        guard let bloodType = self.bloodType else { // Due to blood type being optional
            print("Blood Type N/A")
            return []
        }
        return bloodType.compatibleDonors()
    }
    
}
