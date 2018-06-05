var Account = artifacts.require('Account');

contract('Registry', function(accounts){
	it("Should add a participant appropriately.", function(){
		return Account.deployed().then(function(instance){
			instance.participate(accounts[0]);
		});
	});
});