@IsTest
public class RequiredFieldsCache {
	public static Map<SObjectField, Object> get(SObjectType sObjectType) {
		return cache.containsKey(sObjectType) ? cache.get(sObjectType) : new Map<SObjectField, Object>();
	}

	public static IFieldProvider getGenericParentProvider(SObjectType sObjectType) {
		if (!genericParentProviders.containsKey(sObjectType))
			genericParentProviders.put(sObjectType, SObjectFactory.provideGenericParent(sObjectType));
		return genericParentProviders.get(sObjectType);
	}
	static Map<SObjectType, IFieldProvider> genericParentProviders = new Map<SObjectType, IFieldProvider>();

	static Map<SObjectType, Map<SObjectField, Object>> cache = new Map<SObjectType, Map<SObjectField, Object>>{
		Account.sObjectType => new Map<SObjectField, Object>{ Account.Name => 'Some Account' },
		AccountContactRole.sObjectType => new Map<SObjectField, Object>{
			AccountContactRole.AccountId => getGenericParentProvider(Account.sObjectType),
			AccountContactRole.ContactId => getGenericParentProvider(Contact.sObjectType)
		},
		Asset.sObjectType => new Map<SObjectField, Object>{ Asset.AccountId => getGenericParentProvider(Account.sObjectType), Asset.Name => 'Some Asset' },
		Attachment.sObjectType => new Map<SObjectField, Object>{
			Attachment.ParentId => getGenericParentProvider(Account.sObjectType),
			Attachment.Body => Blob.valueOf('body'),
			Attachment.Name => 'Some Attachment'
		},
		Campaign.sObjectType => new Map<SObjectField, Object>{ Campaign.Name => 'Some Campaign' },
		CampaignMember.sObjectType => new Map<SObjectField, Object>{
			CampaignMember.CampaignId => getGenericParentProvider(Campaign.sObjectType),
			CampaignMember.ContactId => getGenericParentProvider(Contact.sObjectType)
		},
		CaseComment.sObjectType => new Map<SObjectField, Object>{ CaseComment.ParentId => getGenericParentProvider(Case.sObjectType) },
		CaseContactRole.sObjectType => new Map<SObjectField, Object>{
			CaseContactRole.CasesId => getGenericParentProvider(Case.sObjectType),
			CaseContactRole.ContactId => getGenericParentProvider(Contact.sObjectType),
			CaseContactRole.Role => 'Role'
		},
		CaseSolution.sObjectType => new Map<SObjectField, Object>{
			CaseSolution.CaseId => getGenericParentProvider(Case.sObjectType),
			CaseSolution.SolutionId => getGenericParentProvider(Solution.sObjectType)
		},
		CaseTeamMember.sObjectType => new Map<SObjectField, Object>{
			CaseTeamMember.TeamRoleId => getGenericParentProvider(CaseTeamRole.sObjectType),
			CaseTeamMember.ParentId => getGenericParentProvider(Case.sObjectType),
			CaseTeamMember.MemberId => getGenericParentProvider(User.sObjectType)
		},
		CaseTeamRole.sObjectType => new Map<SObjectField, Object>{
			CaseTeamRole.Name => SObjectFactory.provideUniqueString('Some Role'),
			CaseTeamRole.AccessLevel => 'Edit'
		},
		CaseTeamTemplate.sObjectType => new Map<SObjectField, Object>{ CaseTeamTemplate.Name => SObjectFactory.provideUniqueString('Some Template') },
		CaseTeamTemplateMember.sObjectType => new Map<SObjectField, Object>{
			CaseTeamTemplateMember.TeamTemplateId => getGenericParentProvider(CaseTeamTemplate.sObjectType),
			CaseTeamTemplateMember.TeamRoleId => getGenericParentProvider(CaseTeamRole.sObjectType),
			CaseTeamTemplateMember.MemberId => getGenericParentProvider(User.sObjectType)
		},
		CaseTeamTemplateRecord.sObjectType => new Map<SObjectField, Object>{
			CaseTeamTemplateRecord.TeamTemplateId => getGenericParentProvider(CaseTeamTemplate.sObjectType),
			CaseTeamTemplateRecord.ParentId => getGenericParentProvider(Case.sObjectType)
		},
		Contact.sObjectType => new Map<SObjectField, Object>{ Contact.LastName => 'Doe' },
		ContentVersion.sObjectType => new Map<SObjectField, Object>{
			ContentVersion.Title => 'Some Content',
			ContentVersion.PathOnClient => 'some/path',
			ContentVersion.VersionData => Blob.valueOf('data')
		},
		Contract.sObjectType => new Map<SObjectField, Object>{ Contract.AccountId => getGenericParentProvider(Account.sObjectType) },
		ContractContactRole.sObjectType => new Map<SObjectField, Object>{
			ContractContactRole.ContractId => getGenericParentProvider(Contract.sObjectType),
			ContractContactRole.ContactId => getGenericParentProvider(Contact.sObjectType)
		},
		Document.sObjectType => new Map<SObjectField, Object>{
			Document.FolderId => getGenericParentProvider(User.sObjectType),
			Document.Name => 'Some Document'
		},
		EmailTemplate.sObjectType => new Map<SObjectField, Object>{
			EmailTemplate.DeveloperName => SObjectFactory.provideUniqueString('Template'),
			EmailTemplate.FolderId => getGenericParentProvider(User.sObjectType),
			EmailTemplate.TemplateType => 'Text',
			EmailTemplate.Name => 'Some Template'
		},
		Event.sObjectType => new Map<SObjectField, Object>{ Event.ActivityDateTime => Datetime.now(), Event.DurationInMinutes => 60 },
		EventRelation.sObjectType => new Map<SObjectField, Object>{
			EventRelation.EventId => getGenericParentProvider(Event.sObjectType),
			EventRelation.RelationId => getGenericParentProvider(User.sObjectType)
		},
		SObjectType.FieldPermissions.getSObjectType() => new Map<SObjectField, Object>{
			FieldPermissions.Field => String.valueOf(Opportunity.sObjectType) +
			'.' +
			String.valueOf(Opportunity.Amount),
			FieldPermissions.ParentId => getGenericParentProvider(PermissionSet.sObjectType),
			FieldPermissions.SObjectType => String.valueOf(Opportunity.sObjectType),
			FieldPermissions.PermissionsRead => true
		},
		Group.sObjectType => new Map<SObjectField, Object>{ Group.Name => 'Some Group' },
		GroupMember.sObjectType => new Map<SObjectField, Object>{
			GroupMember.GroupId => getGenericParentProvider(Group.sObjectType),
			GroupMember.UserOrGroupId => getGenericParentProvider(User.sObjectType)
		},
		Holiday.sObjectType => new Map<SObjectField, Object>{ Holiday.Name => 'Some Holiday', Holiday.ActivityDate => Date.today() },
		Idea.sObjectType => new Map<SObjectField, Object>{
			Idea.CommunityId => SObjectFactory.provideQueriedParent(Community.sObjectType),
			Idea.Categories => 'Training',
			Idea.Title => 'Some Idea'
		},
		IdeaComment.sObjectType => new Map<SObjectField, Object>{ IdeaComment.IdeaId => getGenericParentProvider(Idea.sObjectType) },
		Lead.sObjectType => new Map<SObjectField, Object>{ Lead.LastName => 'Doe', Lead.Company => 'ACME' },
		Note.sObjectType => new Map<SObjectField, Object>{ Note.ParentId => getGenericParentProvider(Account.sObjectType), Note.Title => 'Some Note' },
		SObjectType.ObjectPermissions.getSObjectType() => new Map<SObjectField, Object>{
			ObjectPermissions.ParentId => getGenericParentProvider(PermissionSet.sObjectType),
			ObjectPermissions.SObjectType => String.valueOf(Account.sObjectType),
			ObjectPermissions.PermissionsRead => true
		},
		Opportunity.sObjectType => new Map<SObjectField, Object>{
			Opportunity.AccountId => getGenericParentProvider(Account.sObjectType),
			Opportunity.Name => 'Some Opportunity',
			Opportunity.StageName => 'Some Stage',
			Opportunity.CloseDate => Date.today()
		},
		OpportunityCompetitor.sObjectType => new Map<SObjectField, Object>{
			OpportunityCompetitor.OpportunityId => getGenericParentProvider(Opportunity.sObjectType)
		},
		OpportunityContactRole.sObjectType => new Map<SObjectField, Object>{
			OpportunityContactRole.OpportunityId => getGenericParentProvider(Opportunity.sObjectType),
			OpportunityContactRole.ContactId => getGenericParentProvider(Contact.sObjectType)
		},
		OpportunityLineItem.sObjectType => new Map<SObjectField, Object>{
			OpportunityLineItem.OpportunityId => getGenericParentProvider(Opportunity.sObjectType),
			OpportunityLineItem.PricebookEntryId => getGenericParentProvider(PricebookEntry.sObjectType),
			OpportunityLineItem.UnitPrice => 1,
			OpportunityLineItem.Quantity => 1
		},
		Partner.sObjectType => new Map<SObjectField, Object>{
			Partner.AccountFromId => getGenericParentProvider(Account.sObjectType),
			Partner.AccountToId => SObjectFactory.provideGenericParent(Account.sObjectType)
		},
		PermissionSet.sObjectType => new Map<SObjectField, Object>{
			PermissionSet.Name => SObjectFactory.provideUniqueString('TestPermissions'),
			PermissionSet.Label => SObjectFactory.provideUniqueString('Test Permissions')
		},
		PermissionSetAssignment.sObjectType => new Map<SObjectField, Object>{
			PermissionSetAssignment.PermissionSetId => getGenericParentProvider(PermissionSet.sObjectType),
			PermissionSetAssignment.AssigneeId => getGenericParentProvider(User.sObjectType)
		},
		Pricebook2.sObjectType => new Map<SObjectField, Object>{ Pricebook2.Name => 'Some Pricebook' },
		PricebookEntry.sObjectType => new Map<SObjectField, Object>{
			PricebookEntry.Product2Id => getGenericParentProvider(Product2.sObjectType),
			PricebookEntry.Pricebook2Id => Test.getStandardPricebookId(),
			PricebookEntry.IsActive => true,
			PricebookEntry.UnitPrice => 1
		},
		Product2.sObjectType => new Map<SObjectField, Object>{ Product2.Name => 'Some Product' },
		PushTopic.sObjectType => new Map<SObjectField, Object>{
			PushTopic.Name => SObjectFactory.provideUniqueString('PushTopic'),
			PushTopic.Query => 'SELECT Id FROM Account WHERE Name = null',
			PushTopic.ApiVersion => 35
		},
		SObjectType.QueueSobject.getSObjectType() => new Map<SObjectField, Object>{
			QueueSobject.QueueId => SObjectFactory.provideGenericParent(Group.sObjectType, Group.Type, 'Queue'),
			QueueSobject.SobjectType => String.valueOf(Case.sObjectType)
		},
		QuickText.sObjectType => new Map<SObjectField, Object>{ QuickText.Message => 'Some Message', QuickText.Name => 'Some Text' },
		Solution.sObjectType => new Map<SObjectField, Object>{ Solution.SolutionName => 'Some Solution' },
		SetupEntityAccess.sObjectType => new Map<SObjectField, Object>{
			SetupEntityAccess.ParentId => getGenericParentProvider(PermissionSet.sObjectType),
			SetupEntityAccess.SetupEntityId => SObjectFactory.provideQueriedParent('SELECT Id FROM ApexClass WHERE NamespacePrefix = null LIMIT 1')
		},
		StreamingChannel.sObjectType => new Map<SObjectField, Object>{ StreamingChannel.Name => SObjectFactory.provideUniqueString('/u/TestChannel') },
		User.sObjectType => new Map<SObjectField, Object>{
			User.LastName => 'Doe',
			User.LocaleSidKey => 'en_US',
			User.Email => 'jdoe@example.com',
			User.LanguageLocaleKey => 'en_US',
			User.EmailEncodingKey => 'ISO-8859-1',
			User.TimeZoneSidKey => 'America/Denver',
			User.ProfileId => SObjectFactory.provideStandardProfile(),
			User.Alias => SObjectFactory.provideUniqueFixedLengthString('jdoe', 7),
			User.CommunityNickname => SObjectFactory.provideUniqueString('johndoe'),
			User.Username => SObjectFactory.provideUniqueString('1234567890abcxyz@example.com')
		},
		UserPackageLicense.sObjectType => new Map<SObjectField, Object>{
			UserPackageLicense.UserId => getGenericParentProvider(User.sObjectType),
			UserPackageLicense.PackageLicenseId => SObjectFactory.provideQueriedParent(PackageLicense.sObjectType)
		},
		UserProvisioningRequest.sObjectType => new Map<SObjectField, Object>{
			UserProvisioningRequest.State => 'New',
			UserProvisioningRequest.Operation => 'Read',
			UserProvisioningRequest.ApprovalStatus => 'Denied'
		},
		UserRole.sObjectType => new Map<SObjectField, Object>{ UserRole.Name => 'Some Role' }
	};
}