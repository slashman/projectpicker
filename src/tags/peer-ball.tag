<peer-ball>
	<button onclick={selectProject}>Peer</button>
	<div class = "ball">{selectedProjectText}</div>
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