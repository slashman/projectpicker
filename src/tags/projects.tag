<projects>
	<form onsubmit = {add}>
		<p>Add new: <input ref="input"/></p>
		<p><button>Add project</button></p> 
	</form>
	<li each={ projects }>
      {name} <button onclick={remove}>X</button>
    </li>

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