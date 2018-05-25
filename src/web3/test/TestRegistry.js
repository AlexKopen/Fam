var Registry = artifacts.require('Registry');

contract('Registry', function(accounts){
	it("Should register an account appropriately.", function(){
		return Registry.deployed().then(function(instance){
			instance.register(accounts[0]);
			return instance.isRegistered(accounts[0])
		});
	});
	it("Should not register the same account more than once.", function(){
		return Registry.deployed().then(function(instance){
			try{
				instance.register(accounts[0])
				assert.fail("Should have failed before adding the account again.");
			} catch(error) {
				assert(true);
			}
		});
	});
	// it("Should remove an account appropriately.", function(){

	// });
	// it("Should throw instead of deleting an account that doesn't exist.", function(){
		
	// });
});