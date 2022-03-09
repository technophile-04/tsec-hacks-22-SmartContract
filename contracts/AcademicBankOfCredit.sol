//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract AcademicBankOfCredit {

    enum Applied{notApplied,pending,Approved,rejected}

    struct Department {
        string name;
        mapping(uint => Course) courses;
        uint courseCount;
    }

    struct Course{
        string courseName;
        uint maxCredit;
        uint year;
    } 

    struct University{
        string name;
        address univAddress;
        mapping(uint => Department) departments;
        uint departCount;
    }

    struct Student{
        address univAddress;
        address studentAddress;
        string studentName;
        uint currentYear;
        string departmentName;
        uint totalCredits;
        mapping(uint => Course) completeCourses;
        uint completeCount;
        mapping(uint => Course) inCompleteCourses;
        uint inCompleteCount;
        mapping(uint => Course) pendingCourses;
        uint pendingCourseCount;
        Applied status;
    }

    mapping(address => University) public universites;
    address[] listOfUniAddr;

    mapping(address => Student) public students;
    address[] listOfStuAddr;

    function addUniversity(string memory _name)  public{
        University storage u1 = universites[msg.sender];
        u1.name = _name;
        u1.univAddress = msg.sender;
        Department storage d1 = u1.departments[u1.departCount];
        u1.departCount++;
        d1.name = "IT";
        Course storage c1 = d1.courses[d1.courseCount];
        d1.courseCount++;
        c1.courseName="CHEM";
        c1.maxCredit=5;
        c1.year= 1;
        listOfUniAddr.push(msg.sender);
    }

    function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
        bytes memory b1 = bytes(s1);
        bytes memory b2 = bytes(s2);
        uint256 l1 = b1.length;
        if (l1 != b2.length) return false;
        for (uint256 i=0; i<l1; i++) {
            if (b1[i] != b2[i]) return false;
        }
        return true;
    }

    function addStudent(string memory _name, uint _year,string memory _departName, address _univAddress) public{
        Student storage s1 = students[msg.sender];
        s1.univAddress = _univAddress;
        s1.studentAddress = msg.sender;
        s1.studentName = _name;
        s1.currentYear = _year;
        s1.departmentName = _departName;
        University storage un = universites[_univAddress];
        for(uint i = 0; i < un.departCount; i++){
            if(stringsEquals(un.departments[i].name , _departName)){
                for(uint j = 0; j < un.departments[i].courseCount; j++){
                    Course storage c1 = s1.inCompleteCourses[s1.inCompleteCount];
                    s1.inCompleteCount++;
                    c1.courseName = un.departments[i].courses[j].courseName;
                    c1.maxCredit = un.departments[i].courses[j].maxCredit;
                    c1.year = un.departments[i].courses[j].year;
                }
            }
        }

        listOfStuAddr.push(msg.sender);

    }


}