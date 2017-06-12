/**
 * globals:riot,RiotControl
 */

function ProjectsStore() {
	const self = this;
	riot.observable(self);
	var storedData = localStorage.getItem('projectPickerData');
	if (!storedData){
		self.projects = [];
	} else {
		self.projects = JSON.parse(storedData);
	}

	function projectsChanged(projects){
		self.projects = projects;
		localStorage.setItem("projectPickerData", JSON.stringify(projects));
	};

	self.on("add-project", function(projectData){
		console.log("add-project on ProjectsStore", projectData);
		const newProjects = self.projects.slice(0);
		newProjects.push({ name: projectData.name });
		projectsChanged(newProjects);
		RiotControl.trigger("projects-changed", newProjects);
	});

	self.on("remove-project", function(nameToRemove){
		console.log("remove-project on ProjectsStore", nameToRemove);
		const newProjects = self.projects.filter(function(project) { return nameToRemove !== project.name;});
		projectsChanged(newProjects);
		RiotControl.trigger("projects-changed", newProjects);
	});

	self.on("select-project", function(){
		console.log("select-project on ProjectsStore");
		if (self.projects.length === 0){
			RiotControl.trigger("no-project-available");
		} else {
			const selectedProject = self.projects[Math.floor(Math.random()*self.projects.length)];
			RiotControl.trigger("project-selected", selectedProject);
		}
	});

	self.on("get-projects", function(){
		console.log("get-projects on ProjectsStore");
		RiotControl.trigger("projects-changed", self.projects);
	});
}

window.ProjectsStore = ProjectsStore;