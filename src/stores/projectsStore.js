/**
 * globals:riot,RiotControl
 */

function ProjectsStore() {
	riot.observable(this);
	var storedData = localStorage.getItem('projectPickerData');
	if (!storedData){
		this.projects = [];
	} else {
		this.projects = JSON.parse(storedData);
	}

	this.on("add-project", function(projectData){
		const newProjects = this.projects.slice(0);
		newProjects.push({ name: projectData.name });
		RiotControl.trigger("projects-changed", newProjects);
	});

	this.on("remove-project", function(nameToRemove){
		const newProjects = this.projects.filter(function(project) { return nameToRemove !== project.name;});
		RiotControl.trigger("projects-changed", newProjects);
	});

	this.on("select-project", function(projectData){
		if (this.projects.length === 0){
			RiotControl.trigger("no-project-available");
		} else {
			const selectedProject = this.projects[Math.floor(Math.random()*this.projects.length)];
			RiotControl.trigger("project-selected", selectedProject);
		}
	});

	this.on("projects-changed", function(projects){
		this.projects = projects;
		localStorage.setItem("projectPickerData", JSON.stringify(projects));
	});

	this.on("refresh-projects", function(){
		RiotControl.trigger("projects-changed", this.projects);
	});
}

window.ProjectsStore = ProjectsStore;