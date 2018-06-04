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

contract Account {
	address[] participants;
	mapping(address=>uint) balances;
	uint dailyLimit;
	uint spentToday;

	function() payable{
		balances[msg.sender] += msg.value;
	};

	function send(address _to) public payable returns(bool){
		require(msg.value <= sub(dailyLimit, spentToday));
		require(balances[msg.sender] >= msg.value);
		balances[msg.sender] -= msg.value;
		_to.transfer(msg.value);
	};

	function categorizeVendor();
	function approve(address _to, uint amount);
	function liquidate();
}