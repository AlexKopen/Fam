pragma solidity ^0.4.23;

library SafeMath {

    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }

    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }

    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

library SearchableArray {
	struct Data {
		address[] elements;
	}

	//this would take order of n time to complete, and 
	//could get expensive for big arrays...
	function contains(Data storage self, address val) 
	public view
	returns(bool){
		for(uint i = 0; i < self.elements.length; i++) {
			if(self.elements[i] == val) return true;
		}
		return false;
	}
}

contract Account {
	uint totalBalance;
	SearchableArray.Data participants;
	mapping(address=>uint) balances;
	uint dailyLimit;
	uint spentToday;

	function() payable {
		require(SearchableArray.contains(participants, msg.sender));
		balances[msg.sender] += msg.value;
	}

	function send(address _to) 
	public payable 
	returns(bool){
		require(msg.value <= SafeMath.sub(dailyLimit, spentToday));
		require(balances[msg.sender] >= msg.value);
		balances[msg.sender] -= msg.value;
		_to.transfer(msg.value);
	}

	function categorizeVendor(address _vendors) public;
	function approve(address _to, uint amount) public;
	function liquidate() public;
}