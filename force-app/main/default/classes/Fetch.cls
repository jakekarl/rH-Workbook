global class Fetch {
	global static Schema.FieldSet objectFieldSet(String objectApiName, String fieldSetApiName) {
		Schema.FieldSet fieldSet;

		Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectApiName);

		if (objectType == null) {
			return fieldSet;
		}

		return objectFieldSet(objectType, fieldSetApiName);
	}

	global static Schema.FieldSet objectFieldSet(Schema.SObjectType objectType, String fieldSetApiName) {
		Schema.FieldSet fieldSet;

		fieldSet = objectType.getDescribe().fieldsets.getMap().get(fieldSetApiName);

		return fieldSet;
	}

	global static SObject recordFieldSetData(Id recordId, String fieldSetApiName) {
		return recordFieldSetData(new List<Id>{ recordId }, fieldSetApiName)[0];
	}

	global static List<SObject> recordFieldSetData(Set<Id> recordIds, String fieldSetApiName) {
		return recordFieldSetData(new List<Id>(recordIds), fieldSetApiName);
	}

	global static List<SObject> recordFieldSetData(List<Id> recordIds, String fieldSetApiName) {
		Schema.SObjectType objectType = recordIds[0].getSobjectType();
		Schema.FieldSet fieldSet = objectFieldSet(objectType, fieldSetApiName);

		String query = 'SELECT {0} FROM {1} WHERE Id = :recordIds';

		Set<String> uniqueFields = new Set<String>{ 'Id' };

		if (fieldSet != null) {
			for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
				uniqueFields.add(fieldSetMember.getFieldPath());
			}
		}

		query = String.format(
			query,
			new List<String>{ String.join(new List<String>(uniqueFields), ', '), objectType.getDescribe().getName() }
		);
		return Database.query(query);
	}

	global static SObject recordFieldSetData(SObject record, String fieldSetApiName) {
		return recordFieldSetData(new List<SObject>{ record }, fieldSetApiName)[0];
	}

	global static List<SObject> recordFieldSetData(List<SObject> records, String fieldSetApiName) {
		Schema.SObjectType objectType = records[0].getSobjectType();
		Schema.FieldSet fieldSet = objectFieldSet(objectType, fieldSetApiName);

		String query = 'SELECT {0} FROM {1} WHERE Id = :records';

		Set<String> uniqueFields = new Set<String>{ 'Id' };

		if (fieldSet != null) {
			for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
				uniqueFields.add(fieldSetMember.getFieldPath());
			}
		}

		query = String.format(
			query,
			new List<String>{ String.join(new List<String>(uniqueFields), ', '), objectType.getDescribe().getName() }
		);
		return Database.query(query);
	}

	global static Id recordTypeIdFromDeveloperName(Schema.SObjectType objectType, String recordTypeDeveloperName) {
		return objectType.getDescribe()
			.getRecordTypeInfosByDeveloperName()
			.get(recordTypeDeveloperName)
			?.getRecordTypeId();
	}

	global static Id recordTypeIdFromDeveloperName(String objectApiName, String recordTypeDeveloperName) {
		Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectApiName);
		return recordTypeIdFromDeveloperName(objectType, recordTypeDeveloperName);
	}

	global static Id recordTypeIdFromName(Schema.SObjectType objectType, String recordTypeName) {
		return objectType.getDescribe().getRecordTypeInfosByName().get(recordTypeName)?.getRecordTypeId();
	}

	global static Id recordTypeIdFromName(String objectApiName, String recordTypeName) {
		Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectApiName);
		return recordTypeIdFromName(objectType, recordTypeName);
	}

	global static Map<String, Schema.RecordTypeInfo> recordTypesByDeveloperName(Schema.SObjectType objectType) {
		return objectType.getDescribe().getRecordTypeInfosByName();
	}

	global static Map<String, Schema.RecordTypeInfo> recordTypesByDeveloperName(String objectApiName) {
		Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectApiName);
		return objectType.getDescribe().getRecordTypeInfosByName();
	}

	global static Map<String, Schema.RecordTypeInfo> recordTypesByName(Schema.SObjectType objectType) {
		return objectType.getDescribe().getRecordTypeInfosByDeveloperName();
	}

	global static Map<String, Schema.RecordTypeInfo> recordTypesByName(String objectApiName) {
		Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectApiName);
		return objectType.getDescribe().getRecordTypeInfosByDeveloperName();
	}

	global static Map<Id, Schema.RecordTypeInfo> recordTypesById(Schema.SObjectType objectType) {
		return objectType.getDescribe().getRecordTypeInfosById();
	}

	global static Map<Id, Schema.RecordTypeInfo> recordTypesById(String objectApiName) {
		Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectApiName);
		return objectType.getDescribe().getRecordTypeInfosById();
	}
}