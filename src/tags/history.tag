<history>
	<h2>History</h2>
	<div><button onclick={clearHistory}>Clear</button></div>
	<div class = "historyRow" each={ history }>
		<div class = "projectTime">{time}</div>
		<div class = "projectName">{name}</div>
    </div>
    <style>
    	.historyRow {
    		margin: 20px;
    	}

    	.projectName {
    		display: inline-block;
    		width: 70%;
    	}
    </style>
	<script>
		RiotControl.addStore(this);
		
		clearHistory(e) {
			e.preventDefault();
			RiotControl.trigger('clear-history');
		}

		this.on('history-changed', function(history){
			console.log("history-changed on history.tag", history);
			this.history = history;
			this.update();
		});
		RiotControl.trigger("refresh-history");
	</script>
</history>