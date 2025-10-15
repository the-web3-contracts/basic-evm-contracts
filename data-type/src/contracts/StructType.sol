// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StructType {
    struct PersonInfo {
        string university;
        string hometown;
        string homeAddress;
    }

    struct Person {
        string name;
        uint256 age;
        address walletAddress;
        PersonInfo info;
    }

    PersonInfo public userInfo;
    PersonInfo public user2Info;
    Person public user;
    Person public user2;

    function setPerson(string memory _name, uint256 _age, address _walletAddress) public {
        user.name = _name;
        user.age = _age;
        user.walletAddress = _walletAddress;
        userInfo.university = unicode"深圳大学";
        userInfo.hometown = unicode"湖南(xxx)";
        userInfo.homeAddress = unicode"深圳龙华";
        user.info = userInfo;
    }

    function setPersonTwo() public {
        user2Info = PersonInfo({
            university: unicode"深圳大学",
            hometown: unicode"湖南(xxx)",
            homeAddress: unicode"深圳龙华"
        });
        user2 = Person({
            name: unicode"zhangsan",
            age: 100,
            walletAddress: msg.sender,
            info: user2Info
        });
    }

    function getUser() public view returns (string memory, uint256, address) {
        return (user.name, user.age, user.walletAddress);
    }

    function getUser2() public view returns (string memory, uint256, address) {
        return (user2.name, user2.age, user2.walletAddress);
    }

    function getUserAllInfo() public view returns (Person memory) {
        return user;
    }

    function getUserInfo() public view returns (PersonInfo memory) {
        return user2Info;
    }
}
