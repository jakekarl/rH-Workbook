@isTest
private class FetchTest {
	@isTest
	private static void objectFieldSet_SObjectType() {
		Test.startTest();
		Schema.FieldSet fieldSet = Fetch.objectFieldSet(Account.sObjectType, 'NotRealFieldSet');
		Assert.isNull(fieldSet, 'Should not have returned a field set');
		Test.stopTest();
	}

	@isTest
	private static void objectFieldSet_ObjectApiName() {
		Test.startTest();
		Schema.FieldSet fieldSet = Fetch.objectFieldSet('Account', 'NotRealFieldSet');
		Assert.isNull(fieldSet, 'Should not have returned a field set');
		Test.stopTest();
	}

	@isTest
	private static void recordFieldSetData_Id() {
		Account account = new Account(Name = 'Test Fetch Account');
		insert account;

		Test.startTest();
		SObject record = Fetch.recordFieldSetData(account.Id, 'NotRealFieldSet');
		Assert.isNotNull(record, 'Should have returned a record');
		Assert.isTrue(account.Id == record.Id, 'Should have returned the same account');
		Test.stopTest();
	}

	@isTest
	private static void recordFieldSetData_IdSet() {
		Account account = new Account(Name = 'Test Fetch Account');
		insert account;

		Test.startTest();
		List<SObject> records = Fetch.recordFieldSetData(new Set<Id>{ account.Id }, 'NotRealFieldSet');
		Assert.isTrue(records.size() == 1, 'Should have returned a record');
		Assert.isTrue(account.Id == records[0].Id, 'Should have returned the same record');
		Test.stopTest();
	}

	@isTest
	private static void recordFieldSetData_IdList() {
		Account account = new Account(Name = 'Test Fetch Account');
		insert account;

		Test.startTest();
		List<SObject> records = Fetch.recordFieldSetData(new List<Id>{ account.Id }, 'NotRealFieldSet');
		Assert.isTrue(records.size() == 1, 'Should have returned a record');
		Assert.isTrue(account.Id == records[0].Id, 'Should have returned the same record');
		Test.stopTest();
	}

	@isTest
	private static void recordFieldSetData_Object() {
		Account account = new Account(Name = 'Test Fetch Account');
		insert account;

		Test.startTest();
		SObject record = Fetch.recordFieldSetData(account, 'NotRealFieldSet');
		Assert.isNotNull(record, 'Should have returned a record');
		Assert.isTrue(account.Id == record.Id, 'Should have returned the same account');
		Test.stopTest();
	}

	@isTest
	private static void recordFieldSetData_ObjectList() {
		Account account = new Account(Name = 'Test Fetch Account');
		insert account;

		Test.startTest();
		List<SObject> records = Fetch.recordFieldSetData(new List<Account>{ account }, 'NotRealFieldSet');
		Assert.isTrue(records.size() == 1, 'Should have returned a record');
		Assert.isTrue(account.Id == records[0].Id, 'Should have returned the same record');
		Test.stopTest();
	}

	@isTest
	private static void recordTypeIdFromDeveloperName_SObjectType() {
		Test.startTest();
		Id recordTypeId = Fetch.recordTypeIdFromDeveloperName(Account.SObjectType, 'Master');
		Test.stopTest();

		Assert.isNotNull(recordTypeId, 'Should have returned an Id');
	}

	@isTest
	private static void recordTypeIdFromDeveloperName_ObjectApiName() {
		Test.startTest();
		Id recordTypeId = Fetch.recordTypeIdFromDeveloperName('Account', 'Master');
		Test.stopTest();

		Assert.isNotNull(recordTypeId, 'Should have returned an Id');
	}

	@isTest
	private static void recordTypeIdFromName_SObjectType() {
		Test.startTest();
		Id recordTypeId = Fetch.recordTypeIdFromName(Account.SObjectType, 'Master');
		Test.stopTest();

		Assert.isNotNull(recordTypeId, 'Should have returned an Id');
	}

	@isTest
	private static void recordTypeIdFromName_ObjectApiName() {
		Test.startTest();
		Id recordTypeId = Fetch.recordTypeIdFromName('Account', 'Master');
		Test.stopTest();

		Assert.isNotNull(recordTypeId, 'Should have returned an Id');
	}

	@isTest
	private static void recordTypesByDeveloperName_SObjectType() {
		Test.startTest();
		Map<String, Schema.RecordTypeInfo> recordTypes = Fetch.recordTypesByDeveloperName(Account.sObjectType);
		Test.stopTest();

		Assert.isTrue(recordTypes.keySet().size() > 0, 'Did not return at least 1 record type');
	}

	@isTest
	private static void recordTypesByDeveloperName_ObjectApiName() {
		Test.startTest();
		Map<String, Schema.RecordTypeInfo> recordTypes = Fetch.recordTypesByDeveloperName('Account');
		Test.stopTest();

		Assert.isTrue(recordTypes.keySet().size() > 0, 'Did not return at least 1 record type');
	}

	@isTest
	private static void recordTypesByName_SObjectType() {
		Test.startTest();
		Map<String, Schema.RecordTypeInfo> recordTypes = Fetch.recordTypesByName(Account.sObjectType);
		Test.stopTest();

		Assert.isTrue(recordTypes.keySet().size() > 0, 'Did not return at least 1 record type');
	}

	@isTest
	private static void recordTypesByName_ObjectApiName() {
		Test.startTest();
		Map<String, Schema.RecordTypeInfo> recordTypes = Fetch.recordTypesByName('Account');
		Test.stopTest();

		Assert.isTrue(recordTypes.keySet().size() > 0, 'Did not return at least 1 record type');
	}

	@isTest
	private static void recordTypesById_SObjectType() {
		Test.startTest();
		Map<Id, Schema.RecordTypeInfo> recordTypes = Fetch.recordTypesById(Account.sObjectType);
		Test.stopTest();

		Assert.isTrue(recordTypes.keySet().size() > 0, 'Did not return at least 1 record type');
	}

	@isTest
	private static void recordTypesById_ObjectApiName() {
		Test.startTest();
		Map<Id, Schema.RecordTypeInfo> recordTypes = Fetch.recordTypesById('Account');
		Test.stopTest();

		Assert.isTrue(recordTypes.keySet().size() > 0, 'Did not return at least 1 record type');
	}
}