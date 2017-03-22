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
	    	
	    }
	    .ball p{
	    	display: table-cell;
	    	text-align: center;
	    	vertical-align: middle;
	    }

	</style>
	<script>
		this.projects = opts.projects;
		this.selectedProjectText = "Peer into the magic ball to see what project you should work on."
		selectProject(e){
			if (this.projects.length === 0){
				this.selectedProjectText = "You must add some projects first"
				return;
			}
			const selectedProject = this.projects[Math.floor(Math.random()*this.projects.length)];
			this.selectedProjectText = "You must work on... "+selectedProject.name;
		}
		// riot.observable(this);
		globalEvents.on('projectsChanged', function(projects){
			this.projects = projects;
		}.bind(this))
	</script>
</peer-ball>