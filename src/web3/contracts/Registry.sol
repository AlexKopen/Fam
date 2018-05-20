pragma solidity ^0.4.23;

contract Registry {
	// IterableMapping.itmap homies;
	// IterableMapping.itmap budgets;
	address[] registrants;
	mapping(address => address[]) public homies;
	//mapping(address => address) public budgets;

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

	modifier isNotAlreadyRegistered(address _registrant) {
		require(!isRegistered(_registrant));
		_;
	}


	function linkUp(address _homie) public areNotAlreadyHomies(msg.sender, _homie) {
		homies[msg.sender].push(_homie);
	}

	function register(address _registrant) public isNotAlreadyRegistered(_registrant) {
		registrants.push(_registrant);
	}

	function isRegistered(address _registrant) public view
	returns(bool) {
		for(uint i; i < registrants.length; i++) {
			if(registrants[i] == _registrant) return true;
		}
		return false;
	}
}
