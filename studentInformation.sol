// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract studentInformation {
    // Define a struct to hold student information
    struct Student {
        string name;
        uint age;
        string studentId;
        string course;
    }

    // Array to store the student structs
    Student[] public  students;

    // Function to add a student's information
    function addStudent(string memory _name, uint _age, string memory _studentId, string memory _course) public {
        Student memory newStudent = Student({
            name: _name,
            age: _age,
            studentId: _studentId,
            course: _course
        });
        students.push(newStudent);
    }

    // Function to get a student's information by index
    function getStudent(uint index) public view returns (string memory, uint, string memory, string memory) {
        require(index < students.length, "Index out of range");

        Student memory s = students[index];
        return (s.name, s.age, s.studentId, s.course);
    }

    // Function to get the total number of students
    function getStudentCount() public view returns (uint) {
        return students.length;
    }
}
