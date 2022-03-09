// /SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract AcademicBankOfCredit {

    struct University{
        string name;
        Department department;
    }

    struct Department{
        string departmentName;
        Year year;
    }

    struct Course{
        string courseName;
        uint maxCredit;
    }

    struct Year{
        Course course;
        string[] reqCourses;
        uint reqCredits;
        uint minSeats;
        Faculty faculty;
    }

    struct Faculty{
        string facultyName;
    }    

    enum Applied{notApplied,Applied,pending,rejected}

    struct Student{
        string studentName;
        string studentAddress;
        uint currentYear;
        string department;
        uint totalCredits;
        string[] courses;
        Applied status;
    }



}