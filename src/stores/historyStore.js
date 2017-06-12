/**
 * globals:riot,RiotControl
 */

function HistoryStore() {
	const self = this;
	riot.observable(self);
	var storedData = localStorage.getItem('projectPickerHistory');
	if (!storedData){
		self.history = [];
	} else {
		self.history = JSON.parse(storedData);
	}

	function historyChanged(history){
		self.history = history;
		localStorage.setItem("projectPickerHistory", JSON.stringify(history));
	}

	self.on("project-selected", function(project){ // Result action from other store
		console.log("project-selected on HistoryStore", project);
		const newHistory = self.history.slice(0);
		newHistory.push({name: project.name, time: new Date()});
		historyChanged(newHistory);
		RiotControl.trigger("history-changed", newHistory);
	});
	
	self.on("get-history", function(){
		console.log("get-history on HistoryStore");
		RiotControl.trigger("history-changed", self.history);
	});

	self.on("clear-history", function(){
		console.log("clear-history on HistoryStore");
		const newHistory = [];
		historyChanged(newHistory);
		RiotControl.trigger("history-changed", newHistory);
	});
}

window.HistoryStore = HistoryStore;