<project-picker>
	<peer-ball projects={projects}></peer-ball>
	<projects projects={projects}></projects>
	<script>
		var storedData = localStorage.getItem('projectPickerData');
		if (!storedData){
			this.projects = [];		
		} else {
			this.projects = JSON.parse(storedData);
		}

		globalEvents.on('projectsChanged', function(projects){
			localStorage.setItem("projectPickerData", JSON.stringify(projects));
		});
	</script>
</project-picker>