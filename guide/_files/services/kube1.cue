package kube

service: [ID=_]: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name: ID
		labels: {
			app:       ID     // by convention
			domain:    "prod" // always the same in the given files
			component: string // varies per directory
		}
	}
	spec: {
		// Any port has the following properties.
		ports: [...{
			port:     int
			protocol: *"TCP" | "UDP" // from the Kubernetes definition
			name:     string | *"client"
		}]
		selector: metadata.labels // we want those to be the same
	}
}

deployment: [ID=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: name: ID
	spec: {
		// 1 is the default, but we allow any number
		replicas: *1 | int
		template: {
			metadata: labels: {
				app:       ID
				domain:    "prod"
				component: string
			}
			// we always have one namesake container
			spec: containers: [{name: ID}]
		}
	}
}
