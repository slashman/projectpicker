<projects>
	<form onsubmit = {add}>
		<p>Add project: <input ref="input"/></p>
		<p><button>Add</button></p> 
	</form>
	<div class = "projectRow" each={ projects }>
		<div class = "projectName">{name}</div>
		<div class = "buttonColumn"><button onclick={remove}>X</button></div>
    </div>
    <style>
    	.projectRow {
    		margin: 20px;
    	}

    	.projectName {
    		display: inline-block;
    		width: 70%;
    	}

    	.buttonColumn {
    		display: inline-block;
    		width: 10%;
    		vertical-align: top;
    	}
    </style>
	<script>
		this.projects = opts.projects;
		add(e) {
			e.preventDefault();
			var projectName = this.refs.input.value;
			this.refs.input.value = '';
			this.projects.push({ name: projectName });
			globalEvents.trigger('projectsChanged', this.projects);
		}

		remove(e){
			const nameToRemove = e.item.name;
			const newProjects = this.projects.filter(function(project) { return nameToRemove !== project.name;});
			globalEvents.trigger('projectsChanged', newProjects);
		}

		globalEvents.on('projectsChanged', function(projects){
			this.projects = projects;
		}.bind(this));
	</script>
</projects>