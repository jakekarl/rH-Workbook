@isTest
private class SObjectBuilderWorkbookSolution {
    // /****
    //  * 
    //  * INTRODUCTION
    //  * 
    //  * This section is intended to walk through the foundational building blocks of how to use SObjectBuilder
    //  * Read the TODO in each test and determine the appropriate way to complete the assertion
    //  * 
    //  ****/

    // @isTest
    // private static void createAccount() {
    //     // TODO: Create an account record

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .create();
    //     Test.stopTest();

    //     Integer numberOfAccounts = [
    //         SELECT Count()
    //         FROM Account
    //     ];

    //     Assert.areEqual(1, numberOfAccounts, 'Did not create exactly 1 account');
    // }

    // @isTest
    // private static void createAccountWithAFieldValue() {
    //     // TODO: Create an account record with the following values
    //         // Number of Employees: 100

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.NumberOfEmployees, 100)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [
    //         SELECT Id, NumberOfEmployees
    //         FROM Account
    //     ];

    //     Assert.areEqual(100, accounts[0].NumberOfEmployees, 'Did not set the Number of Employees to 100');
    // }

    // @isTest
    // private static void createAccountWithFieldValues() {
    //     // TODO: Create an account record with the following values
    //         // Number of Employees: 100
    //         // Year Started: 2020

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.NumberOfEmployees, 100)
    //         .put(Account.YearStarted, '2020')
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [
    //         SELECT Id, NumberOfEmployees, YearStarted
    //         FROM Account
    //     ];

    //     Assert.areEqual(100, accounts[0].NumberOfEmployees, 'Did not set the Number of Employees to 100');
    //     Assert.areEqual('2020', accounts[0].YearStarted, 'Did not set the Year Started to 2020');
    // }

    // @isTest
    // private static void createMultipleAccounts() {
    //     // TODO: Create 10 account records

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     Integer numberOfAccounts = [
    //         SELECT Count()
    //         FROM Account
    //     ];

    //     Assert.areEqual(10, numberOfAccounts, 'Did not create exactly 10 account');
    // }


    // @isTest
    // private static void createMultipleAccountsWithFieldValues() {
    //     // TODO: Create 10 account records with the following values
    //         // Number of Employees: 5
    //         // Year Started: 2021
    //         // Annual Revenue: $1,000,000

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.NumberOfEmployees, 5)
    //         .put(Account.YearStarted, '2021')
    //         .put(Account.AnnualRevenue, 1000000)
    //         .count(5)
    //         .create();
    //     Test.stopTest();

    //     Integer numberOfAccounts = [
    //         SELECT Count()
    //         FROM Account
    //     ];

    //     Assert.areEqual(5, numberOfAccounts, 'Did not create exactly 5 account');

    //     List<Account> accounts = [
    //         SELECT Id, NumberOfEmployees, YearStarted, AnnualRevenue
    //         FROM Account
    //     ];

    //     Assert.areEqual(5, accounts[0].NumberOfEmployees, 'Did not set the Number of Employees to 100');
    //     Assert.areEqual('2021', accounts[0].YearStarted, 'Did not set the Year Started to 2020');
    //     Assert.areEqual(1000000, accounts[0].AnnualRevenue, 'Did not set the Annual Revenue to $1,000,000');
    // }

    // @isTest
    // private static void createAccountAndReturn() {
    //     // TODO: Create an account record and return it

    //     Test.startTest();
    //     Account account = (Account) new SObjectBuilder(Account.sObjectType)
    //         .create()
    //         .getRecord();
    //     Test.stopTest();

    //     Assert.isNotNull(account.Id, 'Did not insert the account record');
    // }

    // @isTest
    // private static void createMultipleAccountsAndReturn() {
    //     // TODO: Create 10 account records and return them

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id FROM Account];

    //     Assert.areEqual(10, accounts.size(), 'Did not create 10 account records');
    // }

    // @isTest
    // private static void addFieldToRequiredFieldCache() {
    //     // TODO: Create a new required field on the account object
    //         // Field name: Number of Locations
    //         // Field type: Number
    //         // Field required: true
    //     // TODO: Add the new required field to the account map in the RequiredFieldCache and default it to some number

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .create();
    //     Test.stopTest();

    //     Account account = [SELECT Id, Number_of_Locations__c FROM Account];

    //     Assert.isNotNull(account.Number_of_Locations__c, 'Number of Locations was not populated by the RequiredFieldCache');
    // }


    // @isTest
    // private static void addObjectToRequiredFieldCache() {
    //     // TODO: Create a new custom object
    //         // Custom object name: Building
    //     // TODO: Create a custom field
    //         // Field name: Year Built
    //         // Field type: Text
    //         // Field required: true
    //     // TODO: Add the new object and required field to the RequiredFieldCache

    //     Test.startTest();
    //     new SObjectBuilder(Building__c.sObjectType)
    //         .create();
    //     Test.stopTest();

    //     Building__c building = [SELECT Id, Year_Built__c FROM Building__c];
    //     Assert.isNotNull(building.Year_Built__c, 'Year Built was not populated by the RequiredFieldCache');
    // }

    // @isTest
    // private static void addRelationalFieldToRequiredFieldCache() {
    //     // TODO: Create a Master-Detail to Account on the new Building object
    //         // Field name: Account
    //         // Field type: Master-Detail
    //     // TODO: Add the field to the RequiredFieldCache using the GenericParentProvider

    //     Test.startTest();
    //     new SObjectBuilder(Building__c.sObjectType)
    //         .create();
    //     Test.stopTest();

    //     Building__c building = [SELECT Id, Account__c FROM Building__c];
    //     Assert.isNotNull(building.Account__c, 'Account was not populated by the RequiredFieldCache');
    // }

    // @isTest
    // private static void buildAccount() {
    //     // TODO: Build an account record without inserting it

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .build();
    //     Test.stopTest();

    //     Integer numberOfAccounts = [
    //         SELECT Count()
    //         FROM Account
    //     ];

    //     Assert.areEqual(0, numberOfAccounts, 'Should not have inserted the account record');
    // }

    // /****
    //  * 
    //  * INTERMEDIATE
    //  * 
    //  * Now that the basic building blocks of SObjectBuilder have been defined, let's learn how to use the utilities also known as "providers"
    //  * Use of the given "providers" in the SObjectFactory class to solve many of them
    //  * 
    //  ****/

    // @isTest
    // private static void provideUniqueNumber() {
    //     // TODO: Create 10 accounts with a unique number of employees

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.NumberOfEmployees, SObjectFactory.provideUniqueNumber())
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id, NumberOfEmployees FROM Account];

    //     Set<Integer> uniqueEmployeeCounts = new Set<Integer>();

    //     for (Account account : accounts) {
    //         uniqueEmployeeCounts.add(account.NumberOfEmployees);
    //     }

    //     Assert.areEqual(10, uniqueEmployeeCounts.size(), 'Did not set unique values for all accounts');
    // }

    // @isTest
    // private static void provideUniqueNumberWithAStart() {
    //     // TODO: Create 10 accounts with a unique number of employees and a minimum of 1000 employees

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.NumberOfEmployees, SObjectFactory.provideUniqueNumber(1000))
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id, NumberOfEmployees FROM Account];

    //     Set<Integer> uniqueEmployeeCounts = new Set<Integer>();

    //     for (Account account : accounts) {
    //         Assert.isTrue(account.NumberOfEmployees >= 1000, 'NumberOfEmployees is less than 1000');
    //         uniqueEmployeeCounts.add(account.NumberOfEmployees);
    //     }

    //     Assert.areEqual(10, uniqueEmployeeCounts.size(), 'Did not set unique values for all accounts');
    // }

    // @isTest
    // private static void provideUniqueDate() {
    //     // TODO: Create 10 contacts with a unique birthday

    //     Test.startTest();
    //     new SObjectBuilder(Contact.sObjectType)
    //         .put(Contact.Birthdate, SObjectFactory.provideUniqueDate())
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Contact> contacts = [SELECT Id, Birthdate FROM Contact];

    //     Set<Date> uniqueBirthdays = new Set<Date>();

    //     for (Contact contact : contacts) {
    //         uniqueBirthdays.add(contact.Birthdate);
    //     }

    //     Assert.areEqual(10, uniqueBirthdays.size(), 'Did not set unique values for all contact birthdays');
    // }

    // @isTest
    // private static void provideUniqueDateWithStart() {
    //     // TODO: Create 10 contacts with a unique birthday after 2030

    //     Test.startTest();
    //     new SObjectBuilder(Contact.sObjectType)
    //         .put(Contact.Birthdate, SObjectFactory.provideUniqueDate(Date.newInstance(2030, 01, 01)))
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Contact> contacts = [SELECT Id, Birthdate FROM Contact];

    //     Set<Date> uniqueBirthdays = new Set<Date>();

    //     for (Contact contact : contacts) {
    //         Assert.isTrue(contact.Birthdate.year() >= 2030, 'Did not set birthday to at least 2030');
    //         uniqueBirthdays.add(contact.Birthdate);
    //     }

    //     Assert.areEqual(10, uniqueBirthdays.size(), 'Did not set unique values for all contact birthdays');
    // }

    // @isTest
    // private static void provideUniqueString() {
    //     // TODO: Create 10 accounts with a unique name

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, SObjectFactory.provideUniqueString())
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id, Name FROM Account];

    //     Set<String> uniqueNames = new Set<String>();

    //     for (Account account : accounts) {
    //         uniqueNames.add(account.Name);
    //     }

    //     Assert.areEqual(10, uniqueNames.size(), 'Did not set unique values for all account names');
    // }

    // @isTest
    // private static void provideUniqueStringWithABase() {
    //     // TODO: Create 10 accounts with a unique name starting with radianHub

    //     Test.startTest();
    //     List<Account> accounts = new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, SObjectFactory.provideUniqueString('radianHub'))
    //         .count(10)
    //         .create()
    //         .getRecords();
    //     Test.stopTest();

    //     Set<String> uniqueNames = new Set<String>();

    //     for (Account account : accounts) {
    //         Assert.isTrue(account.Name.startsWith('radianHub'), 'Name does not start with radianHub');
    //         uniqueNames.add(account.Name);
    //     }

    //     Assert.areEqual(10, uniqueNames.size(), 'Did not set unique values for all account names');
    // }

    // @isTest
    // private static void provideUniqueFixedLengthString() {
    //     // TODO: Create 10 accounts with a unique 15 character name

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, SObjectFactory.provideUniqueFixedLengthString(15))
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id, Name FROM Account];

    //     Set<String> uniqueNames = new Set<String>();

    //     for (Account account : accounts) {
    //         Assert.isTrue(account.Name.length() == 15, 'Did not set account name to 15 characters');
    //         uniqueNames.add(account.Name);
    //     }

    //     Assert.areEqual(10, uniqueNames.size(), 'Did not set unique values for all account names');
    // }

    // @isTest
    // private static void provideUniqueFixedLengthStringWithABase() {
    //     // TODO: Create 10 accounts with a unique 15 character name starting with radianHub

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, SObjectFactory.provideUniqueFixedLengthString('radianHub', 15))
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id, Name FROM Account];

    //     Set<String> uniqueNames = new Set<String>();

    //     for (Account account : accounts) {
    //         Assert.isTrue(account.Name.length() == 15, 'Did not set account name to 15 characters');
    //         Assert.isTrue(account.Name.startsWith('radianHub'), 'Name does not start with radianHub');
    //         uniqueNames.add(account.Name);
    //     }

    //     Assert.areEqual(10, uniqueNames.size(), 'Did not set unique values for all account names');
    // }

    // @IsTest
    // private static void provideDummyId() {
    //     // TODO: Build a contact to use and provide an account id, but don't insert an account into the system

    //     Test.startTest();
    //     Contact contact = (Contact) new SObjectBuilder(Contact.sObjectType)
    //         .put(Contact.AccountId, SObjectFactory.provideDummyId(Account.sObjectType))
    //         .build()
    //         .getRecord();
    //     Test.stopTest();

    //     Integer numberOfAccounts = [SELECT Count() FROM Account];
    //     Assert.areEqual(0, numberOfAccounts, 'Should have have inserted any account records');

    //     Assert.isNotNull(contact.AccountId, 'Did not generate an account Id');
    // }

    // @isTest
    // private static void provideGenericParent() {
    //     // TODO: Create a custom field on account
    //         // Field name: Primary Contact
    //         // Field type: Lookup
    //     // TODO: Create an account and assign a primary contact

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Primary_Contact__c, SObjectFactory.provideGenericParent(Contact.sObjectType))
    //         .create();
    //     Test.stopTest();

    //     Account account = [SELECT Id, Primary_Contact__c FROM Account];

    //     Assert.isNotNull(account.Primary_Contact__c, 'Did not assign a primary contact');
    // }

    // @isTest
    // private static void provideGenericParentWithFieldValues() {
    //     // TODO: Create a custom field on account
    //         // Field name: Primary Contact
    //         // Field type: Lookup
    //     // TODO: Create an account and assign a primary contact with the last name Johnson

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Primary_Contact__c, SObjectFactory.provideGenericParent(Contact.sObjectType, Contact.LastName.getDescribe().getSobjectField(), 'Johnson'))
    //         .create();
    //     Test.stopTest();

    //     Account account = [SELECT Id, Primary_Contact__c FROM Account];

    //     Assert.isNotNull(account.Primary_Contact__c, 'Did not assign a primary contact');

    //     Contact contact = [
    //         SELECT Id, LastName
    //         FROM Contact
    //         WHERE Id = :account.Primary_Contact__c
    //     ];

    //     Assert.areEqual('Johnson', contact.LastName, 'Did not assign a last name of Johnson');
    // }

    // @isTest
    // private static void provideList() {
    //     // TODO: Create 15 account records
    //         // 5 records should have 10 employees
    //         // 5 records should have 100 employees
    //         // 5 records should have 1000 employees

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.NumberOfEmployees, SObjectFactory.provideList(new List<Integer>{
    //             10,
    //             100,
    //             1000
    //         }))
    //         .count(15)
    //         .create();
    //     Test.stopTest();

    //     Integer smallAccounts = 0;
    //     Integer mediumAccounts = 0;
    //     Integer largeAccounts = 0;

    //     List<Account> accounts = [SELECT Id, NumberOfEmployees FROM Account];

    //     Assert.areEqual(15, accounts.size(), 'Did not create 15 account records');

    //     for (Account account : accounts) {
    //         if (account.NumberOfEmployees == 10) {
    //             smallAccounts++;
    //         } else if (account.NumberOfEmployees == 100) {
    //             mediumAccounts++;
    //         } else if (account.NumberOfEmployees == 1000) {
    //             largeAccounts++;
    //         }
    //     }

    //     Assert.areEqual(5, smallAccounts, 'Did not create 5 account records with 10 employees');
    //     Assert.areEqual(5, mediumAccounts, 'Did not create 5 account records with 100 employees');
    //     Assert.areEqual(5, largeAccounts, 'Did not create 5 account records with 1000 employees');
    // }

    // @isTest
    // private static void provideParentsByCount() {
    //     // TODO: Create 15 contact records, split evenly among 3 different account records

    //     Test.startTest();
    //     new SObjectBuilder(Contact.sObjectType)
    //         .put(Contact.AccountId, SObjectFactory.provideParents(Account.sObjectType, 3))
    //         .count(15)
    //         .create();
    //     Test.stopTest();

    //     List<Contact> contacts = [SELECT Id, AccountId FROM Contact];
    //     Assert.areEqual(15, contacts.size(), 'Did not create 15 contact records');

    //     Set<Id> accountIds = new Set<Id>();

    //     for (Contact contact : contacts) {
    //         accountIds.add(contact.AccountId);
    //     }

    //     Assert.areEqual(3, accountIds.size(), 'Did not create 3 different account records');
    // }

    // @isTest
    // private static void provideParentsByList() {
    //     // TODO: Create 10 opportunity records and pass in a list of 4 accounts to be assigned as the parent records

    //     Test.startTest();

    //     List<Account> accounts = new SObjectBuilder(Account.sObjectType)
    //         .count(4)
    //         .create()
    //         .getRecords();

    //     new SObjectBuilder(Opportunity.sObjectType)
    //         .put(Opportunity.AccountId, SObjectFactory.provideParents(accounts))
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Opportunity> opportunities = [SELECT Id, AccountId FROM Opportunity];
    //     Assert.areEqual(10, opportunities.size(), 'Did not create 10 opportunity records');

    //     Set<Id> accountIds = new Set<Id>();

    //     for (Opportunity opportunity : opportunities) {
    //         accountIds.add(opportunity.AccountId);
    //     }

    //     Assert.areEqual(4, accountIds.size(), 'Did not create 4 different account records');
    // }

    // @isTest
    // private static void provideParentsById() {
    //     // TODO: Create 10 opportunity records and pass in a list of 2 account ids to be assigned as the parent records

    //     Test.startTest();
    //     List<Account> accounts = new SObjectBuilder(Account.sObjectType)
    //         .count(2)
    //         .create()
    //         .getRecords();

    //     new SObjectBuilder(Opportunity.sObjectType)
    //         .put(Opportunity.AccountId, SObjectFactory.provideParents(new Set<Id>{ accounts[0].Id, accounts[1].Id }))
    //         .count(10)
    //         .create();
    //     Test.stopTest();

    //     List<Opportunity> opportunities = [SELECT Id, AccountId FROM Opportunity];
    //     Assert.areEqual(10, opportunities.size(), 'Did not create 10 opportunity records');

    //     Set<Id> accountIds = new Set<Id>();

    //     for (Opportunity opportunity : opportunities) {
    //         accountIds.add(opportunity.AccountId);
    //     }

    //     Assert.areEqual(2, accountIds.size(), 'Did not assign 2 different account records');
    // }

    // @isTest
    // private static void provideQueriedParent() {
    //     // TODO: Create 10 opportunity records and query for the parent account with the name Company ABC

    //     Test.startTest();
    //     Account account = (Account) new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, 'Company ABC')
    //         .create()
    //         .getRecord();

    //     String query = 'SELECT Id FROM Account WHERE Name = \'Company ABC\'';
    //     List<Opportunity> opportunities = new SObjectBuilder(Opportunity.sObjectType)
    //         .put(Opportunity.AccountId, SObjectFactory.provideQueriedParent(query))
    //         .count(10)
    //         .create()
    //         .getRecords();
    //     Test.stopTest();

    //     Integer numberOfOpportunities = [
    //         SELECT COUNT()
    //         FROM Opportunity
    //         WHERE Account.Name = 'Company ABC'
    //     ];
        
    //     Assert.areEqual(10, numberOfOpportunities, 'Did not create 10 opportunity records');
    // }

    // @isTest
    // private static void provideQueriedParentByObject() {
    //     // TODO: Create 10 opportunity records and query for a parent account

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, 'Company ABC')
    //         .create();

    //     List<Opportunity> opportunities = new SObjectBuilder(Opportunity.sObjectType)
    //         .put(Opportunity.AccountId, SObjectFactory.provideQueriedParent(Account.sObjectType))
    //         .count(10)
    //         .create()
    //         .getRecords();
    //     Test.stopTest();

    //     Integer numberOfOpportunities = [
    //         SELECT COUNT()
    //         FROM Opportunity
    //         WHERE Account.Name = 'Company ABC'
    //     ];
        
    //     Assert.areEqual(10, numberOfOpportunities, 'Did not create 10 opportunity records');
    // }

    // /****
    //  * 
    //  * ADVANCED
    //  * 
    //  * Test yourself by completing a few more examples. Use a combination of providers to complete the requirements
    //  * 
    //  ****/

    // @isTest
    // private static void advanced1() {
    //     // TODO: Create 100 accounts with the following criteria
    //         // All accounts must have unique names starting with the word 'Company'
    //         // 25 accounts each with Education, Manufacturing, Retail, and Transportation industries
    //         // All accounts should be owned by two different owners, 50 each

    //     Test.startTest();
    //     new SObjectBuilder(Account.sObjectType)
    //         .put(Account.Name, SObjectFactory.provideUniqueString('Company'))
    //         .put(Account.Industry, SObjectFactory.provideList(new List<String>{
    //             'Education',
    //             'Manufacturing',
    //             'Retail',
    //             'Transportation'
    //         }))
    //         .put(Account.OwnerId, SObjectFactory.provideParents(User.sObjectType, 2))
    //         .count(100)
    //         .create();
    //     Test.stopTest();

    //     List<Account> accounts = [SELECT Id, Name FROM Account];

    //     Set<String> uniqueAccountNames = new Set<String>();

    //     for (Account account : accounts) {
    //         uniqueAccountNames.add(account.Name);
    //     }

    //     Assert.areEqual(100, uniqueAccountNames.size(), 'Did not generate 100 unique account names');

    //     List<AggregateResult> industryResults = [SELECT Count(Id), Industry industry FROM Account GROUP BY Industry];

    //     Assert.areEqual(4, industryResults.size(), 'Did not specify 4 different industries');

    //     for (AggregateResult aggregate : industryResults) {
    //         Assert.areEqual(25, aggregate.get('expr0'), 'Did not create 25 accounts with an ' + aggregate.get('industry') + ' industry');
    //     }

    //     List<AggregateResult> ownerResults = [SELECT Count(Id), OwnerId owner FROM Account GROUP BY OwnerId];

    //     Assert.areEqual(2, ownerResults.size(), 'Did not create accounts under 2 different owners');

    //     for (AggregateResult aggregate : ownerResults) {
    //         Assert.areEqual(50, aggregate.get('expr0'), 'Did not create 50 accounts under one owner');
    //     }
    // }

    // @isTest
    // private static void advanced2() {
    //     // TODO: Create an opportunity that has 3 products attached with the following values
    //         // First product should have a unit price of $3 and a quantity of 5
    //         // Second product should have a unit price of $5 and a quantity of 10
    //         // Third product should have a unit price of $100 and a quantity of 1
    //         // The opportunity amount should total to $165

    //     Test.startTest();
    //     List<PricebookEntry> pricebookEntries = new SObjectBuilder(PricebookEntry.sObjectType)
    //         .put(PricebookEntry.Product2Id, SObjectFactory.provideParents(Product2.sObjectType, 3))
    //         .count(3)
    //         .create()
    //         .getRecords();

    //     new SObjectBuilder(OpportunityLineItem.sObjectType)
    //         .put(OpportunityLineItem.OpportunityId, SObjectFactory.provideGenericParent(Opportunity.sObjectType))
    //         .put(OpportunityLineItem.PricebookEntryId, SObjectFactory.provideParents(pricebookEntries))
    //         .put(OpportunityLineItem.Quantity, SObjectFactory.provideList(new List<Integer>{
    //             3,
    //             5,
    //             1
    //         }))
    //         .put(OpportunityLineItem.UnitPrice, SObjectFactory.provideList(new List<Integer>{
    //             5,
    //             10,
    //             100
    //         }))
    //         .count(3)
    //         .create();
    //     Test.stopTest();

    //     Opportunity opportunity = [
    //         SELECT Id, Amount, (SELECT Id FROM OpportunityLineItems)
    //         FROM Opportunity
    //     ];

    //     Assert.areEqual(3, opportunity.OpportunityLineItems.size(), 'Did not create the correct number of opportunity line items');
    //     Assert.areEqual(165, opportunity.Amount, 'Did not create the correct set of products totaling $165');
    // }

    // @isTest
    // private static void advanced3() {
    //     // TODO: Create a quote with at least one quote line item
    //         // Might need to enable quotes

    //     Test.startTest();
    //     new SObjectBuilder(QuoteLineItem.sObjectType)
    //         .create();
    //     Test.stopTest();

    //     Integer numberOfQuotes = [SELECT Count() FROM Quote];
    //     Assert.areEqual(1, numberOfQuotes, 'Did not create exactly 1 quote');

    //     Quote quote = [SELECT Id, GrandTotal FROM Quote];
    //     Assert.isTrue(quote.GrandTotal > 0, 'Did not add at least one quote line item');
    // }
}