pragma solidity ^0.4.23;

contract Registry {
	mapping(address => address[]) public homies;
	mapping(address => address) public budgets;

	constructor() public {

	}

	modifier areNotAlreadyHomies(address _homie1, address _homie2) { 
		bool areHomies = false;
		for(uint i; i < homies[_homie1].length; i++) {
			if(homies[_homie1][i] == _homie2) areHomies = true;
		}
		require(!areHomies);
		_; 
	}


	function linkUp(address _homie) public areNotAlreadyHomies(msg.sender, _homie){
		homies[msg.sender].push(_homie);
	}
}
