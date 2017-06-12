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
		RiotControl.addStore(this);
		this.projects = opts.projects;
		add(e) {
			e.preventDefault();
			var projectName = this.refs.input.value.trim();
			if (projectName === ""){
				return;
			}
			this.refs.input.value = '';
			RiotControl.trigger('add-project', { name: projectName });
		}

		remove(e){
			const nameToRemove = e.item.name;
			RiotControl.trigger('remove-project', nameToRemove);
		}

		this.on('projects-changed', function(projects){
			console.log("projects-changed on projects.tag", projects);
			this.projects = projects;
		}.bind(this));
		RiotControl.trigger("get-projects");
	</script>
</projects>