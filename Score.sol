pragma solidity ^0.4.0;
contract Score {
    uint public score;
    address owner;
    
    event ScoreSet(uint);
    
    modifier onlyOwner(){
        if(msg.sender==owner){
            _;
        }
    }
    
        modifier validScore(uint _score){
        if(_score < 10){
            _;
        }
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function getScore() view public returns (uint){
        return score;
    }
    
    function setScore(uint _newScore) public onlyOwner validScore (_newScore) returns(uint){
        score = _newScore;
        emit setScore(_newScore);
        return score;
    }
    
    
