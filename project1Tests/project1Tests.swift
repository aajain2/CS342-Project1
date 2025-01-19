//
//  project1Tests.swift
//  project1Tests
//
//  Created by Aayush Jain on 1/18/25.
//

import Testing
@testable import project1
import Foundation

struct project1Tests {
    
    private func createDate(year: Int, month: Int, day: Int) -> Date {
        return Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
    }
    
    // Patient Tests
    
    @Test func testPatientInitialization() async throws {
        let dateOfBirth = createDate(year: 2003, month: 12, day: 12)
        // New patient
        let patient = Patient(
            firstName: "Aayush",
            lastName: "Jain",
            dateOfBirth: dateOfBirth,
            height: 1.75,
            weight: 70,
            bloodType: .APlus
        )
        
        // Test patient properties
        #expect(patient.firstName == "Aayush")
        #expect(patient.lastName == "Jain")
        #expect(patient.dateOfBirth == dateOfBirth)
        #expect(patient.height == 1.75)
        #expect(patient.weight == 70)
        #expect(patient.bloodType == .APlus)
        #expect(patient.medicalRecordNumber > 0)
            
    }
    
    @Test func testPatientBMI() async throws {
        let dateOfBirth = createDate(year: 2003, month: 12, day: 12)
        let patient = Patient(
            firstName: "Aayush",
            lastName: "Jain",
            dateOfBirth: dateOfBirth,
            height: 1.75,
            weight: 70,
            bloodType: .APlus
        )
        
        #expect(abs(patient.bmi - 22.86) < 0.01)
    }
    
    @Test func testFullNameAndAge() async throws {
        let dateOfBirth = createDate(year: 2003, month: 12, day: 12)
        let patient = Patient(
            firstName: "Aayush",
            lastName: "Jain",
            dateOfBirth: dateOfBirth,
            height: 1.75,
            weight: 70,
            bloodType: .APlus
        )
        
        let result = patient.fullNameAndAge()
        #expect(result.contains("Jain, Aayush, 21"))
    }
    
    @Test func testCurrentAndPrescribeMedications() async throws {
        let patient = Patient(
            firstName: "Aayush",
            lastName: "Jain",
            dateOfBirth: createDate(year: 2003, month: 12, day: 12),
            height: 1.75,
            weight: 70,
            bloodType: .APlus
        )
        
        // Set medications
        let med1 = Medication(
            datePrescribed: Date(),
            name: "Acetaminophen",
            dose: "500 mg",
            route: "by mouth",
            frequency: 1,
            duration: 10
        )
        
        let med2 = Medication(
            datePrescribed: Date().addingTimeInterval(-1000 * 1000),
            name: "Ibuprofen",
            dose: "200 mg",
            route: "by mouth",
            frequency: 2,
            duration: 10
        )
        
        // Add medications
        try patient.prescribeMedication(med1)
        try patient.prescribeMedication(med2)
        
        let activeMeds = patient.currentMedications()
        #expect(activeMeds.count == 1)
        #expect(activeMeds[0].name == "Acetaminophen")
    }
    
    @Test func testCompatibleDonorBloodTypes() async throws {
        let patient = Patient(
            firstName: "Aayush",
            lastName: "Jain",
            dateOfBirth: createDate(year: 2003, month: 12, day: 12),
            height: 1.75,
            weight: 70,
            bloodType: .APlus
        )
        
        let compatibleDonors = patient.compatibleDonorBloodTypes()
        #expect(compatibleDonors == [.OMinus, .OPlus, .AMinus, .APlus])
    }
    
    // Medication tests
    
    @Test func testMedicationDaysRemaining() async throws {
        let med = Medication(
            datePrescribed: Date(),
            name: "Acetaminophen",
            dose: "500 mg",
            route: "by mouth",
            frequency: 1,
            duration: 10
        )
        
        #expect(med.daysRemaining == 9)
    }
    
    @Test func testMedicationIsCompleted() async throws {
        let med = Medication(
            datePrescribed: Date().addingTimeInterval(-1000 * 1000),
            name: "Acetaminophen",
            dose: "500 mg",
            route: "by mouth",
            frequency: 1,
            duration: 10
        )
        
        #expect(med.isCompleted == true)
    }
    
    // BloodType tests
    
    @Test func testCompatibleBloodTypes() async throws {
        #expect(BloodType.APlus.compatibleDonors() == [.OMinus, .OPlus, .AMinus, .APlus])
        #expect(BloodType.ABPlus.compatibleDonors() == BloodType.allCases)
        #expect(BloodType.OMinus.compatibleDonors() == [.OMinus])
    }
}
