<peer-ball>
	<button onclick={selectProject}>Peer</button>
	<div class = "ball"><p>{selectedProjectText}</p></div>
	<style>
		peer-ball {
			display: block;
			text-align: center;
			width: 100%;
		}

	    .ball {
	    	display: table;
	    	width: 200px;
	    	height: 200px;
	    	border-radius: 50%;
	    	background-color: black;
	    	color: white;
	    	padding: 20px;
	    	margin-left: auto;
	    	margin-right: auto;
	    	margin-top: 10px;
	    	font-size: 24px;
	    	
	    }
	    .ball p{
	    	display: table-cell;
	    	text-align: center;
	    	vertical-align: middle;
	    }

	</style>
	<script>
		RiotControl.addStore(this);
		this.selectedProjectText = "Peer into the magic ball to see what project you should work on."
		selectProject(e){
			RiotControl.trigger("select-project");
		}
		this.on("project-selected", function(selectedProject){
			this.selectedProjectText = "You must work on... "+selectedProject.name;
		})
		this.on("no-project-available", function(){
			this.selectedProjectText = "You must add some projects first"
		});
	</script>
</peer-ball>