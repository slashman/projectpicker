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
		console.log("project-selected on HistoryStore", project);
		const newHistory = this.history.slice(0);
		newHistory.push({name: project.name, time: new Date()});
		RiotControl.trigger("history-changed", newHistory);
	});
	
	this.on("history-changed", function(history){
		console.log("history-changed on HistoryStore", history);
		this.history = history;
		localStorage.setItem("projectPickerHistory", JSON.stringify(history));
	});

	this.on("refresh-history", function(){
		console.log("refresh-history on HistoryStore");
		RiotControl.trigger("history-changed", this.history);
	});

	this.on("clear-history", function(){
		console.log("clear-history on HistoryStore");
		RiotControl.trigger("history-changed", []);
	});
}

window.HistoryStore = HistoryStore;