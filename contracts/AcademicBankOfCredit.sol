//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract AcademicBankOfCredit {



    enum Applied{notApplied,pending,Approved,rejected}

    struct AppliedStudents{
        string stuName;
        address stuAddress;
    }

    struct PendingStudents {
        string stuName;
        string courseName;
        uint courseCredits;
    }

    struct UniversityOutput {
        address uniAdrrss;
        string uniName;
        uint departCount;
    }

    struct PendingStudentsOutput {
        string name;
        address studAddr;
        uint totalCredits;
    }

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
        string toUnivName;
        address toUnviAddress;
        Applied status;
    }

    mapping(address => University) public universites;
    address[] listOfUniAddr;

    mapping(address => Student) public students;
    address[] listOfStuAddr;

    function addUniversity(string memory _name)  public{
        University storage u11 = universites[msg.sender];
        u11.name = _name;
        u11.univAddress = msg.sender;
        Department storage d1 = u11.departments[u11.departCount];
        u11.departCount++;
        d1.name = "Information Technology";
        Course storage c11 = d1.courses[d1.courseCount];
        d1.courseCount++;
        c11.courseName="CHEM";
        c11.maxCredit=4;
        c11.year= 1;

        // Course storage c12 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c12.courseName="PHY";
        // c12.maxCredit=4;
        // c12.year= 1;
        
        // Course storage c13 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c13.courseName="MATHS";
        // c13.maxCredit=5;
        // c13.year= 1; 

        Course storage c21 = d1.courses[d1.courseCount];
        d1.courseCount++;
        c21.courseName="JPL";
        c21.maxCredit=5;
        c21.year= 2;
        
        // Course storage c22 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c22.courseName="CN";
        // c22.maxCredit=4;
        // c22.year= 2; 

        // Course storage c23 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c23.courseName="Formal language and automata theory";
        // c23.maxCredit=5;
        // c23.year= 2;

        Course storage c31 = d1.courses[d1.courseCount];
        d1.courseCount++;
        c31.courseName="Cryptography and Network Security";
        c31.maxCredit=4;
        c31.year= 3;
        
        // Course storage c32 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c32.courseName="Soft Computing";
        // c32.maxCredit=5;
        // c32.year= 3; 

        // Course storage c33 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c33.courseName="Parallel and Distributed Computing";
        // c33.maxCredit=5;
        // c33.year= 3;

        Course storage c41 = d1.courses[d1.courseCount];
        d1.courseCount++;
        c41.courseName="Mobile Application Development";
        c41.maxCredit=4;
        c41.year= 4;

        Course storage c42 = d1.courses[d1.courseCount];
        d1.courseCount++;
        c42.courseName="Cyber Security and Laws";
        c42.maxCredit=4;
        c42.year= 4; 

        // Course storage c43 = d1.courses[d1.courseCount];
        // d1.courseCount++;
        // c43.courseName="User Interaction Design";
        // c43.maxCredit=5;
        // c43.year= 4;

        // University storage u12 = universites[msg.sender];
        // u12.name = _name;
        // u12.univAddress = msg.sender;
        Department storage d2 = u11.departments[u11.departCount];
        u11.departCount++;
        d2.name = "Computer Science";
        c11 = d2.courses[d2.courseCount];
        d2.courseCount++;
        c11.courseName="CHEM";
        c11.maxCredit=4;
        c11.year= 1;

        // c12 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c12.courseName="PHY";
        // c12.maxCredit=4;
        // c12.year= 1;
        
        // c13 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c13.courseName="MATHS";
        // c13.maxCredit=5;
        // c13.year= 1; 

        c21 = d2.courses[d2.courseCount];
        d2.courseCount++;
        c21.courseName="JPL";
        c21.maxCredit=5;
        c21.year= 2;
        
        // c22 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c22.courseName="OS";
        // c22.maxCredit=4;
        // c22.year= 2; 

        // c23 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c23.courseName="Database Management System";
        // c23.maxCredit=5;
        // c23.year= 2;

        c31 = d2.courses[d2.courseCount];
        d2.courseCount++;
        c31.courseName="Data Mining and Warehouse";
        c31.maxCredit=4;
        c31.year= 3;
        
        // c32 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c32.courseName="Artificial Intelligence";
        // c32.maxCredit=5;
        // c32.year= 3; 

        // c33 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c33.courseName="Big Data Infrastructure";
        // c33.maxCredit=5;
        // c33.year= 3;

        c41 = d2.courses[d2.courseCount];
        d2.courseCount++;
        c41.courseName="Digital Signal and Image Processing";
        c41.maxCredit=4;
        c41.year= 4;

        // c42 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c42.courseName="Operation Research";
        // c42.maxCredit=4;
        // c42.year= 4; 

        // c43 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c43.courseName="Adhoc Wireless Network";
        // c43.maxCredit=5;
        // c43.year= 4;

        // University storage u13 = universites[msg.sender];
        // u13.name = _name;
        // u13.univAddress = msg.sender;
        Department storage d3 = u11.departments[u11.departCount];
        u11.departCount++;
        d3.name = "Mechanical Engineering";
        c11 = d3.courses[d3.courseCount];
        d3.courseCount++;
        c11.courseName="CHEM";
        c11.maxCredit=4;
        c11.year= 1;

        // c12 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c12.courseName="PHY";
        // c12.maxCredit=4;
        // c12.year= 1;
        
        // c13 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c13.courseName="MATHS";
        // c13.maxCredit=5;
        // c13.year= 1; 

        c21 = d3.courses[d3.courseCount];
        d3.courseCount++;
        c21.courseName="JPL";
        c21.maxCredit=5;
        c21.year= 2;
        
        // c22 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c22.courseName="OS";
        // c22.maxCredit=4;
        // c22.year= 2; 

        // c23 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c23.courseName="Database Management System";
        // c23.maxCredit=5;
        // c23.year= 2;

        c31 = d3.courses[d3.courseCount];
        d3.courseCount++;
        c31.courseName="Data Mining and Warehouse";
        c31.maxCredit=4;
        c31.year= 3;
        
        // c32 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c32.courseName="Artificial Intelligence";
        // c32.maxCredit=5;
        // c32.year= 3; 

        // c33 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c33.courseName="Big Data Infrastructure";
        // c33.maxCredit=5;
        // c33.year= 3;

        c41 = d3.courses[d3.courseCount];
        d3.courseCount++;
        c41.courseName="Digital Signal and Image Processing";
        c41.maxCredit=4;
        c41.year= 4;

        // c42 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c42.courseName="Operation Research";
        // c42.maxCredit=4;
        // c42.year= 4; 

        // c43 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c43.courseName="Adhoc Wireless Network";
        // c43.maxCredit=5;
        // c43.year= 4;

        Department storage d4 = u11.departments[u11.departCount];
        u11.departCount++;
        d4.name = "Electronics Engineering";
        c11 = d4.courses[d4.courseCount];
        d4.courseCount++;
        c11.courseName="CHEM";
        c11.maxCredit=4;
        c11.year= 1;

        // c12 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c12.courseName="PHY";
        // c12.maxCredit=4;
        // c12.year= 1;
        
        // c13 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c13.courseName="MATHS";
        // c13.maxCredit=5;
        // c13.year= 1; 

        c21 = d4.courses[d4.courseCount];
        d4.courseCount++;
        c21.courseName="Electronic Devices and Circuits - I";
        c21.maxCredit=5;
        c21.year= 2;
        
        // c22 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c22.courseName="OS";
        // c22.maxCredit=4;
        // c22.year= 2; 

        // c23 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c23.courseName="Database Management System";
        // c23.maxCredit=5;
        // c23.year= 2;

        c31 = d4.courses[d4.courseCount];
        d4.courseCount++;
        c31.courseName="Digital Signal Processing";
        c31.maxCredit=4;
        c31.year= 3;
        
        // c32 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c32.courseName="Artificial Intelligence";
        // c32.maxCredit=5;
        // c32.year= 3; 

        // c33 = d2.courses[d2.courseCount];
        // d2.courseCount++;
        // c33.courseName="Big Data Infrastructure";
        // c33.maxCredit=5;
        // c33.year= 3;

        c41 = d4.courses[d4.courseCount];
        d4.courseCount++;
        c41.courseName="MEMS Technology";
        c41.maxCredit=4;
        c41.year= 4;

        // c42 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c42.courseName="Operation Research";
        // c42.maxCredit=4;
        // c42.year= 4; 

        // c43 = d3.courses[d3.courseCount];
        // d3.courseCount++;
        // c43.courseName="Adhoc Wireless Network";
        // c43.maxCredit=5;
        // c43.year= 4;


        
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


    // Get all universtiy
    function getUniversities() public view  returns(UniversityOutput[] memory){
        UniversityOutput[] memory allUniversites = new UniversityOutput[](listOfUniAddr.length);
        uint count = 0;


        for(uint i = 0; i < listOfUniAddr.length; i++){
            allUniversites[count].uniAdrrss = listOfUniAddr[i];
            allUniversites[count].uniName = universites[listOfUniAddr[i]].name;
            allUniversites[count].departCount = universites[listOfUniAddr[i]].departCount;
            count++;
        }

        return allUniversites;

    }

    // getUniversityCourse course
    function getUniversityCourse(address univAddress) public view returns(Course[] memory){
        Course[] memory allUnvCourses = new Course[](16);
        uint count = 0;        
        for(uint i = 0; i < listOfUniAddr.length; i++){

            for(uint j = 0; j < universites[univAddress].departments[i].courseCount; j++) {
                allUnvCourses[count] = universites[univAddress].departments[i].courses[j];
                count++;
            }

        }

        return allUnvCourses;
    }   

    //user details
    function getUserDetails(address studAddr) public view returns(address ,
        address ,
        string memory ,
        uint ,
        string memory ,
        uint ){

        return (students[studAddr].univAddress,studAddr, students[studAddr].studentName, students[studAddr].currentYear, students[studAddr].departmentName, students[studAddr].totalCredits);
    }

    // getUser complete courses
    function getCompletedCourses() public view returns(Course[] memory) {
        Course[] memory completedCourses = new Course[](16);
        uint count = 0;       
        Student storage s1 = students[msg.sender];
        for(uint i = 0; i < s1.completeCount; i++){
            completedCourses[count].courseName = s1.completeCourses[i].courseName;
            completedCourses[count].maxCredit = s1.completeCourses[i].maxCredit;
            completedCourses[count].year = s1.completeCourses[i].year;
            count++;
        }

        return completedCourses;
    }


    // function request course credit 
    function requestCourseCred(string memory courseName) public {

        Student storage s1 = students[msg.sender];

        for(uint i = 0; i < s1.inCompleteCount; i++){
            if(stringsEquals(s1.inCompleteCourses[i].courseName ,courseName)){
                Course storage c1 = s1.pendingCourses[s1.pendingCourseCount];
                s1.pendingCourseCount++;
                c1.courseName = s1.inCompleteCourses[i].courseName;
                c1.maxCredit = s1.inCompleteCourses[i].maxCredit;
                c1.year = s1.inCompleteCourses[i].year;
                delete s1.inCompleteCourses[i];
                s1.inCompleteCount--;
                break;
            }
        }
        
    }


    function pendingCoursesCred() public view returns(PendingStudents[] memory) {
        PendingStudents[] memory pendingStudents= new PendingStudents[](20);
        uint count = 0;   

        for(uint i = 0 ; i < listOfStuAddr.length; i++){
            if(students[listOfStuAddr[i]].univAddress == msg.sender){
                for(uint j = 0 ; j < students[listOfStuAddr[i]].pendingCourseCount; i++){
                    pendingStudents[count].stuName = students[listOfStuAddr[i]].studentName;
                    pendingStudents[count].courseName = students[listOfStuAddr[i]].pendingCourses[j].courseName;
                    pendingStudents[count].courseCredits =students[listOfStuAddr[i]].pendingCourses[j].maxCredit;
                    count++;
                }
            }
        }

        return pendingStudents;

    }


    //  accept student
    function AcceptCourseCred(address stuAddress, string memory courseName) public {
        Student storage s1 = students[stuAddress];
        for(uint i = 0; i < s1.pendingCourseCount; i++){
            if(stringsEquals(s1.pendingCourses[i].courseName , courseName)){
                Course storage c1 = s1.completeCourses[s1.completeCount];
                s1.completeCount++;
                c1.courseName = s1.pendingCourses[i].courseName;
                c1.maxCredit = s1.pendingCourses[i].maxCredit;
                c1.year = s1.pendingCourses[i].year;
                delete s1.pendingCourses[i];
                s1.pendingCourseCount--;
                break;
            }
        }

    }


    function requestTransferUniversity(address _toUnivAddress) public {
        Student storage s1 = students[msg.sender];
        s1.toUnivName = universites[_toUnivAddress].name;
        s1.toUnviAddress = _toUnivAddress;
        s1.status = Applied.pending;
    }

    function transferUniversity(address studAddress) public {
        Student storage s1 = students[studAddress];
        s1.univAddress = msg.sender;
        s1.toUnivName = "";
        s1.status = Applied.Approved;
    }

    function appliedStudents() public view returns(AppliedStudents[] memory){
        AppliedStudents[] memory appliedArray= new AppliedStudents[](20);
        uint count  = 0;
        for(uint i = 0; i < listOfStuAddr.length; i++){

            if(stringsEquals(students[listOfStuAddr[i]].toUnivName, universites[msg.sender].name)){
                appliedArray[count].stuName = students[listOfStuAddr[i]].studentName;
                appliedArray[count].stuAddress = listOfStuAddr[i];
                count++;
            }   

        }

        return appliedArray;
        
    }


}