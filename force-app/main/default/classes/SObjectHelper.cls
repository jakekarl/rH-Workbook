public with sharing class SObjectHelper {
	public static boolean canQueryObj(String sSObject) {
		if (string.isBlank(sSObject)) {
			throw new SObjectHelperException.InvalidParameterException(
				string.format('No SObject provided.', new List<string>{ 'sSObject' })
			);
		}

		if (isObjectAccessible(sSObject) && isObjectQueryable(sSObject)) {
			return true;
		} else {
			return false;
		}
	}

	public static void checkErrors(Database.UpsertResult[] results) {
		for (Integer index = 0, size = results.size(); index < size; index++) {
			if (results[index].isSuccess()) {
				// if (results[index].isCreated()) {
				// 	System.debug(results[index].getId() + ' was created');
				// } else {
				// 	System.debug(results[index].getId() + ' was updated');
				// }
			} else {
				// system.debug('An error occurred while upserting records: ' + results[index].getErrors());
				throw new SobjectHelperException.DMLException(
					'An error occurred while upserting records: ' + results[index].getErrors()
				);
			}
		}
	}

	public static void checkErrors(Database.SaveResult[] results) {
		for (Integer index = 0, size = results.size(); index < size; index++) {
			if (results[index].isSuccess()) {
				// System.debug(results[index].getId() + ' was created');
			} else {
				// system.debug('An error occurred while inserting records: ' + results[index].getErrors());
				throw new SobjectHelperException.DMLException(
					'An error occurred while inserting records: ' + results[index].getErrors()
				);
			}
		}
	}

	public static boolean isObjectAccessible(String sSObject) {
		Schema.DescribeSObjectResult oDescribeSObjectResult = getDescribeSObjectResult(sSObject);
		return oDescribeSObjectResult.isAccessible();
	}

	public static boolean isObjectCreateable(String sSObject) {
		Schema.DescribeSObjectResult oDescribeSObjectResult = getDescribeSObjectResult(sSObject);
		return oDescribeSObjectResult.isCreateable();
	}

	public static boolean isObjectQueryable(String sSObject) {
		Schema.DescribeSObjectResult oDescribeSObjectResult = getDescribeSObjectResult(sSObject);
		return oDescribeSObjectResult.isQueryable();
	}

	public static boolean isObjectDeletable(String sSObject) {
		Schema.DescribeSObjectResult oDescribeSObjectResult = getDescribeSObjectResult(sSObject);
		return oDescribeSObjectResult.isDeletable();
	}

	public static List<Sobject> objInsert(List<SObject> records) {
		if (records.size() == 0) {
			return records;
		}

		String objName = records[0].getSObjectType().getDescribe().getName();
		if (objName != null) {
			boolean isCreatable = isObjectCreateable(objName);
			if (!isCreatable) {
				throw new SObjectHelperException.InsertPermissionException(objName + ' is not createable.');
			}
		}

		List<Sobject> cleansedRecords = stripInaccessible(records, 'Insert');
		Database.SaveResult[] results = database.insert(cleansedRecords, false);
		checkErrors(results);

		return cleansedRecords;
	}

	public static List<Sobject> objUpdate(List<SObject> records) {
		List<Sobject> cleansedRecords = stripInaccessible(records, 'Update');
		Database.SaveResult[] results = database.update(cleansedRecords, false);
		checkErrors(results);

		return cleansedRecords;
	}

	public static List<Sobject> objUpsert(List<SObject> records) {
		List<Sobject> cleansedRecords = stripInaccessible(records, 'Upsert');
		Database.UpsertResult[] results = database.upsert(cleansedRecords, false);
		checkErrors(results);

		return cleansedRecords;
	}

	public static Sobject objInsert(SObject records) {
		String objName = records.getSObjectType().getDescribe().getName();
		if (objName != null) {
			boolean isCreatable = isObjectCreateable(objName);
			if (!isCreatable) {
				throw new SObjectHelperException.InsertPermissionException(objName + ' is not createable.');
			}
		}

		Sobject cleansedRecords = stripInaccessible(records, 'Insert');
		Database.SaveResult results = database.insert(cleansedRecords, false);
		checkErrors(new List<Database.SaveResult>{ results });

		return cleansedRecords;
	}

	public static Sobject objUpdate(SObject records) {
		Sobject cleansedRecords = stripInaccessible(records, 'Update');
		Database.SaveResult results = database.update(cleansedRecords, false);
		checkErrors(new List<Database.SaveResult>{ results });

		return cleansedRecords;
	}

	public static Sobject objUpsert(SObject records) {
		Sobject cleansedRecords = stripInaccessible(records, 'Upsert');
		Database.UpsertResult results = database.upsert(cleansedRecords, false);
		checkErrors(new List<Database.UpsertResult>{ results });

		return cleansedRecords;
	}

	public static SObject stripInaccessible(SObject record, String CRUD) {
		List<SObject> records = new List<SObject>();
		records.add(record);
		return stripInaccessible(records, CRUD)[0];
	}

	public static List<SObject> stripInaccessible(List<SObject> records, String CRUD) {
		SObjectAccessDecision decision;
		if (CRUD == 'Insert') {
			decision = Security.stripInaccessible(AccessType.CREATABLE, records);
		}

		if (CRUD == 'Update') {
			decision = Security.stripInaccessible(AccessType.UPDATABLE, records);
		}

		if (CRUD == 'Upsert') {
			decision = Security.stripInaccessible(AccessType.UPSERTABLE, records);
		}

		if (CRUD == 'Query') {
			decision = Security.stripInaccessible(AccessType.READABLE, records);
		}

		// system.debug('Removed fields: ' + decision.getRemovedFields());
		// system.debug('Records: ' + decision.getRecords());
		return decision.getRecords();
	}

	public static boolean isInsertable(SObject rec, String sSobject) {
		Schema.DescribeSObjectResult r1 = getDescribeSObjectResult(sSObject);
		Map<String, Schema.SObjectField> mapFieldList = r1.fields.getMap();

		String namespace = getNameSpace();

		for (Schema.SObjectField field : mapFieldList.values()) {
			Schema.DescribeFieldResult fieldResult = field.getDescribe();
			if (
				rec.get(fieldResult.getName()) != null ||
				rec.get(fieldResult.getName().removeStart(namespace)) != null
			) {
				if (!fieldResult.isAccessible()) {
					return false;
				}
			}
		}

		return true;
	}

	private static Schema.DescribeSObjectResult getDescribeSObjectResult(String sSObject) {
		if (string.isBlank(sSObject)) {
			throw new SObjectHelperException.InvalidParameterException(
				string.format('No SObject provided.', new List<string>{ 'sSObject' })
			);
		}

		Schema.SObjectType oObjectToken = Schema.getGlobalDescribe().get(sSObject);
		if (oObjectToken == null) {
			oObjectToken = Schema.getGlobalDescribe().get(getNameSpace() + sSObject);
		}
		Schema.DescribeSObjectResult oDescribeSObjectResult = oObjectToken.getDescribe();

		return oDescribeSObjectResult;
	}

	private static String getNameSpace() {
		String sNameSpace = (SobjectHelper.canQueryObj('Organization'))
			? [SELECT NamespacePrefix FROM Organization].NamespacePrefix
			: '';
		return sNameSpace + '__';
	}
}