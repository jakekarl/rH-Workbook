import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { reduceErrors } from 'c/utilities';
import noDataIllustration from './templates/noDataIllustration.html';
import inlineMessage from './templates/inlineMessage.html';
import banner from './templates/banner.html';
import emptyUI from './templates/emptyUI.html';

export default class ErrorPanel extends LightningElement {
	/** Single or array of LDS errors */
	@api errors;
	/** Generic / user-friendly message */
	@api friendlyMessage = 'Error retrieving data';
	/** Type of error message **/
	@api type;
	/** Displays each error message in a toast notification **/
	@api showToast = false;

	viewDetails = false;

	errorsArray = [];

	connectedCallback() {
		this.errorsArray = reduceErrors(this.errors);
		if (this.showToast) {
			this.displayErrors();
		}
	}

	displayErrors() {
		for (const error of this.errorsArray) {
			const toast = new ShowToastEvent({
				title: 'Error',
				message: error,
				variant: 'error',
			});
			this.dispatchEvent(toast);
		}
	}

	get errorMessages() {
		return this.errorsArray;
	}

	handleShowDetailsClick() {
		this.viewDetails = !this.viewDetails;
	}

	render() {
		if (this.type === 'inlineMessage') {
			return inlineMessage;
		} else if (this.type === 'emptyui') {
			return emptyUI;
		} else if (this.type === 'banner') {
			return banner;
		}
		return noDataIllustration;
	}
}