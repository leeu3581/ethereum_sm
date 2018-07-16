pragma solidity ^0.4.0;
import "./Ownable.sol";

contract SimpleCoin is Ownable{
    

    mapping (address => uint256) balances;
 
        string name;
        string symbol;
        address owner;
    
        uint256 totalSupply;
        uint256 ownerBalance;
        uint256 limit;
        
    mapping (address => bool) whitelisted;    
        
 
    constructor(string _name) public{
        owner = msg.sender; 
        totalSupply = 800;
        balances[owner] = totalSupply;
    } 
    
    modifier limitAmount(uint256 _value){
        if (_value <= limit){
            _;
        }
    }
    
    function addToWhitelist(address _wallet){
        whitelisted[_wallet] = true;
    }
    
    function setLimit(uint256 _limit) onlyOwner{
        limit = _limit;
    }

    function totalSupply1() constant returns (uint256){
        return totalSupply;
    }

    function balanceOf(address _owner) constant returns (uint256 ){
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) onlyOwner limitAmount(_value) returns (bool){
        if((balances[_to] += _value) >= balances[_to]){
            require(balances[msg.sender] >= _value);
            require(whitelisted[_to] == true);
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            return true;
        }
        else{
            return false;
        }
        
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
        
    }
