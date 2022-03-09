//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract AcademicBankOfCredit {
    // string public name;


    struct university{
        string name;
        department d1;
    }

    struct department{
        string departmentName;
        year y;
    }
    
    struct courses{
        string courseName;
        uint maxCredit;
    }

    struct year{
        courses c;
        string[] reqCourses ;
        uint reqCredits;
        uint minSeats;
        faculty f;
    }

    struct faculty{
        string facultyName;
    }    

    enum Applied{notApplied,Applied,pending,rejected}

    struct student{
        string studentName;
        string studentAddress;
        uint currentYear;
        string department;
        string[] courses;
        Applied u1;
    }



}
