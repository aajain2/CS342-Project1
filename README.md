# CS342 Patient Foundational Data Model

## Description
This is my implementation of a foundational data model for a healthcare application, submitted as part of my CS342 coursework. The project includes the `Patient`, `Medication`, and `BloodType` models, with functionality to represent patient records, manage medications, and determine blood type compatibility.

I implemented the project in Swift and ensured its correctness using a comprehensive suite of unit tests. Below, I describe the key functionality, how to run the project, and the decisions I made during development.

## Functionality
### Key Components
1. **`Patient` Class**
   - Represents a patient with the following properties:
     - Name (first and last).
     - Date of birth.
     - Height and weight.
     - A unique medical record number (auto-generated).
     - Blood type (optional).
     - A list of prescribed medications.
   - Includes computed properties and methods:
     - **Full Name and Age**: The `fullNameAndAge()` method calculates the patient’s full name and age.
     - **Body Mass Index (BMI)**: A computed property (`bmi`) calculates the patient’s BMI based on their height and weight.
     - **Prescribe Medications**: The `prescribeMedication()` method allows adding new medications while preventing duplicates.
     - **Active Medications**: The `currentMedications()` method filters out completed medications and returns active ones.
     - **Blood Compatibility**: The `compatibleDonorBloodTypes()` method determines compatible blood donors based on the patient’s blood type.

2. **`Medication` Struct**
   - Represents a medication prescribed to a patient, with the following properties:
     - Name, dose, route, frequency, duration, and date prescribed.
   - Includes computed properties:
     - **Days Remaining**: The `daysRemaining` property calculates how many days are left for the medication.
     - **Completion Status**: The `isCompleted` property determines if the medication duration has ended.

3. **`BloodType` Enum**
   - Represents all possible blood types (A+, A-, B+, B-, O+, O-, AB+, AB-).
   - Includes a method (`compatibleDonors()`) that determines which blood types are compatible donors for a given blood type.

4. **Unit Tests**
   - I wrote a comprehensive set of unit tests in `project1Tests.swift` to verify the correctness of the implementation:
     - **Patient Initialization**: Tests for correct setup of all `Patient` properties, including auto-generated medical record numbers.
     - **BMI and Age Computation**: Validates the computed properties of `Patient`.
     - **Medication Management**: Tests for prescribing medications, preventing duplicates, and filtering active medications.
     - **Blood Compatibility**: Ensures blood compatibility logic is accurate for all blood types.
     - **Medication Properties**: Validates `daysRemaining` and `isCompleted` properties of `Medication`.

### Running the Project

Step 1: Clone the Repository

To get started, clone this repository to your local machine:
```bash
git clone https://github.com/aajain2/CS342-Project1.git
cd CS342-Project1

Step 2: Open the Project in Xcode
1. Launch Xcode.
2. Open the project1.xcodeproj file in this directory.
3. Select a simulator (e.g., iPhone 14) or a connected device.

Step 3: Build and Run the Project
1. Press Command + R to build and run the project.
2. Verify that the project compiles and runs successfully.

Step 4: Run the Tests
Open the Test Navigator in Xcode (Shortcut: Command + 6).
Run all tests using Command + U.
Ensure all tests pass without errors.

## Attribution

ChatGPT was used to help me collect my thoughts for this README.
