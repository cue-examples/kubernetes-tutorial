package guide

import (
	"github.com/play-with-go/preguide"

	"path"
)

Delims: ["{{{", "}}}"]

FilenameComment: true

Defs: {
	_ImageTag:       *"" | string @tag(imagetag)
	ExampleName:     "kubernetestutorial"
	DockerImage:     "cueexamples/\(ExampleName)"
	DockerImageTag:  "\(DockerImage)\(_ImageTag)"
	DemoRepo:        "cue-examples/\(ExampleName)"
	DemoRepoName:    path.Base(DemoRepo)
	Workdir:         "/workdir"
	WorkdirMount:    path.Base(Workdir)
	Funquoter:       "funquoter"
	Quoteserver:     "quoteserver"
	FunquoterSchema: "\(Workdir)/\(Funquoter)/schema.cue"
	RootSchema:      "\(Workdir)/schema.cue"
	Monmon:          "\(Workdir)/infra/mon/mon.cue"
	Mondir:          path.Dir(Monmon)
}

Scenarios: (Defs.ExampleName): preguide.#Scenario & {
	Description: "A practical guide to CUE: patterns for everyday use"
}

Terminals: term1: preguide.#Terminal & {
	Description: "The main terminal"
	Scenarios: (Defs.ExampleName): Image: Defs.DockerImageTag
}

Steps: removeoldcluster: preguide.#Command & {
	InformationOnly: true
	Source: """
		k3d cluster delete example.com > /dev/null 2>&1 || true
		"""
}

Steps: startcluster: preguide.#Command & {
	InformationOnly: true
	Source: """
		k3d cluster create example.com
		"""
}

Steps: cueversion: preguide.#Command & {
	Source: """
		cue version
		"""
}

Steps: treeoriginal: preguide.#Command & {
	Source: """
		tree
		"""
}

Steps: cuemodinit: preguide.#Command & {
	Source: """
		cue mod init
		"""
}

Steps: gomodinit: preguide.#Command & {
	Source: """
		go mod init example.com
		"""
}

Steps: cdservices: preguide.#Command & {
	Source: """
		cd services
		"""
}

Steps: packageservicesimport: preguide.#Command & {
	Source: """
		! cue import ./... -p kube
		"""
}

Steps: workingservicesimport: preguide.#Command & {
	Source: """
		cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f
		"""
}

Steps: treepostimport: preguide.#Command & {
	Source: """
		tree
		"""
}

Steps: catyamlpromconfig: preguide.#Command & {
	Source: """
		cat mon/prometheus/configmap.cue
		"""
}

Steps: recursiveimport: preguide.#Command & {
	Source: """
		cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R
		"""
}

Steps: catrecursivepromconfig: preguide.#Command & {
	Source: """
		cat mon/prometheus/configmap.cue
		"""
}

Steps: cueevalmonprom: preguide.#Command & {
	Source: """
		cue eval ./mon/prometheus -e configMap.prometheus
		"""
}

Steps: initialsnapshot: preguide.#Command & {
	Source: """
		cue eval -c ./... > snapshot
		"""
}

Steps: cpbread: preguide.#Command & {
	Source: """
		cp frontend/breaddispatcher/kube.cue .
		"""
}

Steps: serviceskube1: preguide.#UploadFile & {
	Target: "/workdir/services/kube.cue"
	Path:   "./_files/services/kube1.cue"
}

Steps: badsnapshot2: preguide.#Command & {
	Source: """
		! cue eval -c ./... > snapshot2
		"""
}

Steps: sedfix: preguide.#Command & {
	Source: #"""
		sed -i.bak 's/component:.*string/component: #Component/' kube.cue
		rm kube.cue.bak
		cat <<EOF >> kube.cue

		#Component: string
		EOF
		ls -d */ | sed 's/.$//' | xargs -I DIR sh -c 'cd DIR; echo "package kube

		#Component: \"DIR\"
		" > kube.cue; cd ..'
		cue fmt kube.cue */kube.cue
		"""#
}

Steps: snapshot2: preguide.#Command & {
	Source: """
		cue eval -c ./... > snapshot2
		! diff -wu snapshot snapshot2
		"""
}

Steps: resettosnapshot2: preguide.#Command & {
	Source: """
		cp snapshot2 snapshot
		"""
}

Steps: trim1: preguide.#Command & {
	Source: """
		find . | grep kube.cue | xargs wc -l | tail -1
		cue trim ./...
		find . | grep kube.cue | xargs wc -l | tail -1
		"""
}

Steps: snapshot3: preguide.#Command & {
	Source: """
		cue eval -c ./... > snapshot2
		diff -wu snapshot snapshot2 | wc -l
		"""
}

Steps: daemonstatefuldeployment: preguide.#Command & {
	Source: """
		cat <<EOF >> kube.cue

		daemonSet: [ID=_]: _spec & {
			 apiVersion: "apps/v1"
			 kind:       "DaemonSet"
			 _name:      ID
		}

		statefulSet: [ID=_]: _spec & {
			 apiVersion: "apps/v1"
			 kind:       "StatefulSet"
			 _name:      ID
		}

		deployment: [ID=_]: _spec & {
			 apiVersion: "apps/v1"
			 kind:       "Deployment"
			 _name:      ID
			 spec: replicas: *1 | int
		}

		configMap: [ID=_]: {
			 metadata: name: ID
			 metadata: labels: component: #Component
		}

		_spec: {
			 _name: string

			 metadata: name: _name
			 metadata: labels: component: #Component
			 spec: selector: {}
			 spec: template: {
				  metadata: labels: {
						app:       _name
						component: #Component
						domain:    "prod"
				  }
				  spec: containers: [{name: _name}]
			 }
		}
		EOF
		cue fmt
		"""
}

Steps: daemonstatefulservice: preguide.#Command & {
	Source: #"""
		cat <<EOF >> kube.cue

		// Define the _export option and set the default to true
		// for all ports defined in all containers.
		_spec: spec: template: spec: containers: [...{
			 ports: [...{
				  _export: *true | false // include the port in the service
			 }]
		}]

		for x in [deployment, daemonSet, statefulSet] for k, v in x {
			 service: "\(k)": {
				  spec: selector: v.spec.template.metadata.labels

				  spec: ports: [
						for c in v.spec.template.spec.containers
						for p in c.ports
						if p._export {
							 let Port = p.containerPort // Port is an alias
							 port:       *Port | int
							 targetPort: *Port | int
						}
				  ]
			 }
		}
		EOF
		cue fmt
		"""#
}

Steps: quickpatches: preguide.#Command & {
	Source: #"""
		cat <<EOF >> infra/events/kube.cue

		deployment: events: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
		EOF

		cat <<EOF >> infra/tasks/kube.cue

		deployment: tasks: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
		EOF

		cat <<EOF >> infra/watcher/kube.cue

		deployment: watcher: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
		EOF
		"""#
}

Steps: trim2: preguide.#Command & {
	Source: """
		cue trim ./...
		find . | grep kube.cue | xargs wc -l | tail -1
		"""
}

Steps: simplify: preguide.#Command & {
	Source: """
		head frontend/breaddispatcher/kube.cue
		cue trim ./... -s
		head -7 frontend/breaddispatcher/kube.cue
		find . | grep kube.cue | xargs wc -l | tail -1
		"""
}

Steps: snapshotpostsimplify: preguide.#Command & {
	Source: """
		cue eval -c ./... > snapshot2
		cp snapshot2 snapshot
		"""
}

Steps: frontendtweaks: preguide.#Command & {
	Source: #"""
		cat <<EOF >> frontend/kube.cue

		deployment: [string]: spec: template: {
			 metadata: annotations: {
				  "prometheus.io.scrape": "true"
				  "prometheus.io.port":   "\(spec.containers[0].ports[0].containerPort)"
			 }
			 spec: containers: [{
				  ports: [{containerPort: *7080 | int}] // 7080 is the default
			 }]
		}
		EOF
		cue fmt ./frontend
		cue eval -c ./... > snapshot2
		! diff -wu snapshot snapshot2
		cp snapshot2 snapshot
		"""#
}

Steps: simplifyfrontend: preguide.#Command & {
	Source: """
		cue trim ./frontend/... -s
		find . | grep kube.cue | xargs wc -l | tail -1
		"""
}

Steps: snapshotpostfrontendsimplify: preguide.#Command & {
	Source: """
		cue eval -c ./... > snapshot2
		cp snapshot2 snapshot
		"""
}

Steps: kitchenpart1: preguide.#Command & {
	Source: #"""
		cat <<EOF >> kitchen/kube.cue

		deployment: [string]: spec: template: {
			 metadata: annotations: "prometheus.io.scrape": "true"
			 spec: containers: [{
				  ports: [{
						containerPort: 8080
				  }]
				  livenessProbe: {
						httpGet: {
							 path: "/debug/health"
							 port: 8080
						}
						initialDelaySeconds: 40
						periodSeconds:       3
				  }
			 }]
		}
		EOF
		cue fmt ./kitchen
		"""#
}

Steps: kitchenpart2: preguide.#Command & {
	Source: #"""
		cat <<EOF >> kitchen/kube.cue

		deployment: [ID=_]: spec: template: spec: {
			 _hasDisks: *true | bool

			 // field comprehension using just "if"
			 if _hasDisks {
				  volumes: [{
						name: *"\(ID)-disk" | string
						gcePersistentDisk: pdName: *"\(ID)-disk" | string
						gcePersistentDisk: fsType: "ext4"
				  }, {
						name: *"secret-\(ID)" | string
						secret: secretName: *"\(ID)-secrets" | string
				  }, ...]

				  containers: [{
						volumeMounts: [{
							 name:      *"\(ID)-disk" | string
							 mountPath: *"/logs" | string
						}, {
							 mountPath: *"/etc/certs" | string
							 name:      *"secret-\(ID)" | string
							 readOnly:  true
						}, ...]
				  }]
			 }
		}
		EOF
		cat <<EOF >> kitchen/souschef/kube.cue

		deployment: souschef: spec: template: spec: {
			 _hasDisks: false
		}

		EOF
		cue fmt ./kitchen/...
		"""#
}

Steps: kitchencheck: preguide.#Command & {
	Source: #"""
		cue trim -s ./kitchen/...
		cue eval -c ./... > snapshot2
		! diff -wu snapshot snapshot2
		cp snapshot2 snapshot
		find . | grep kube.cue | xargs wc -l | tail -1
		"""#
}

Steps: kubetool: preguide.#UploadFile & {
	Target: "/workdir/services/kube_tool.cue"
	Path:   "./_files/services/kube_tool.cue"
}

Steps: lstool: preguide.#UploadFile & {
	Target: "/workdir/services/ls_tool.cue"
	Path:   "./_files/services/ls_tool.cue"
}

Steps: cuecmdlsmaitred: preguide.#Command & {
	Source: #"""
		cue cmd ls ./frontend/maitred
		"""#
}

Steps: cuelsmaitred: preguide.#Command & {
	Source: #"""
		cue ls ./frontend/maitred
		"""#
}

Steps: cuelsall: preguide.#Command & {
	Source: #"""
		cue ls ./...
		"""#
}

Steps: dumptool: preguide.#UploadFile & {
	Target: "/workdir/services/dump_tool.cue"
	Path:   "./_files/services/dump_tool.cue"
}

Steps: createtool: preguide.#UploadFile & {
	Target: "/workdir/services/create_tool.cue"
	Path:   "./_files/services/create_tool.cue"
}

Steps: createall: preguide.#Command & {
	Source: #"""
		cue create ./frontend/...
		"""#
}

Steps: allgoget: preguide.#Command & {
	Source: #"""
		go get k8s.io/api/apps/v1@v0.23.4
		cue get go k8s.io/api/apps/v1
		"""#
}

Steps: k8sdefs: preguide.#UploadFile & {
	Target: "/workdir/services/k8s_defs.cue"
	Path:   "./_files/services/k8s_defs.cue"
}

Steps: cuefmtpostk8sdefs: preguide.#Command & {
	Source: #"""
		cue fmt
		"""#
}

Steps: postk8sdefscheck: preguide.#Command & {
	Source: #"""
		cue trim -s ./
		cue eval -c ./... > snapshot2
		! diff -wu snapshot snapshot2
		cp snapshot2 snapshot
		find . | grep kube.cue | xargs wc -l | tail -1
		"""#
}
