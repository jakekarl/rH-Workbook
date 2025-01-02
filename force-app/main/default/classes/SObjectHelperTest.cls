@isTest
private class SObjectHelperTest {
	@isTest
	private static void canQueryObj() {
		String obj = 'Account';

		Test.startTest();
		Boolean canQuery = SObjectHelper.canQueryObj(obj);
		Test.stopTest();

		System.assert(canQuery, 'Did not return true');
	}

	@isTest
	private static void canQueryObj_Blank() {
		String obj;

		Exception thrownException;
		Test.startTest();
		try {
			SObjectHelper.canQueryObj(obj);
		} catch (Exception e) {
			thrownException = e;
		}
		Test.stopTest();

		System.assert(thrownException != null, 'No exception was thrown');
	}

	@isTest
	private static void isObjectCreateable() {
		String obj = 'Account';

		Test.startTest();
		Boolean canQuery = SObjectHelper.isObjectCreateable(obj);
		Test.stopTest();

		System.assert(canQuery, 'Did not return true');
	}

	@isTest
	private static void isObjectDeletable() {
		String obj = 'Account';

		Test.startTest();
		Boolean canQuery = SObjectHelper.isObjectDeletable(obj);
		Test.stopTest();

		System.assert(canQuery, 'Did not return true');
	}

	@isTest
	private static void objInsert_List() {
		Account account = new Account();
		account.Name = 'Test Account';

		Test.startTest();
		List<Account> accounts = SObjectHelper.objInsert(new List<Account>{ account });
		Test.stopTest();

		System.assertEquals(1, accounts.size(), 'Did not return exactly 1 account');
		System.assert(accounts[0].Id != null, 'Did not insert the account');
	}

	@isTest
	private static void objInsert_List_EmptyList() {
		Test.startTest();
		List<Account> accounts = SObjectHelper.objInsert(new List<Account>());
		Test.stopTest();

		System.assertEquals(0, accounts.size(), 'Did not return an empty list');
	}

	@isTest
	private static void objUpdate_List() {
		Account account = new Account();
		account.Name = 'Test Account ' + Datetime.now().getTime();
		insert account;

		String updatedName = 'Updated Name';
		account.Name = updatedName;

		Test.startTest();
		List<Account> accounts = SObjectHelper.objUpdate(new List<Account>{ account });
		Test.stopTest();

		System.assertEquals(1, accounts.size(), 'Did not return exactly 1 account');
		System.assertEquals(updatedName, accounts[0].Name, 'Did not update the account');
	}

	@isTest
	private static void objUpsert_List() {
		Account oldAccount = new Account();
		oldAccount.Name = 'Test Account ' + Datetime.now().getTime();
		insert oldAccount;

		String updatedName = 'Updated Name';
		oldAccount.Name = updatedName;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';

		Test.startTest();
		List<Account> accounts = SObjectHelper.objUpsert(new List<Account>{ oldAccount, newAccount });
		Test.stopTest();

		System.assertEquals(2, accounts.size(), 'Did not return exactly 2 accounts');
	}

	@isTest
	private static void objInsert() {
		Account account = new Account();
		account.Name = 'Test Account';

		Test.startTest();
		account = (Account) SObjectHelper.objInsert(account);
		Test.stopTest();

		System.assert(account.Id != null, 'Did not insert the account');
	}

	@isTest
	private static void objUpdate() {
		Account account = new Account();
		account.Name = 'Test Account';
		insert account;

		String updatedName = 'Updated Name';
		account.Name = updatedName;

		Test.startTest();
		account = (Account) SObjectHelper.objUpdate(account);
		Test.stopTest();

		System.assertEquals(updatedName, account.Name, 'Did not update the account');
	}

	@isTest
	private static void objUpsert() {
		Account account = new Account();
		account.Name = 'Test Account';

		Test.startTest();
		account = (Account) SObjectHelper.objUpsert(account);
		Test.stopTest();

		System.assert(account.Id != null, 'Did not upsert the account');
	}

	@isTest
	private static void isInsertable() {
		Account account = new Account();
		account.Name = 'Test Account';

		String obj = 'Account';

		Test.startTest();
		Boolean isInsertable = SObjectHelper.isInsertable(account, obj);
		Test.stopTest();

		System.assert(isInsertable, 'Did not return true');
	}
}