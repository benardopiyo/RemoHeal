// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientRecords {

    // Define a Patient structure
    struct Patient {
        string name;
        uint age;
        string gender;
        string medicalHistory;
        string allergies;
    }

    // Mapping to store patients by their unique ID
    mapping(uint => Patient) private patients;
    
    // Event to be emitted when a new patient is added
    event PatientAdded(uint patientId, string name);

    // Event to be emitted when patient data is updated
    event PatientUpdated(uint patientId, string name);

    // Counter for patient IDs
    uint private patientCounter = 0;

    // Modifier to check if the caller is authorized (simplified example)
    modifier onlyAuthorized() {
        // In a real contract, you would check if the caller is an authorized doctor or admin
        _;
    }

    // Function to add a new patient
    function addPatient(string memory _name, uint _age, string memory _gender, string memory _medicalHistory, string memory _allergies) public onlyAuthorized {
        patientCounter++;
        patients[patientCounter] = Patient(_name, _age, _gender, _medicalHistory, _allergies);
        emit PatientAdded(patientCounter, _name);
    }

    // Function to update existing patient data
    function updatePatient(uint _patientId, string memory _name, uint _age, string memory _gender, string memory _medicalHistory, string memory _allergies) public onlyAuthorized {
        require(_patientId > 0 && _patientId <= patientCounter, "Patient ID is invalid.");
        Patient storage patient = patients[_patientId];
        patient.name = _name;
        patient.age = _age;
        patient.gender = _gender;
        patient.medicalHistory = _medicalHistory;
        patient.allergies = _allergies;
        emit PatientUpdated(_patientId, _name);
    }

    // Function to get patient data by ID
    function getPatient(uint _patientId) public view returns (string memory, uint, string memory, string memory, string memory) {
        require(_patientId > 0 && _patientId <= patientCounter, "Patient ID is invalid.");
        Patient memory patient = patients[_patientId];
        return (patient.name, patient.age, patient.gender, patient.medicalHistory, patient.allergies);
    }
}
