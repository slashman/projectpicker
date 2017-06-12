/**
 * globals:riot,RiotControl
 */

function HistoryStore() {
	riot.observable(this);
	var storedData = localStorage.getItem('projectPickerHistory');
	if (!storedData){
		this.history = [];
	} else {
		this.history = JSON.parse(storedData);
	}

	this.on("project-selected", function(project){
		const newHistory = this.history.slice(0);
		newHistory.push({name: project.name, time: new Date()});
		RiotControl.trigger("history-changed", newHistory);
	});
	
	this.on("history-changed", function(history){
		this.history = history;
		localStorage.setItem("projectPickerHistory", JSON.stringify(history));
	});

	this.on("refresh-history", function(){
		RiotControl.trigger("history-changed", this.history);
	});

	this.on("clear-history", function(){
		RiotControl.trigger("history-changed", []);
	});
}

window.HistoryStore = HistoryStore;