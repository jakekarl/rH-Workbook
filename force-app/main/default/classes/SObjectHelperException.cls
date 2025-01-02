public virtual class SObjectHelperException extends Exception {
	public virtual class InvalidParameterException extends SObjectHelperException {
	}
	public virtual class QueryPermissionException extends SObjectHelperException {
	}
	public virtual class InsertPermissionException extends SObjectHelperException {
	}
	public virtual class DMLException extends SObjectHelperException {
	}
}