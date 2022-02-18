package out

Terminals: [{
	Name:        "term1"
	Description: "The main terminal"
	Scenarios: {
		kubernetestutorial: {
			Image: "cueexamples/kubernetestutorial"
		}
	}
}]
Scenarios: [{
	Name:        "kubernetestutorial"
	Description: "A practical guide to CUE: patterns for everyday use"
}]
Networks: []
Env: []
FilenameComment: true
Steps: {
	removeoldcluster: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: true
		Name:            "removeoldcluster"
		Order:           0
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "k3d cluster delete example.com >/dev/null 2>&1 || true"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	startcluster: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: true
		Name:            "startcluster"
		Order:           1
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "k3d cluster create example.com"
			ExitCode: 0
			Output: """
				\u001b[36mINFO\u001b[0m[0000] Prep: Network                                
				\u001b[36mINFO\u001b[0m[0000] Created network 'k3d-example.com'            
				\u001b[36mINFO\u001b[0m[0000] Created image volume k3d-example.com-images  
				\u001b[36mINFO\u001b[0m[0000] Starting new tools node...                   
				\u001b[36mINFO\u001b[0m[0000] Starting Node 'k3d-example.com-tools'        
				\u001b[36mINFO\u001b[0m[0001] Creating node 'k3d-example.com-server-0'     
				\u001b[36mINFO\u001b[0m[0001] Creating LoadBalancer 'k3d-example.com-serverlb' 
				\u001b[36mINFO\u001b[0m[0001] Using the k3d-tools node to gather environment information 
				\u001b[36mINFO\u001b[0m[0001] HostIP: using network gateway 172.18.0.1 address 
				\u001b[36mINFO\u001b[0m[0001] Starting cluster 'example.com'               
				\u001b[36mINFO\u001b[0m[0001] Starting servers...                          
				\u001b[36mINFO\u001b[0m[0001] Starting Node 'k3d-example.com-server-0'     
				\u001b[36mINFO\u001b[0m[0005] All agents already running.                  
				\u001b[36mINFO\u001b[0m[0005] Starting helpers...                          
				\u001b[36mINFO\u001b[0m[0005] Starting Node 'k3d-example.com-serverlb'     
				\u001b[36mINFO\u001b[0m[0011] Injecting records for hostAliases (incl. host.k3d.internal) and for 2 network members into CoreDNS configmap... 
				\u001b[36mINFO\u001b[0m[0013] Cluster 'example.com' created successfully!  
				\u001b[36mINFO\u001b[0m[0013] You can now use it like this:                
				kubectl cluster-info

				"""
			ComparisonOutput: """
				\u001b[36mINFO\u001b[0m[0000] Prep: Network                                
				\u001b[36mINFO\u001b[0m[0000] Created network 'k3d-example.com'            
				\u001b[36mINFO\u001b[0m[0000] Created image volume k3d-example.com-images  
				\u001b[36mINFO\u001b[0m[0000] Starting new tools node...                   
				\u001b[36mINFO\u001b[0m[0000] Starting Node 'k3d-example.com-tools'        
				\u001b[36mINFO\u001b[0m[0001] Creating node 'k3d-example.com-server-0'     
				\u001b[36mINFO\u001b[0m[0001] Creating LoadBalancer 'k3d-example.com-serverlb' 
				\u001b[36mINFO\u001b[0m[0001] Using the k3d-tools node to gather environment information 
				\u001b[36mINFO\u001b[0m[0001] HostIP: using network gateway 172.18.0.1 address 
				\u001b[36mINFO\u001b[0m[0001] Starting cluster 'example.com'               
				\u001b[36mINFO\u001b[0m[0001] Starting servers...                          
				\u001b[36mINFO\u001b[0m[0001] Starting Node 'k3d-example.com-server-0'     
				\u001b[36mINFO\u001b[0m[0005] All agents already running.                  
				\u001b[36mINFO\u001b[0m[0005] Starting helpers...                          
				\u001b[36mINFO\u001b[0m[0005] Starting Node 'k3d-example.com-serverlb'     
				\u001b[36mINFO\u001b[0m[0011] Injecting records for hostAliases (incl. host.k3d.internal) and for 2 network members into CoreDNS configmap... 
				\u001b[36mINFO\u001b[0m[0013] Cluster 'example.com' created successfully!  
				\u001b[36mINFO\u001b[0m[0013] You can now use it like this:                
				kubectl cluster-info

				"""
		}]
	}
	cueversion: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cueversion"
		Order:           2
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cue version"
			ExitCode: 0
			Output: """
				cue version v0.4.3-0.20220222111658-71e9d033c16e linux/arm64

				"""
			ComparisonOutput: """
				cue version v0.4.3-0.20220222111658-71e9d033c16e linux/arm64

				"""
		}]
	}
	treeoriginal: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "treeoriginal"
		Order:           3
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "tree"
			ExitCode: 0
			Output: """
				.
				`-- services
				    |-- frontend
				    |   |-- bartender
				    |   |   `-- kube.yaml
				    |   |-- breaddispatcher
				    |   |   `-- kube.yaml
				    |   |-- host
				    |   |   `-- kube.yaml
				    |   |-- maitred
				    |   |   `-- kube.yaml
				    |   |-- valeter
				    |   |   `-- kube.yaml
				    |   |-- waiter
				    |   |   `-- kube.yaml
				    |   `-- waterdispatcher
				    |       `-- kube.yaml
				    |-- infra
				    |   |-- download
				    |   |   `-- kube.yaml
				    |   |-- etcd
				    |   |   `-- kube.yaml
				    |   |-- events
				    |   |   `-- kube.yaml
				    |   |-- tasks
				    |   |   |-- kube.yaml
				    |   |   `-- service.yaml
				    |   |-- updater
				    |   |   `-- kube.yaml
				    |   `-- watcher
				    |       |-- kube.yaml
				    |       `-- service.yaml
				    |-- kitchen
				    |   |-- caller
				    |   |   `-- kube.yaml
				    |   |-- dishwasher
				    |   |   `-- kube.yaml
				    |   |-- expiditer
				    |   |   `-- kube.yaml
				    |   |-- headchef
				    |   |   `-- kube.yaml
				    |   |-- linecook
				    |   |   `-- kube.yaml
				    |   |-- pastrychef
				    |   |   `-- kube.yaml
				    |   `-- souschef
				    |       `-- kube.yaml
				    |-- mon
				    |   |-- alertmanager
				    |   |   |-- configmap.yaml
				    |   |   `-- kube.yaml
				    |   |-- grafana
				    |   |   `-- kube.yaml
				    |   |-- nodeexporter
				    |   |   `-- kube.yaml
				    |   `-- prometheus
				    |       |-- configmap.yaml
				    |       `-- kube.yaml
				    `-- proxy
				        |-- authproxy
				        |   |-- configmap.yaml
				        |   |-- kube.yaml
				        |   `-- service.yaml
				        |-- goget
				        |   |-- kube.yaml
				        |   `-- service.yaml
				        `-- nginx
				            |-- configmap.yaml
				            |-- kube.yaml
				            `-- service.yaml

				33 directories, 36 files

				"""
			ComparisonOutput: """
				.
				`-- services
				    |-- frontend
				    |   |-- bartender
				    |   |   `-- kube.yaml
				    |   |-- breaddispatcher
				    |   |   `-- kube.yaml
				    |   |-- host
				    |   |   `-- kube.yaml
				    |   |-- maitred
				    |   |   `-- kube.yaml
				    |   |-- valeter
				    |   |   `-- kube.yaml
				    |   |-- waiter
				    |   |   `-- kube.yaml
				    |   `-- waterdispatcher
				    |       `-- kube.yaml
				    |-- infra
				    |   |-- download
				    |   |   `-- kube.yaml
				    |   |-- etcd
				    |   |   `-- kube.yaml
				    |   |-- events
				    |   |   `-- kube.yaml
				    |   |-- tasks
				    |   |   |-- kube.yaml
				    |   |   `-- service.yaml
				    |   |-- updater
				    |   |   `-- kube.yaml
				    |   `-- watcher
				    |       |-- kube.yaml
				    |       `-- service.yaml
				    |-- kitchen
				    |   |-- caller
				    |   |   `-- kube.yaml
				    |   |-- dishwasher
				    |   |   `-- kube.yaml
				    |   |-- expiditer
				    |   |   `-- kube.yaml
				    |   |-- headchef
				    |   |   `-- kube.yaml
				    |   |-- linecook
				    |   |   `-- kube.yaml
				    |   |-- pastrychef
				    |   |   `-- kube.yaml
				    |   `-- souschef
				    |       `-- kube.yaml
				    |-- mon
				    |   |-- alertmanager
				    |   |   |-- configmap.yaml
				    |   |   `-- kube.yaml
				    |   |-- grafana
				    |   |   `-- kube.yaml
				    |   |-- nodeexporter
				    |   |   `-- kube.yaml
				    |   `-- prometheus
				    |       |-- configmap.yaml
				    |       `-- kube.yaml
				    `-- proxy
				        |-- authproxy
				        |   |-- configmap.yaml
				        |   |-- kube.yaml
				        |   `-- service.yaml
				        |-- goget
				        |   |-- kube.yaml
				        |   `-- service.yaml
				        `-- nginx
				            |-- configmap.yaml
				            |-- kube.yaml
				            `-- service.yaml

				33 directories, 36 files

				"""
		}]
	}
	cuemodinit: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cuemodinit"
		Order:           4
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue mod init"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	gomodinit: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "gomodinit"
		Order:           5
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go mod init example.com"
			ExitCode: 0
			Output: """
				go: creating new go.mod: module example.com
				go: to add module requirements and sums:
				\tgo mod tidy

				"""
			ComparisonOutput: """
				go: creating new go.mod: module example.com
				go: to add module requirements and sums:
				\tgo mod tidy

				"""
		}]
	}
	cdservices: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cdservices"
		Order:           6
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cd services"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	packageservicesimport: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "packageservicesimport"
		Order:           7
		Terminal:        "term1"
		Stmts: [{
			Negated:  true
			CmdStr:   "cue import ./... -p kube"
			ExitCode: 1
			Output: """
				path, list, or files flag needed to handle multiple objects in file ./services/frontend/bartender/kube.yaml

				"""
			ComparisonOutput: """
				path, list, or files flag needed to handle multiple objects in file ./services/frontend/bartender/kube.yaml

				"""
		}]
	}
	workingservicesimport: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "workingservicesimport"
		Order:           8
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	treepostimport: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "treepostimport"
		Order:           9
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "tree"
			ExitCode: 0
			Output: """
				.
				|-- frontend
				|   |-- bartender
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- breaddispatcher
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- host
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- maitred
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- valeter
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- waiter
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- waterdispatcher
				|       |-- kube.cue
				|       `-- kube.yaml
				|-- infra
				|   |-- download
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- etcd
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- events
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- tasks
				|   |   |-- kube.cue
				|   |   |-- kube.yaml
				|   |   |-- service.cue
				|   |   `-- service.yaml
				|   |-- updater
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- watcher
				|       |-- kube.cue
				|       |-- kube.yaml
				|       |-- service.cue
				|       `-- service.yaml
				|-- kitchen
				|   |-- caller
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- dishwasher
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- expiditer
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- headchef
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- linecook
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- pastrychef
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- souschef
				|       |-- kube.cue
				|       `-- kube.yaml
				|-- mon
				|   |-- alertmanager
				|   |   |-- configmap.cue
				|   |   |-- configmap.yaml
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- grafana
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- nodeexporter
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- prometheus
				|       |-- configmap.cue
				|       |-- configmap.yaml
				|       |-- kube.cue
				|       `-- kube.yaml
				`-- proxy
				    |-- authproxy
				    |   |-- configmap.cue
				    |   |-- configmap.yaml
				    |   |-- kube.cue
				    |   |-- kube.yaml
				    |   |-- service.cue
				    |   `-- service.yaml
				    |-- goget
				    |   |-- kube.cue
				    |   |-- kube.yaml
				    |   |-- service.cue
				    |   `-- service.yaml
				    `-- nginx
				        |-- configmap.cue
				        |-- configmap.yaml
				        |-- kube.cue
				        |-- kube.yaml
				        |-- service.cue
				        `-- service.yaml

				32 directories, 72 files

				"""
			ComparisonOutput: """
				.
				|-- frontend
				|   |-- bartender
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- breaddispatcher
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- host
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- maitred
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- valeter
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- waiter
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- waterdispatcher
				|       |-- kube.cue
				|       `-- kube.yaml
				|-- infra
				|   |-- download
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- etcd
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- events
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- tasks
				|   |   |-- kube.cue
				|   |   |-- kube.yaml
				|   |   |-- service.cue
				|   |   `-- service.yaml
				|   |-- updater
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- watcher
				|       |-- kube.cue
				|       |-- kube.yaml
				|       |-- service.cue
				|       `-- service.yaml
				|-- kitchen
				|   |-- caller
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- dishwasher
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- expiditer
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- headchef
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- linecook
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- pastrychef
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- souschef
				|       |-- kube.cue
				|       `-- kube.yaml
				|-- mon
				|   |-- alertmanager
				|   |   |-- configmap.cue
				|   |   |-- configmap.yaml
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- grafana
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   |-- nodeexporter
				|   |   |-- kube.cue
				|   |   `-- kube.yaml
				|   `-- prometheus
				|       |-- configmap.cue
				|       |-- configmap.yaml
				|       |-- kube.cue
				|       `-- kube.yaml
				`-- proxy
				    |-- authproxy
				    |   |-- configmap.cue
				    |   |-- configmap.yaml
				    |   |-- kube.cue
				    |   |-- kube.yaml
				    |   |-- service.cue
				    |   `-- service.yaml
				    |-- goget
				    |   |-- kube.cue
				    |   |-- kube.yaml
				    |   |-- service.cue
				    |   `-- service.yaml
				    `-- nginx
				        |-- configmap.cue
				        |-- configmap.yaml
				        |-- kube.cue
				        |-- kube.yaml
				        |-- service.cue
				        `-- service.yaml

				32 directories, 72 files

				"""
		}]
	}
	catyamlpromconfig: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "catyamlpromconfig"
		Order:           10
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cat mon/prometheus/configmap.cue"
			ExitCode: 0
			Output: #"""
				package kube

				configMap: prometheus: {
				\#tapiVersion: "v1"
				\#tkind:       "ConfigMap"
				\#tmetadata: name: "prometheus"
				\#tdata: {
				\#t\#t"alert.rules": """
				\#t\#t\#tgroups:
				\#t\#t\#t- name: rules.yaml
				\#t\#t\#t  rules:
				\#t\#t\#t  - alert: InstanceDown
				\#t\#t\#t    expr: up == 0
				\#t\#t\#t    for: 30s
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      description: '{{$labels.app}} of job {{ $labels.job }} has been down for
				\#t\#t\#t        more than 30 seconds.'
				\#t\#t\#t      summary: Instance {{$labels.app}} down
				\#t\#t\#t  - alert: InsufficientPeers
				\#t\#t\#t    expr: count(up{job=\#\"etcd\#\"} == 0) > (count(up{job=\#\"etcd\#\"}) / 2 - 1)
				\#t\#t\#t    for: 3m
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      description: If one more etcd peer goes down the cluster will be unavailable
				\#t\#t\#t      summary: etcd cluster small
				\#t\#t\#t  - alert: EtcdNoMaster
				\#t\#t\#t    expr: sum(etcd_server_has_leader{app=\#\"etcd\#\"}) == 0
				\#t\#t\#t    for: 1s
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      summary: No ETCD master elected.
				\#t\#t\#t  - alert: PodRestart
				\#t\#t\#t    expr: (max_over_time(pod_container_status_restarts_total[5m]) - min_over_time(pod_container_status_restarts_total[5m])) > 2
				\#t\#t\#t    for: 1m
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      description: '{{$labels.app}} {{ $labels.container }} resturted {{ $value }} times in 5m.'
				\#t\#t\#t      summary: Pod for {{$labels.container}} restarts too often
				\#t\#t\#t"""

				\#t\#t"prometheus.yml": """
				\#t\#t\#tglobal:
				\#t\#t\#t  scrape_interval: 15s
				\#t\#t\#trule_files:
				\#t\#t\#t  - /etc/prometheus/alert.rules
				\#t\#t\#talerting:
				\#t\#t\#t  alertmanagers:
				\#t\#t\#t  - scheme: http
				\#t\#t\#t    static_configs:
				\#t\#t\#t    - targets:
				\#t\#t\#t      - 'alertmanager:9093'
				\#t\#t\#tscrape_configs:
				\#t\#t\#t- job_name: 'kubernetes-apiservers'

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: endpoints

				\#t\#t\#t  # Default to scraping over https. If required, just disable this or change to
				\#t\#t\#t  # `http`.
				\#t\#t\#t  scheme: https

				\#t\#t\#t  # This TLS & bearer token file config is used to connect to the actual scrape
				\#t\#t\#t  # endpoints for cluster components. This is separate to discovery auth
				\#t\#t\#t  # configuration because discovery & scraping are two separate concerns in
				\#t\#t\#t  # Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\#t\#t\#t  # the cluster. Otherwise, more config options have to be provided within the
				\#t\#t\#t  # <kubernetes_sd_config>.
				\#t\#t\#t  tls_config:
				\#t\#t\#t    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				\#t\#t\#t    # If your node certificates are self-signed or use a different CA to the
				\#t\#t\#t    # master CA, then disable certificate verification below. Note that
				\#t\#t\#t    # certificate verification is an integral part of a secure infrastructure
				\#t\#t\#t    # so this should only be disabled in a controlled environment. You can
				\#t\#t\#t    # disable certificate verification by uncommenting the line below.
				\#t\#t\#t    #
				\#t\#t\#t    # insecure_skip_verify: true
				\#t\#t\#t  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

				\#t\#t\#t  # Keep only the default/kubernetes service endpoints for the https port. This
				\#t\#t\#t  # will add targets for each API server which Kubernetes adds an endpoint to
				\#t\#t\#t  # the default/kubernetes service.
				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace, __meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: default;kubernetes;https

				\#t\#t\#t# Scrape config for nodes (kubelet).
				\#t\#t\#t#
				\#t\#t\#t# Rather than connecting directly to the node, the scrape is proxied though the
				\#t\#t\#t# Kubernetes apiserver.  This means it will work if Prometheus is running out of
				\#t\#t\#t# cluster, or can't connect to nodes for some other reason (e.g. because of
				\#t\#t\#t# firewalling).
				\#t\#t\#t- job_name: 'kubernetes-nodes'

				\#t\#t\#t  # Default to scraping over https. If required, just disable this or change to
				\#t\#t\#t  # `http`.
				\#t\#t\#t  scheme: https

				\#t\#t\#t  # This TLS & bearer token file config is used to connect to the actual scrape
				\#t\#t\#t  # endpoints for cluster components. This is separate to discovery auth
				\#t\#t\#t  # configuration because discovery & scraping are two separate concerns in
				\#t\#t\#t  # Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\#t\#t\#t  # the cluster. Otherwise, more config options have to be provided within the
				\#t\#t\#t  # <kubernetes_sd_config>.
				\#t\#t\#t  tls_config:
				\#t\#t\#t    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				\#t\#t\#t  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: node

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_node_label_(.+)
				\#t\#t\#t  - target_label: __address__
				\#t\#t\#t    replacement: kubernetes.default.svc:443
				\#t\#t\#t  - source_labels: [__meta_kubernetes_node_name]
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    replacement: /api/v1/nodes/${1}/proxy/metrics

				\#t\#t\#t# Scrape config for Kubelet cAdvisor.
				\#t\#t\#t#
				\#t\#t\#t# This is required for Kubernetes 1.7.3 and later, where cAdvisor metrics
				\#t\#t\#t# (those whose names begin with 'container_') have been removed from the
				\#t\#t\#t# Kubelet metrics endpoint.  This job scrapes the cAdvisor endpoint to
				\#t\#t\#t# retrieve those metrics.
				\#t\#t\#t#
				\#t\#t\#t# In Kubernetes 1.7.0-1.7.2, these metrics are only exposed on the cAdvisor
				\#t\#t\#t# HTTP endpoint; use \#\"replacement: /api/v1/nodes/${1}:4194/proxy/metrics\#\"
				\#t\#t\#t# in that case (and ensure cAdvisor's HTTP server hasn't been disabled with
				\#t\#t\#t# the --cadvisor-port=0 Kubelet flag).
				\#t\#t\#t#
				\#t\#t\#t# This job is not necessary and should be removed in Kubernetes 1.6 and
				\#t\#t\#t# earlier versions, or it will cause the metrics to be scraped twice.
				\#t\#t\#t- job_name: 'kubernetes-cadvisor'

				\#t\#t\#t  # Default to scraping over https. If required, just disable this or change to
				\#t\#t\#t  # `http`.
				\#t\#t\#t  scheme: https

				\#t\#t\#t  # This TLS & bearer token file config is used to connect to the actual scrape
				\#t\#t\#t  # endpoints for cluster components. This is separate to discovery auth
				\#t\#t\#t  # configuration because discovery & scraping are two separate concerns in
				\#t\#t\#t  # Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\#t\#t\#t  # the cluster. Otherwise, more config options have to be provided within the
				\#t\#t\#t  # <kubernetes_sd_config>.
				\#t\#t\#t  tls_config:
				\#t\#t\#t    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				\#t\#t\#t  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: node

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_node_label_(.+)
				\#t\#t\#t  - target_label: __address__
				\#t\#t\#t    replacement: kubernetes.default.svc:443
				\#t\#t\#t  - source_labels: [__meta_kubernetes_node_name]
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    replacement: /api/v1/nodes/${1}/proxy/metrics/cadvisor

				\#t\#t\#t# Scrape config for service endpoints.
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual service scrape endpoint to be configured
				\#t\#t\#t# via the following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/scrape`: Only scrape services that have a value of `true`
				\#t\#t\#t# * `prometheus.io/scheme`: If the metrics endpoint is secured then you will need
				\#t\#t\#t# to set this to `https` & most likely set the `tls_config` of the scrape config.
				\#t\#t\#t# * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\#t\#t\#t# * `prometheus.io/port`: If the metrics are exposed on a different port to the
				\#t\#t\#t# service then set this appropriately.
				\#t\#t\#t- job_name: 'kubernetes-service-endpoints'

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: endpoints

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scrape]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: true
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scheme]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __scheme__
				\#t\#t\#t    regex: (https?)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_path]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t  - source_labels: [__address__, __meta_kubernetes_service_annotation_prometheus_io_port]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __address__
				\#t\#t\#t    regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				\#t\#t\#t    replacement: $1:$2
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_service_label_(.+)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_namespace
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_name]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_name

				\#t\#t\#t# Example scrape config for probing services via the Blackbox Exporter.
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual service scrape endpoint to be configured
				\#t\#t\#t# via the following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/probe`: Only probe services that have a value of `true`
				\#t\#t\#t- job_name: 'kubernetes-services'

				\#t\#t\#t  metrics_path: /probe
				\#t\#t\#t  params:
				\#t\#t\#t    module: [http_2xx]

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: service

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_probe]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: true
				\#t\#t\#t  - source_labels: [__address__]
				\#t\#t\#t    target_label: __param_target
				\#t\#t\#t  - target_label: __address__
				\#t\#t\#t    replacement: blackbox-exporter.example.com:9115
				\#t\#t\#t  - source_labels: [__param_target]
				\#t\#t\#t    target_label: app
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_service_label_(.+)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t    target_label: kubernetes_namespace
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_name]
				\#t\#t\#t    target_label: kubernetes_name

				\#t\#t\#t# Example scrape config for probing ingresses via the Blackbox Exporter.
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual ingress scrape endpoint to be configured
				\#t\#t\#t# via the following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/probe`: Only probe services that have a value of `true`
				\#t\#t\#t- job_name: 'kubernetes-ingresses'

				\#t\#t\#t  metrics_path: /probe
				\#t\#t\#t  params:
				\#t\#t\#t    module: [http_2xx]

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t    - role: ingress

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t    - source_labels: [__meta_kubernetes_ingress_annotation_prometheus_io_probe]
				\#t\#t\#t      action: keep
				\#t\#t\#t      regex: true
				\#t\#t\#t    - source_labels: [__meta_kubernetes_ingress_scheme,__address__,__meta_kubernetes_ingress_path]
				\#t\#t\#t      regex: (.+);(.+);(.+)
				\#t\#t\#t      replacement: ${1}://${2}${3}
				\#t\#t\#t      target_label: __param_target
				\#t\#t\#t    - target_label: __address__
				\#t\#t\#t      replacement: blackbox-exporter.example.com:9115
				\#t\#t\#t    - source_labels: [__param_target]
				\#t\#t\#t      target_label: app
				\#t\#t\#t    - action: labelmap
				\#t\#t\#t      regex: __meta_kubernetes_ingress_label_(.+)
				\#t\#t\#t    - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t      target_label: kubernetes_namespace
				\#t\#t\#t    - source_labels: [__meta_kubernetes_ingress_name]
				\#t\#t\#t      target_label: kubernetes_name

				\#t\#t\#t# Example scrape config for pods
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual pod scrape endpoint to be configured via the
				\#t\#t\#t# following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/scrape`: Only scrape pods that have a value of `true`
				\#t\#t\#t# * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\#t\#t\#t# * `prometheus.io/port`: Scrape the pod on the indicated port instead of the
				\#t\#t\#t# pod's declared ports (default is a port-free target if none are declared).
				\#t\#t\#t- job_name: 'kubernetes-pods'

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: pod

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: true
				\#t\#t\#t  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t  - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
				\#t\#t\#t    action: replace
				\#t\#t\#t    regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				\#t\#t\#t    replacement: $1:$2
				\#t\#t\#t    target_label: __address__
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_pod_label_(.+)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_namespace
				\#t\#t\#t  - source_labels: [__meta_kubernetes_pod_name]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_pod_name
				\#t\#t\#t"""
				\#t}
				}

				"""#
			ComparisonOutput: #"""
				package kube

				configMap: prometheus: {
				\#tapiVersion: "v1"
				\#tkind:       "ConfigMap"
				\#tmetadata: name: "prometheus"
				\#tdata: {
				\#t\#t"alert.rules": """
				\#t\#t\#tgroups:
				\#t\#t\#t- name: rules.yaml
				\#t\#t\#t  rules:
				\#t\#t\#t  - alert: InstanceDown
				\#t\#t\#t    expr: up == 0
				\#t\#t\#t    for: 30s
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      description: '{{$labels.app}} of job {{ $labels.job }} has been down for
				\#t\#t\#t        more than 30 seconds.'
				\#t\#t\#t      summary: Instance {{$labels.app}} down
				\#t\#t\#t  - alert: InsufficientPeers
				\#t\#t\#t    expr: count(up{job=\#\"etcd\#\"} == 0) > (count(up{job=\#\"etcd\#\"}) / 2 - 1)
				\#t\#t\#t    for: 3m
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      description: If one more etcd peer goes down the cluster will be unavailable
				\#t\#t\#t      summary: etcd cluster small
				\#t\#t\#t  - alert: EtcdNoMaster
				\#t\#t\#t    expr: sum(etcd_server_has_leader{app=\#\"etcd\#\"}) == 0
				\#t\#t\#t    for: 1s
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      summary: No ETCD master elected.
				\#t\#t\#t  - alert: PodRestart
				\#t\#t\#t    expr: (max_over_time(pod_container_status_restarts_total[5m]) - min_over_time(pod_container_status_restarts_total[5m])) > 2
				\#t\#t\#t    for: 1m
				\#t\#t\#t    labels:
				\#t\#t\#t      severity: page
				\#t\#t\#t    annotations:
				\#t\#t\#t      description: '{{$labels.app}} {{ $labels.container }} resturted {{ $value }} times in 5m.'
				\#t\#t\#t      summary: Pod for {{$labels.container}} restarts too often
				\#t\#t\#t"""

				\#t\#t"prometheus.yml": """
				\#t\#t\#tglobal:
				\#t\#t\#t  scrape_interval: 15s
				\#t\#t\#trule_files:
				\#t\#t\#t  - /etc/prometheus/alert.rules
				\#t\#t\#talerting:
				\#t\#t\#t  alertmanagers:
				\#t\#t\#t  - scheme: http
				\#t\#t\#t    static_configs:
				\#t\#t\#t    - targets:
				\#t\#t\#t      - 'alertmanager:9093'
				\#t\#t\#tscrape_configs:
				\#t\#t\#t- job_name: 'kubernetes-apiservers'

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: endpoints

				\#t\#t\#t  # Default to scraping over https. If required, just disable this or change to
				\#t\#t\#t  # `http`.
				\#t\#t\#t  scheme: https

				\#t\#t\#t  # This TLS & bearer token file config is used to connect to the actual scrape
				\#t\#t\#t  # endpoints for cluster components. This is separate to discovery auth
				\#t\#t\#t  # configuration because discovery & scraping are two separate concerns in
				\#t\#t\#t  # Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\#t\#t\#t  # the cluster. Otherwise, more config options have to be provided within the
				\#t\#t\#t  # <kubernetes_sd_config>.
				\#t\#t\#t  tls_config:
				\#t\#t\#t    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				\#t\#t\#t    # If your node certificates are self-signed or use a different CA to the
				\#t\#t\#t    # master CA, then disable certificate verification below. Note that
				\#t\#t\#t    # certificate verification is an integral part of a secure infrastructure
				\#t\#t\#t    # so this should only be disabled in a controlled environment. You can
				\#t\#t\#t    # disable certificate verification by uncommenting the line below.
				\#t\#t\#t    #
				\#t\#t\#t    # insecure_skip_verify: true
				\#t\#t\#t  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

				\#t\#t\#t  # Keep only the default/kubernetes service endpoints for the https port. This
				\#t\#t\#t  # will add targets for each API server which Kubernetes adds an endpoint to
				\#t\#t\#t  # the default/kubernetes service.
				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace, __meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: default;kubernetes;https

				\#t\#t\#t# Scrape config for nodes (kubelet).
				\#t\#t\#t#
				\#t\#t\#t# Rather than connecting directly to the node, the scrape is proxied though the
				\#t\#t\#t# Kubernetes apiserver.  This means it will work if Prometheus is running out of
				\#t\#t\#t# cluster, or can't connect to nodes for some other reason (e.g. because of
				\#t\#t\#t# firewalling).
				\#t\#t\#t- job_name: 'kubernetes-nodes'

				\#t\#t\#t  # Default to scraping over https. If required, just disable this or change to
				\#t\#t\#t  # `http`.
				\#t\#t\#t  scheme: https

				\#t\#t\#t  # This TLS & bearer token file config is used to connect to the actual scrape
				\#t\#t\#t  # endpoints for cluster components. This is separate to discovery auth
				\#t\#t\#t  # configuration because discovery & scraping are two separate concerns in
				\#t\#t\#t  # Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\#t\#t\#t  # the cluster. Otherwise, more config options have to be provided within the
				\#t\#t\#t  # <kubernetes_sd_config>.
				\#t\#t\#t  tls_config:
				\#t\#t\#t    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				\#t\#t\#t  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: node

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_node_label_(.+)
				\#t\#t\#t  - target_label: __address__
				\#t\#t\#t    replacement: kubernetes.default.svc:443
				\#t\#t\#t  - source_labels: [__meta_kubernetes_node_name]
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    replacement: /api/v1/nodes/${1}/proxy/metrics

				\#t\#t\#t# Scrape config for Kubelet cAdvisor.
				\#t\#t\#t#
				\#t\#t\#t# This is required for Kubernetes 1.7.3 and later, where cAdvisor metrics
				\#t\#t\#t# (those whose names begin with 'container_') have been removed from the
				\#t\#t\#t# Kubelet metrics endpoint.  This job scrapes the cAdvisor endpoint to
				\#t\#t\#t# retrieve those metrics.
				\#t\#t\#t#
				\#t\#t\#t# In Kubernetes 1.7.0-1.7.2, these metrics are only exposed on the cAdvisor
				\#t\#t\#t# HTTP endpoint; use \#\"replacement: /api/v1/nodes/${1}:4194/proxy/metrics\#\"
				\#t\#t\#t# in that case (and ensure cAdvisor's HTTP server hasn't been disabled with
				\#t\#t\#t# the --cadvisor-port=0 Kubelet flag).
				\#t\#t\#t#
				\#t\#t\#t# This job is not necessary and should be removed in Kubernetes 1.6 and
				\#t\#t\#t# earlier versions, or it will cause the metrics to be scraped twice.
				\#t\#t\#t- job_name: 'kubernetes-cadvisor'

				\#t\#t\#t  # Default to scraping over https. If required, just disable this or change to
				\#t\#t\#t  # `http`.
				\#t\#t\#t  scheme: https

				\#t\#t\#t  # This TLS & bearer token file config is used to connect to the actual scrape
				\#t\#t\#t  # endpoints for cluster components. This is separate to discovery auth
				\#t\#t\#t  # configuration because discovery & scraping are two separate concerns in
				\#t\#t\#t  # Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\#t\#t\#t  # the cluster. Otherwise, more config options have to be provided within the
				\#t\#t\#t  # <kubernetes_sd_config>.
				\#t\#t\#t  tls_config:
				\#t\#t\#t    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				\#t\#t\#t  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: node

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_node_label_(.+)
				\#t\#t\#t  - target_label: __address__
				\#t\#t\#t    replacement: kubernetes.default.svc:443
				\#t\#t\#t  - source_labels: [__meta_kubernetes_node_name]
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    replacement: /api/v1/nodes/${1}/proxy/metrics/cadvisor

				\#t\#t\#t# Scrape config for service endpoints.
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual service scrape endpoint to be configured
				\#t\#t\#t# via the following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/scrape`: Only scrape services that have a value of `true`
				\#t\#t\#t# * `prometheus.io/scheme`: If the metrics endpoint is secured then you will need
				\#t\#t\#t# to set this to `https` & most likely set the `tls_config` of the scrape config.
				\#t\#t\#t# * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\#t\#t\#t# * `prometheus.io/port`: If the metrics are exposed on a different port to the
				\#t\#t\#t# service then set this appropriately.
				\#t\#t\#t- job_name: 'kubernetes-service-endpoints'

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: endpoints

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scrape]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: true
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scheme]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __scheme__
				\#t\#t\#t    regex: (https?)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_path]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t  - source_labels: [__address__, __meta_kubernetes_service_annotation_prometheus_io_port]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __address__
				\#t\#t\#t    regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				\#t\#t\#t    replacement: $1:$2
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_service_label_(.+)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_namespace
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_name]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_name

				\#t\#t\#t# Example scrape config for probing services via the Blackbox Exporter.
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual service scrape endpoint to be configured
				\#t\#t\#t# via the following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/probe`: Only probe services that have a value of `true`
				\#t\#t\#t- job_name: 'kubernetes-services'

				\#t\#t\#t  metrics_path: /probe
				\#t\#t\#t  params:
				\#t\#t\#t    module: [http_2xx]

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: service

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_probe]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: true
				\#t\#t\#t  - source_labels: [__address__]
				\#t\#t\#t    target_label: __param_target
				\#t\#t\#t  - target_label: __address__
				\#t\#t\#t    replacement: blackbox-exporter.example.com:9115
				\#t\#t\#t  - source_labels: [__param_target]
				\#t\#t\#t    target_label: app
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_service_label_(.+)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t    target_label: kubernetes_namespace
				\#t\#t\#t  - source_labels: [__meta_kubernetes_service_name]
				\#t\#t\#t    target_label: kubernetes_name

				\#t\#t\#t# Example scrape config for probing ingresses via the Blackbox Exporter.
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual ingress scrape endpoint to be configured
				\#t\#t\#t# via the following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/probe`: Only probe services that have a value of `true`
				\#t\#t\#t- job_name: 'kubernetes-ingresses'

				\#t\#t\#t  metrics_path: /probe
				\#t\#t\#t  params:
				\#t\#t\#t    module: [http_2xx]

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t    - role: ingress

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t    - source_labels: [__meta_kubernetes_ingress_annotation_prometheus_io_probe]
				\#t\#t\#t      action: keep
				\#t\#t\#t      regex: true
				\#t\#t\#t    - source_labels: [__meta_kubernetes_ingress_scheme,__address__,__meta_kubernetes_ingress_path]
				\#t\#t\#t      regex: (.+);(.+);(.+)
				\#t\#t\#t      replacement: ${1}://${2}${3}
				\#t\#t\#t      target_label: __param_target
				\#t\#t\#t    - target_label: __address__
				\#t\#t\#t      replacement: blackbox-exporter.example.com:9115
				\#t\#t\#t    - source_labels: [__param_target]
				\#t\#t\#t      target_label: app
				\#t\#t\#t    - action: labelmap
				\#t\#t\#t      regex: __meta_kubernetes_ingress_label_(.+)
				\#t\#t\#t    - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t      target_label: kubernetes_namespace
				\#t\#t\#t    - source_labels: [__meta_kubernetes_ingress_name]
				\#t\#t\#t      target_label: kubernetes_name

				\#t\#t\#t# Example scrape config for pods
				\#t\#t\#t#
				\#t\#t\#t# The relabeling allows the actual pod scrape endpoint to be configured via the
				\#t\#t\#t# following annotations:
				\#t\#t\#t#
				\#t\#t\#t# * `prometheus.io/scrape`: Only scrape pods that have a value of `true`
				\#t\#t\#t# * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\#t\#t\#t# * `prometheus.io/port`: Scrape the pod on the indicated port instead of the
				\#t\#t\#t# pod's declared ports (default is a port-free target if none are declared).
				\#t\#t\#t- job_name: 'kubernetes-pods'

				\#t\#t\#t  kubernetes_sd_configs:
				\#t\#t\#t  - role: pod

				\#t\#t\#t  relabel_configs:
				\#t\#t\#t  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
				\#t\#t\#t    action: keep
				\#t\#t\#t    regex: true
				\#t\#t\#t  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: __metrics_path__
				\#t\#t\#t    regex: (.+)
				\#t\#t\#t  - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
				\#t\#t\#t    action: replace
				\#t\#t\#t    regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				\#t\#t\#t    replacement: $1:$2
				\#t\#t\#t    target_label: __address__
				\#t\#t\#t  - action: labelmap
				\#t\#t\#t    regex: __meta_kubernetes_pod_label_(.+)
				\#t\#t\#t  - source_labels: [__meta_kubernetes_namespace]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_namespace
				\#t\#t\#t  - source_labels: [__meta_kubernetes_pod_name]
				\#t\#t\#t    action: replace
				\#t\#t\#t    target_label: kubernetes_pod_name
				\#t\#t\#t"""
				\#t}
				}

				"""#
		}]
	}
	recursiveimport: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "recursiveimport"
		Order:           11
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	catrecursivepromconfig: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "catrecursivepromconfig"
		Order:           12
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cat mon/prometheus/configmap.cue"
			ExitCode: 0
			Output: """
				package kube

				import yaml656e63 "encoding/yaml"

				configMap: prometheus: {
				\tapiVersion: "v1"
				\tkind:       "ConfigMap"
				\tmetadata: name: "prometheus"
				\tdata: {
				\t\t"alert.rules": yaml656e63.Marshal(_cue_alert_rules)
				\t\tlet _cue_alert_rules = {
				\t\t\tgroups: [{
				\t\t\t\tname: "rules.yaml"
				\t\t\t\trules: [{
				\t\t\t\t\talert: "InstanceDown"
				\t\t\t\t\texpr:  "up == 0"
				\t\t\t\t\tfor:   "30s"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: {
				\t\t\t\t\t\tdescription: "{{$labels.app}} of job {{ $labels.job }} has been down for more than 30 seconds."

				\t\t\t\t\t\tsummary: "Instance {{$labels.app}} down"
				\t\t\t\t\t}
				\t\t\t\t}, {
				\t\t\t\t\talert: "InsufficientPeers"
				\t\t\t\t\texpr:  "count(up{job=\\"etcd\\"} == 0) > (count(up{job=\\"etcd\\"}) / 2 - 1)"
				\t\t\t\t\tfor:   "3m"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: {
				\t\t\t\t\t\tdescription: "If one more etcd peer goes down the cluster will be unavailable"
				\t\t\t\t\t\tsummary:     "etcd cluster small"
				\t\t\t\t\t}
				\t\t\t\t}, {
				\t\t\t\t\talert: "EtcdNoMaster"
				\t\t\t\t\texpr:  "sum(etcd_server_has_leader{app=\\"etcd\\"}) == 0"
				\t\t\t\t\tfor:   "1s"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: summary: "No ETCD master elected."
				\t\t\t\t}, {
				\t\t\t\t\talert: "PodRestart"
				\t\t\t\t\texpr:  "(max_over_time(pod_container_status_restarts_total[5m]) - min_over_time(pod_container_status_restarts_total[5m])) > 2"
				\t\t\t\t\tfor:   "1m"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: {
				\t\t\t\t\t\tdescription: "{{$labels.app}} {{ $labels.container }} resturted {{ $value }} times in 5m."
				\t\t\t\t\t\tsummary:     "Pod for {{$labels.container}} restarts too often"
				\t\t\t\t\t}
				\t\t\t\t}]
				\t\t\t}]
				\t\t}

				\t\t"prometheus.yml": yaml656e63.Marshal(_cue_prometheus_yml)
				\t\tlet _cue_prometheus_yml = {
				\t\t\tglobal: scrape_interval: "15s"
				\t\t\trule_files: [
				\t\t\t\t"/etc/prometheus/alert.rules",
				\t\t\t]
				\t\t\talerting: alertmanagers: [{
				\t\t\t\tscheme: "http"
				\t\t\t\tstatic_configs: [{
				\t\t\t\t\ttargets: [
				\t\t\t\t\t\t"alertmanager:9093",
				\t\t\t\t\t]
				\t\t\t\t}]
				\t\t\t}]
				\t\t\tscrape_configs: [{
				\t\t\t\tjob_name: "kubernetes-apiservers"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "endpoints"
				\t\t\t\t}]

				\t\t\t\t// Default to scraping over https. If required, just disable this or change to
				\t\t\t\t// `http`.
				\t\t\t\tscheme: "https"

				\t\t\t\t// This TLS & bearer token file config is used to connect to the actual scrape
				\t\t\t\t// endpoints for cluster components. This is separate to discovery auth
				\t\t\t\t// configuration because discovery & scraping are two separate concerns in
				\t\t\t\t// Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\t\t\t\t// the cluster. Otherwise, more config options have to be provided within the
				\t\t\t\t// <kubernetes_sd_config>.
				\t\t\t\ttls_config: {
				\t\t\t\t\tca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
				\t\t\t\t}
				\t\t\t\t// If your node certificates are self-signed or use a different CA to the
				\t\t\t\t// master CA, then disable certificate verification below. Note that
				\t\t\t\t// certificate verification is an integral part of a secure infrastructure
				\t\t\t\t// so this should only be disabled in a controlled environment. You can
				\t\t\t\t// disable certificate verification by uncommenting the line below.
				\t\t\t\t//
				\t\t\t\t// insecure_skip_verify: true
				\t\t\t\tbearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"

				\t\t\t\t// Keep only the default/kubernetes service endpoints for the https port. This
				\t\t\t\t// will add targets for each API server which Kubernetes adds an endpoint to
				\t\t\t\t// the default/kubernetes service.
				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace", "__meta_kubernetes_service_name", "__meta_kubernetes_endpoint_port_name"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  "default;kubernetes;https"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Scrape config for nodes (kubelet).
				\t\t\t\t//
				\t\t\t\t// Rather than connecting directly to the node, the scrape is proxied though the
				\t\t\t\t// Kubernetes apiserver.  This means it will work if Prometheus is running out of
				\t\t\t\t// cluster, or can't connect to nodes for some other reason (e.g. because of
				\t\t\t\t// firewalling).
				\t\t\t\tjob_name: "kubernetes-nodes"

				\t\t\t\t// Default to scraping over https. If required, just disable this or change to
				\t\t\t\t// `http`.
				\t\t\t\tscheme: "https"

				\t\t\t\t// This TLS & bearer token file config is used to connect to the actual scrape
				\t\t\t\t// endpoints for cluster components. This is separate to discovery auth
				\t\t\t\t// configuration because discovery & scraping are two separate concerns in
				\t\t\t\t// Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\t\t\t\t// the cluster. Otherwise, more config options have to be provided within the
				\t\t\t\t// <kubernetes_sd_config>.
				\t\t\t\ttls_config: {
				\t\t\t\t\tca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
				\t\t\t\t}
				\t\t\t\tbearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "node"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_node_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "kubernetes.default.svc:443"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_node_name"]
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\treplacement:  "/api/v1/nodes/${1}/proxy/metrics"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Scrape config for Kubelet cAdvisor.
				\t\t\t\t//
				\t\t\t\t// This is required for Kubernetes 1.7.3 and later, where cAdvisor metrics
				\t\t\t\t// (those whose names begin with 'container_') have been removed from the
				\t\t\t\t// Kubelet metrics endpoint.  This job scrapes the cAdvisor endpoint to
				\t\t\t\t// retrieve those metrics.
				\t\t\t\t//
				\t\t\t\t// In Kubernetes 1.7.0-1.7.2, these metrics are only exposed on the cAdvisor
				\t\t\t\t// HTTP endpoint; use "replacement: /api/v1/nodes/${1}:4194/proxy/metrics"
				\t\t\t\t// in that case (and ensure cAdvisor's HTTP server hasn't been disabled with
				\t\t\t\t// the --cadvisor-port=0 Kubelet flag).
				\t\t\t\t//
				\t\t\t\t// This job is not necessary and should be removed in Kubernetes 1.6 and
				\t\t\t\t// earlier versions, or it will cause the metrics to be scraped twice.
				\t\t\t\tjob_name: "kubernetes-cadvisor"

				\t\t\t\t// Default to scraping over https. If required, just disable this or change to
				\t\t\t\t// `http`.
				\t\t\t\tscheme: "https"

				\t\t\t\t// This TLS & bearer token file config is used to connect to the actual scrape
				\t\t\t\t// endpoints for cluster components. This is separate to discovery auth
				\t\t\t\t// configuration because discovery & scraping are two separate concerns in
				\t\t\t\t// Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\t\t\t\t// the cluster. Otherwise, more config options have to be provided within the
				\t\t\t\t// <kubernetes_sd_config>.
				\t\t\t\ttls_config: {
				\t\t\t\t\tca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
				\t\t\t\t}
				\t\t\t\tbearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "node"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_node_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "kubernetes.default.svc:443"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_node_name"]
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\treplacement:  "/api/v1/nodes/${1}/proxy/metrics/cadvisor"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Scrape config for service endpoints.
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual service scrape endpoint to be configured
				\t\t\t\t// via the following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/scrape`: Only scrape services that have a value of `true`
				\t\t\t\t// * `prometheus.io/scheme`: If the metrics endpoint is secured then you will need
				\t\t\t\t// to set this to `https` & most likely set the `tls_config` of the scrape config.
				\t\t\t\t// * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\t\t\t\t// * `prometheus.io/port`: If the metrics are exposed on a different port to the
				\t\t\t\t// service then set this appropriately.
				\t\t\t\tjob_name: "kubernetes-service-endpoints"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "endpoints"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_scrape"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_scheme"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__scheme__"
				\t\t\t\t\tregex:        "(https?)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_path"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__address__", "__meta_kubernetes_service_annotation_prometheus_io_port"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\tregex:        "([^:]+)(?::\\\\d+)?;(\\\\d+)"
				\t\t\t\t\treplacement:  "$1:$2"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_service_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_name"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_name"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Example scrape config for probing services via the Blackbox Exporter.
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual service scrape endpoint to be configured
				\t\t\t\t// via the following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/probe`: Only probe services that have a value of `true`
				\t\t\t\tjob_name: "kubernetes-services"

				\t\t\t\tmetrics_path: "/probe"
				\t\t\t\tparams: module: ["http_2xx"]

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "service"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_probe"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__address__"]
				\t\t\t\t\ttarget_label: "__param_target"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "blackbox-exporter.example.com:9115"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__param_target"]
				\t\t\t\t\ttarget_label: "app"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_service_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_name"]
				\t\t\t\t\ttarget_label: "kubernetes_name"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Example scrape config for probing ingresses via the Blackbox Exporter.
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual ingress scrape endpoint to be configured
				\t\t\t\t// via the following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/probe`: Only probe services that have a value of `true`
				\t\t\t\tjob_name: "kubernetes-ingresses"

				\t\t\t\tmetrics_path: "/probe"
				\t\t\t\tparams: module: ["http_2xx"]

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "ingress"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_ingress_annotation_prometheus_io_probe"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_ingress_scheme", "__address__", "__meta_kubernetes_ingress_path"]
				\t\t\t\t\tregex:        "(.+);(.+);(.+)"
				\t\t\t\t\treplacement:  "${1}://${2}${3}"
				\t\t\t\t\ttarget_label: "__param_target"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "blackbox-exporter.example.com:9115"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__param_target"]
				\t\t\t\t\ttarget_label: "app"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_ingress_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_ingress_name"]
				\t\t\t\t\ttarget_label: "kubernetes_name"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Example scrape config for pods
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual pod scrape endpoint to be configured via the
				\t\t\t\t// following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/scrape`: Only scrape pods that have a value of `true`
				\t\t\t\t// * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\t\t\t\t// * `prometheus.io/port`: Scrape the pod on the indicated port instead of the
				\t\t\t\t// pod's declared ports (default is a port-free target if none are declared).
				\t\t\t\tjob_name: "kubernetes-pods"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "pod"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_pod_annotation_prometheus_io_scrape"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_pod_annotation_prometheus_io_path"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__address__", "__meta_kubernetes_pod_annotation_prometheus_io_port"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\tregex:        "([^:]+)(?::\\\\d+)?;(\\\\d+)"
				\t\t\t\t\treplacement:  "$1:$2"
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_pod_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_pod_name"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_pod_name"
				\t\t\t\t}]
				\t\t\t}]
				\t\t}
				\t}
				}

				"""
			ComparisonOutput: """
				package kube

				import yaml656e63 "encoding/yaml"

				configMap: prometheus: {
				\tapiVersion: "v1"
				\tkind:       "ConfigMap"
				\tmetadata: name: "prometheus"
				\tdata: {
				\t\t"alert.rules": yaml656e63.Marshal(_cue_alert_rules)
				\t\tlet _cue_alert_rules = {
				\t\t\tgroups: [{
				\t\t\t\tname: "rules.yaml"
				\t\t\t\trules: [{
				\t\t\t\t\talert: "InstanceDown"
				\t\t\t\t\texpr:  "up == 0"
				\t\t\t\t\tfor:   "30s"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: {
				\t\t\t\t\t\tdescription: "{{$labels.app}} of job {{ $labels.job }} has been down for more than 30 seconds."

				\t\t\t\t\t\tsummary: "Instance {{$labels.app}} down"
				\t\t\t\t\t}
				\t\t\t\t}, {
				\t\t\t\t\talert: "InsufficientPeers"
				\t\t\t\t\texpr:  "count(up{job=\\"etcd\\"} == 0) > (count(up{job=\\"etcd\\"}) / 2 - 1)"
				\t\t\t\t\tfor:   "3m"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: {
				\t\t\t\t\t\tdescription: "If one more etcd peer goes down the cluster will be unavailable"
				\t\t\t\t\t\tsummary:     "etcd cluster small"
				\t\t\t\t\t}
				\t\t\t\t}, {
				\t\t\t\t\talert: "EtcdNoMaster"
				\t\t\t\t\texpr:  "sum(etcd_server_has_leader{app=\\"etcd\\"}) == 0"
				\t\t\t\t\tfor:   "1s"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: summary: "No ETCD master elected."
				\t\t\t\t}, {
				\t\t\t\t\talert: "PodRestart"
				\t\t\t\t\texpr:  "(max_over_time(pod_container_status_restarts_total[5m]) - min_over_time(pod_container_status_restarts_total[5m])) > 2"
				\t\t\t\t\tfor:   "1m"
				\t\t\t\t\tlabels: severity: "page"
				\t\t\t\t\tannotations: {
				\t\t\t\t\t\tdescription: "{{$labels.app}} {{ $labels.container }} resturted {{ $value }} times in 5m."
				\t\t\t\t\t\tsummary:     "Pod for {{$labels.container}} restarts too often"
				\t\t\t\t\t}
				\t\t\t\t}]
				\t\t\t}]
				\t\t}

				\t\t"prometheus.yml": yaml656e63.Marshal(_cue_prometheus_yml)
				\t\tlet _cue_prometheus_yml = {
				\t\t\tglobal: scrape_interval: "15s"
				\t\t\trule_files: [
				\t\t\t\t"/etc/prometheus/alert.rules",
				\t\t\t]
				\t\t\talerting: alertmanagers: [{
				\t\t\t\tscheme: "http"
				\t\t\t\tstatic_configs: [{
				\t\t\t\t\ttargets: [
				\t\t\t\t\t\t"alertmanager:9093",
				\t\t\t\t\t]
				\t\t\t\t}]
				\t\t\t}]
				\t\t\tscrape_configs: [{
				\t\t\t\tjob_name: "kubernetes-apiservers"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "endpoints"
				\t\t\t\t}]

				\t\t\t\t// Default to scraping over https. If required, just disable this or change to
				\t\t\t\t// `http`.
				\t\t\t\tscheme: "https"

				\t\t\t\t// This TLS & bearer token file config is used to connect to the actual scrape
				\t\t\t\t// endpoints for cluster components. This is separate to discovery auth
				\t\t\t\t// configuration because discovery & scraping are two separate concerns in
				\t\t\t\t// Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\t\t\t\t// the cluster. Otherwise, more config options have to be provided within the
				\t\t\t\t// <kubernetes_sd_config>.
				\t\t\t\ttls_config: {
				\t\t\t\t\tca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
				\t\t\t\t}
				\t\t\t\t// If your node certificates are self-signed or use a different CA to the
				\t\t\t\t// master CA, then disable certificate verification below. Note that
				\t\t\t\t// certificate verification is an integral part of a secure infrastructure
				\t\t\t\t// so this should only be disabled in a controlled environment. You can
				\t\t\t\t// disable certificate verification by uncommenting the line below.
				\t\t\t\t//
				\t\t\t\t// insecure_skip_verify: true
				\t\t\t\tbearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"

				\t\t\t\t// Keep only the default/kubernetes service endpoints for the https port. This
				\t\t\t\t// will add targets for each API server which Kubernetes adds an endpoint to
				\t\t\t\t// the default/kubernetes service.
				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace", "__meta_kubernetes_service_name", "__meta_kubernetes_endpoint_port_name"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  "default;kubernetes;https"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Scrape config for nodes (kubelet).
				\t\t\t\t//
				\t\t\t\t// Rather than connecting directly to the node, the scrape is proxied though the
				\t\t\t\t// Kubernetes apiserver.  This means it will work if Prometheus is running out of
				\t\t\t\t// cluster, or can't connect to nodes for some other reason (e.g. because of
				\t\t\t\t// firewalling).
				\t\t\t\tjob_name: "kubernetes-nodes"

				\t\t\t\t// Default to scraping over https. If required, just disable this or change to
				\t\t\t\t// `http`.
				\t\t\t\tscheme: "https"

				\t\t\t\t// This TLS & bearer token file config is used to connect to the actual scrape
				\t\t\t\t// endpoints for cluster components. This is separate to discovery auth
				\t\t\t\t// configuration because discovery & scraping are two separate concerns in
				\t\t\t\t// Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\t\t\t\t// the cluster. Otherwise, more config options have to be provided within the
				\t\t\t\t// <kubernetes_sd_config>.
				\t\t\t\ttls_config: {
				\t\t\t\t\tca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
				\t\t\t\t}
				\t\t\t\tbearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "node"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_node_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "kubernetes.default.svc:443"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_node_name"]
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\treplacement:  "/api/v1/nodes/${1}/proxy/metrics"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Scrape config for Kubelet cAdvisor.
				\t\t\t\t//
				\t\t\t\t// This is required for Kubernetes 1.7.3 and later, where cAdvisor metrics
				\t\t\t\t// (those whose names begin with 'container_') have been removed from the
				\t\t\t\t// Kubelet metrics endpoint.  This job scrapes the cAdvisor endpoint to
				\t\t\t\t// retrieve those metrics.
				\t\t\t\t//
				\t\t\t\t// In Kubernetes 1.7.0-1.7.2, these metrics are only exposed on the cAdvisor
				\t\t\t\t// HTTP endpoint; use "replacement: /api/v1/nodes/${1}:4194/proxy/metrics"
				\t\t\t\t// in that case (and ensure cAdvisor's HTTP server hasn't been disabled with
				\t\t\t\t// the --cadvisor-port=0 Kubelet flag).
				\t\t\t\t//
				\t\t\t\t// This job is not necessary and should be removed in Kubernetes 1.6 and
				\t\t\t\t// earlier versions, or it will cause the metrics to be scraped twice.
				\t\t\t\tjob_name: "kubernetes-cadvisor"

				\t\t\t\t// Default to scraping over https. If required, just disable this or change to
				\t\t\t\t// `http`.
				\t\t\t\tscheme: "https"

				\t\t\t\t// This TLS & bearer token file config is used to connect to the actual scrape
				\t\t\t\t// endpoints for cluster components. This is separate to discovery auth
				\t\t\t\t// configuration because discovery & scraping are two separate concerns in
				\t\t\t\t// Prometheus. The discovery auth config is automatic if Prometheus runs inside
				\t\t\t\t// the cluster. Otherwise, more config options have to be provided within the
				\t\t\t\t// <kubernetes_sd_config>.
				\t\t\t\ttls_config: {
				\t\t\t\t\tca_file: "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
				\t\t\t\t}
				\t\t\t\tbearer_token_file: "/var/run/secrets/kubernetes.io/serviceaccount/token"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "node"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_node_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "kubernetes.default.svc:443"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_node_name"]
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\treplacement:  "/api/v1/nodes/${1}/proxy/metrics/cadvisor"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Scrape config for service endpoints.
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual service scrape endpoint to be configured
				\t\t\t\t// via the following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/scrape`: Only scrape services that have a value of `true`
				\t\t\t\t// * `prometheus.io/scheme`: If the metrics endpoint is secured then you will need
				\t\t\t\t// to set this to `https` & most likely set the `tls_config` of the scrape config.
				\t\t\t\t// * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\t\t\t\t// * `prometheus.io/port`: If the metrics are exposed on a different port to the
				\t\t\t\t// service then set this appropriately.
				\t\t\t\tjob_name: "kubernetes-service-endpoints"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "endpoints"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_scrape"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_scheme"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__scheme__"
				\t\t\t\t\tregex:        "(https?)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_path"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__address__", "__meta_kubernetes_service_annotation_prometheus_io_port"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\tregex:        "([^:]+)(?::\\\\d+)?;(\\\\d+)"
				\t\t\t\t\treplacement:  "$1:$2"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_service_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_name"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_name"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Example scrape config for probing services via the Blackbox Exporter.
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual service scrape endpoint to be configured
				\t\t\t\t// via the following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/probe`: Only probe services that have a value of `true`
				\t\t\t\tjob_name: "kubernetes-services"

				\t\t\t\tmetrics_path: "/probe"
				\t\t\t\tparams: module: ["http_2xx"]

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "service"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_annotation_prometheus_io_probe"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__address__"]
				\t\t\t\t\ttarget_label: "__param_target"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "blackbox-exporter.example.com:9115"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__param_target"]
				\t\t\t\t\ttarget_label: "app"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_service_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_service_name"]
				\t\t\t\t\ttarget_label: "kubernetes_name"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Example scrape config for probing ingresses via the Blackbox Exporter.
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual ingress scrape endpoint to be configured
				\t\t\t\t// via the following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/probe`: Only probe services that have a value of `true`
				\t\t\t\tjob_name: "kubernetes-ingresses"

				\t\t\t\tmetrics_path: "/probe"
				\t\t\t\tparams: module: ["http_2xx"]

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "ingress"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_ingress_annotation_prometheus_io_probe"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_ingress_scheme", "__address__", "__meta_kubernetes_ingress_path"]
				\t\t\t\t\tregex:        "(.+);(.+);(.+)"
				\t\t\t\t\treplacement:  "${1}://${2}${3}"
				\t\t\t\t\ttarget_label: "__param_target"
				\t\t\t\t}, {
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t\treplacement:  "blackbox-exporter.example.com:9115"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__param_target"]
				\t\t\t\t\ttarget_label: "app"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_ingress_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_ingress_name"]
				\t\t\t\t\ttarget_label: "kubernetes_name"
				\t\t\t\t}]
				\t\t\t}, {
				\t\t\t\t// Example scrape config for pods
				\t\t\t\t//
				\t\t\t\t// The relabeling allows the actual pod scrape endpoint to be configured via the
				\t\t\t\t// following annotations:
				\t\t\t\t//
				\t\t\t\t// * `prometheus.io/scrape`: Only scrape pods that have a value of `true`
				\t\t\t\t// * `prometheus.io/path`: If the metrics path is not `/metrics` override this.
				\t\t\t\t// * `prometheus.io/port`: Scrape the pod on the indicated port instead of the
				\t\t\t\t// pod's declared ports (default is a port-free target if none are declared).
				\t\t\t\tjob_name: "kubernetes-pods"

				\t\t\t\tkubernetes_sd_configs: [{
				\t\t\t\t\trole: "pod"
				\t\t\t\t}]

				\t\t\t\trelabel_configs: [{
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_pod_annotation_prometheus_io_scrape"]
				\t\t\t\t\taction: "keep"
				\t\t\t\t\tregex:  true
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_pod_annotation_prometheus_io_path"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "__metrics_path__"
				\t\t\t\t\tregex:        "(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__address__", "__meta_kubernetes_pod_annotation_prometheus_io_port"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\tregex:        "([^:]+)(?::\\\\d+)?;(\\\\d+)"
				\t\t\t\t\treplacement:  "$1:$2"
				\t\t\t\t\ttarget_label: "__address__"
				\t\t\t\t}, {
				\t\t\t\t\taction: "labelmap"
				\t\t\t\t\tregex:  "__meta_kubernetes_pod_label_(.+)"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_namespace"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_namespace"
				\t\t\t\t}, {
				\t\t\t\t\tsource_labels: ["__meta_kubernetes_pod_name"]
				\t\t\t\t\taction:       "replace"
				\t\t\t\t\ttarget_label: "kubernetes_pod_name"
				\t\t\t\t}]
				\t\t\t}]
				\t\t}
				\t}
				}

				"""
		}]
	}
	cueevalmonprom: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cueevalmonprom"
		Order:           13
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cue eval ./mon/prometheus -e configMap.prometheus"
			ExitCode: 0
			Output: #"""
				apiVersion: "v1"
				kind:       "ConfigMap"
				metadata: {
				    name: "prometheus"
				}
				data: {
				    "alert.rules": """
				        groups:
				          - name: rules.yaml
				            rules:
				              - alert: InstanceDown
				                expr: up == 0
				                for: 30s
				                labels:
				                  severity: page
				                annotations:
				                  description: '{{$labels.app}} of job {{ $labels.job }} has been down for more than 30 seconds.'
				                  summary: Instance {{$labels.app}} down
				              - alert: InsufficientPeers
				                expr: count(up{job="etcd"} == 0) > (count(up{job="etcd"}) / 2 - 1)
				                for: 3m
				                labels:
				                  severity: page
				                annotations:
				                  description: If one more etcd peer goes down the cluster will be unavailable
				                  summary: etcd cluster small
				              - alert: EtcdNoMaster
				                expr: sum(etcd_server_has_leader{app="etcd"}) == 0
				                for: 1s
				                labels:
				                  severity: page
				                annotations:
				                  summary: No ETCD master elected.
				              - alert: PodRestart
				                expr: (max_over_time(pod_container_status_restarts_total[5m]) - min_over_time(pod_container_status_restarts_total[5m])) > 2
				                for: 1m
				                labels:
				                  severity: page
				                annotations:
				                  description: '{{$labels.app}} {{ $labels.container }} resturted {{ $value }} times in 5m.'
				                  summary: Pod for {{$labels.container}} restarts too often

				        """
				    "prometheus.yml": """
				        global:
				          scrape_interval: 15s
				        rule_files:
				          - /etc/prometheus/alert.rules
				        alerting:
				          alertmanagers:
				            - scheme: http
				              static_configs:
				                - targets:
				                    - alertmanager:9093
				        scrape_configs:
				          - job_name: kubernetes-apiservers
				            kubernetes_sd_configs:
				              - role: endpoints
				            scheme: https
				            tls_config:
				              ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				            bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                  - __meta_kubernetes_service_name
				                  - __meta_kubernetes_endpoint_port_name
				                action: keep
				                regex: default;kubernetes;https
				          - job_name: kubernetes-nodes
				            scheme: https
				            tls_config:
				              ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				            bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
				            kubernetes_sd_configs:
				              - role: node
				            relabel_configs:
				              - action: labelmap
				                regex: __meta_kubernetes_node_label_(.+)
				              - target_label: __address__
				                replacement: kubernetes.default.svc:443
				              - source_labels:
				                  - __meta_kubernetes_node_name
				                regex: (.+)
				                target_label: __metrics_path__
				                replacement: /api/v1/nodes/${1}/proxy/metrics
				          - job_name: kubernetes-cadvisor
				            scheme: https
				            tls_config:
				              ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				            bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
				            kubernetes_sd_configs:
				              - role: node
				            relabel_configs:
				              - action: labelmap
				                regex: __meta_kubernetes_node_label_(.+)
				              - target_label: __address__
				                replacement: kubernetes.default.svc:443
				              - source_labels:
				                  - __meta_kubernetes_node_name
				                regex: (.+)
				                target_label: __metrics_path__
				                replacement: /api/v1/nodes/${1}/proxy/metrics/cadvisor
				          - job_name: kubernetes-service-endpoints
				            kubernetes_sd_configs:
				              - role: endpoints
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_scrape
				                action: keep
				                regex: true
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_scheme
				                action: replace
				                target_label: __scheme__
				                regex: (https?)
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_path
				                action: replace
				                target_label: __metrics_path__
				                regex: (.+)
				              - source_labels:
				                  - __address__
				                  - __meta_kubernetes_service_annotation_prometheus_io_port
				                action: replace
				                target_label: __address__
				                regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				                replacement: $1:$2
				              - action: labelmap
				                regex: __meta_kubernetes_service_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                action: replace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_service_name
				                action: replace
				                target_label: kubernetes_name
				          - job_name: kubernetes-services
				            metrics_path: /probe
				            params:
				              module:
				                - http_2xx
				            kubernetes_sd_configs:
				              - role: service
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_probe
				                action: keep
				                regex: true
				              - source_labels:
				                  - __address__
				                target_label: __param_target
				              - target_label: __address__
				                replacement: blackbox-exporter.example.com:9115
				              - source_labels:
				                  - __param_target
				                target_label: app
				              - action: labelmap
				                regex: __meta_kubernetes_service_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_service_name
				                target_label: kubernetes_name
				          - job_name: kubernetes-ingresses
				            metrics_path: /probe
				            params:
				              module:
				                - http_2xx
				            kubernetes_sd_configs:
				              - role: ingress
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_ingress_annotation_prometheus_io_probe
				                action: keep
				                regex: true
				              - source_labels:
				                  - __meta_kubernetes_ingress_scheme
				                  - __address__
				                  - __meta_kubernetes_ingress_path
				                regex: (.+);(.+);(.+)
				                replacement: ${1}://${2}${3}
				                target_label: __param_target
				              - target_label: __address__
				                replacement: blackbox-exporter.example.com:9115
				              - source_labels:
				                  - __param_target
				                target_label: app
				              - action: labelmap
				                regex: __meta_kubernetes_ingress_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_ingress_name
				                target_label: kubernetes_name
				          - job_name: kubernetes-pods
				            kubernetes_sd_configs:
				              - role: pod
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_pod_annotation_prometheus_io_scrape
				                action: keep
				                regex: true
				              - source_labels:
				                  - __meta_kubernetes_pod_annotation_prometheus_io_path
				                action: replace
				                target_label: __metrics_path__
				                regex: (.+)
				              - source_labels:
				                  - __address__
				                  - __meta_kubernetes_pod_annotation_prometheus_io_port
				                action: replace
				                regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				                replacement: $1:$2
				                target_label: __address__
				              - action: labelmap
				                regex: __meta_kubernetes_pod_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                action: replace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_pod_name
				                action: replace
				                target_label: kubernetes_pod_name

				        """
				}

				"""#
			ComparisonOutput: #"""
				apiVersion: "v1"
				kind:       "ConfigMap"
				metadata: {
				    name: "prometheus"
				}
				data: {
				    "alert.rules": """
				        groups:
				          - name: rules.yaml
				            rules:
				              - alert: InstanceDown
				                expr: up == 0
				                for: 30s
				                labels:
				                  severity: page
				                annotations:
				                  description: '{{$labels.app}} of job {{ $labels.job }} has been down for more than 30 seconds.'
				                  summary: Instance {{$labels.app}} down
				              - alert: InsufficientPeers
				                expr: count(up{job="etcd"} == 0) > (count(up{job="etcd"}) / 2 - 1)
				                for: 3m
				                labels:
				                  severity: page
				                annotations:
				                  description: If one more etcd peer goes down the cluster will be unavailable
				                  summary: etcd cluster small
				              - alert: EtcdNoMaster
				                expr: sum(etcd_server_has_leader{app="etcd"}) == 0
				                for: 1s
				                labels:
				                  severity: page
				                annotations:
				                  summary: No ETCD master elected.
				              - alert: PodRestart
				                expr: (max_over_time(pod_container_status_restarts_total[5m]) - min_over_time(pod_container_status_restarts_total[5m])) > 2
				                for: 1m
				                labels:
				                  severity: page
				                annotations:
				                  description: '{{$labels.app}} {{ $labels.container }} resturted {{ $value }} times in 5m.'
				                  summary: Pod for {{$labels.container}} restarts too often

				        """
				    "prometheus.yml": """
				        global:
				          scrape_interval: 15s
				        rule_files:
				          - /etc/prometheus/alert.rules
				        alerting:
				          alertmanagers:
				            - scheme: http
				              static_configs:
				                - targets:
				                    - alertmanager:9093
				        scrape_configs:
				          - job_name: kubernetes-apiservers
				            kubernetes_sd_configs:
				              - role: endpoints
				            scheme: https
				            tls_config:
				              ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				            bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                  - __meta_kubernetes_service_name
				                  - __meta_kubernetes_endpoint_port_name
				                action: keep
				                regex: default;kubernetes;https
				          - job_name: kubernetes-nodes
				            scheme: https
				            tls_config:
				              ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				            bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
				            kubernetes_sd_configs:
				              - role: node
				            relabel_configs:
				              - action: labelmap
				                regex: __meta_kubernetes_node_label_(.+)
				              - target_label: __address__
				                replacement: kubernetes.default.svc:443
				              - source_labels:
				                  - __meta_kubernetes_node_name
				                regex: (.+)
				                target_label: __metrics_path__
				                replacement: /api/v1/nodes/${1}/proxy/metrics
				          - job_name: kubernetes-cadvisor
				            scheme: https
				            tls_config:
				              ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
				            bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
				            kubernetes_sd_configs:
				              - role: node
				            relabel_configs:
				              - action: labelmap
				                regex: __meta_kubernetes_node_label_(.+)
				              - target_label: __address__
				                replacement: kubernetes.default.svc:443
				              - source_labels:
				                  - __meta_kubernetes_node_name
				                regex: (.+)
				                target_label: __metrics_path__
				                replacement: /api/v1/nodes/${1}/proxy/metrics/cadvisor
				          - job_name: kubernetes-service-endpoints
				            kubernetes_sd_configs:
				              - role: endpoints
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_scrape
				                action: keep
				                regex: true
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_scheme
				                action: replace
				                target_label: __scheme__
				                regex: (https?)
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_path
				                action: replace
				                target_label: __metrics_path__
				                regex: (.+)
				              - source_labels:
				                  - __address__
				                  - __meta_kubernetes_service_annotation_prometheus_io_port
				                action: replace
				                target_label: __address__
				                regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				                replacement: $1:$2
				              - action: labelmap
				                regex: __meta_kubernetes_service_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                action: replace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_service_name
				                action: replace
				                target_label: kubernetes_name
				          - job_name: kubernetes-services
				            metrics_path: /probe
				            params:
				              module:
				                - http_2xx
				            kubernetes_sd_configs:
				              - role: service
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_service_annotation_prometheus_io_probe
				                action: keep
				                regex: true
				              - source_labels:
				                  - __address__
				                target_label: __param_target
				              - target_label: __address__
				                replacement: blackbox-exporter.example.com:9115
				              - source_labels:
				                  - __param_target
				                target_label: app
				              - action: labelmap
				                regex: __meta_kubernetes_service_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_service_name
				                target_label: kubernetes_name
				          - job_name: kubernetes-ingresses
				            metrics_path: /probe
				            params:
				              module:
				                - http_2xx
				            kubernetes_sd_configs:
				              - role: ingress
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_ingress_annotation_prometheus_io_probe
				                action: keep
				                regex: true
				              - source_labels:
				                  - __meta_kubernetes_ingress_scheme
				                  - __address__
				                  - __meta_kubernetes_ingress_path
				                regex: (.+);(.+);(.+)
				                replacement: ${1}://${2}${3}
				                target_label: __param_target
				              - target_label: __address__
				                replacement: blackbox-exporter.example.com:9115
				              - source_labels:
				                  - __param_target
				                target_label: app
				              - action: labelmap
				                regex: __meta_kubernetes_ingress_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_ingress_name
				                target_label: kubernetes_name
				          - job_name: kubernetes-pods
				            kubernetes_sd_configs:
				              - role: pod
				            relabel_configs:
				              - source_labels:
				                  - __meta_kubernetes_pod_annotation_prometheus_io_scrape
				                action: keep
				                regex: true
				              - source_labels:
				                  - __meta_kubernetes_pod_annotation_prometheus_io_path
				                action: replace
				                target_label: __metrics_path__
				                regex: (.+)
				              - source_labels:
				                  - __address__
				                  - __meta_kubernetes_pod_annotation_prometheus_io_port
				                action: replace
				                regex: ([^:]+)(?::\#\\#\d+)?;(\#\\#\d+)
				                replacement: $1:$2
				                target_label: __address__
				              - action: labelmap
				                regex: __meta_kubernetes_pod_label_(.+)
				              - source_labels:
				                  - __meta_kubernetes_namespace
				                action: replace
				                target_label: kubernetes_namespace
				              - source_labels:
				                  - __meta_kubernetes_pod_name
				                action: replace
				                target_label: kubernetes_pod_name

				        """
				}

				"""#
		}]
	}
	initialsnapshot: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "initialsnapshot"
		Order:           14
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	cpbread: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cpbread"
		Order:           15
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cp frontend/breaddispatcher/kube.cue ."
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	serviceskube1: {
		StepType: 2
		Name:     "serviceskube1"
		Order:    16
		Terminal: "term1"
		Language: "cue"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package kube

			service: [ID=_]: {
			\tapiVersion: "v1"
			\tkind:       "Service"
			\tmetadata: {
			\t\tname: ID
			\t\tlabels: {
			\t\t\tapp:       ID     // by convention
			\t\t\tdomain:    "prod" // always the same in the given files
			\t\t\tcomponent: string // varies per directory
			\t\t}
			\t}
			\tspec: {
			\t\t// Any port has the following properties.
			\t\tports: [...{
			\t\t\tport:     int
			\t\t\tprotocol: *"TCP" | "UDP" // from the Kubernetes definition
			\t\t\tname:     string | *"client"
			\t\t}]
			\t\tselector: metadata.labels // we want those to be the same
			\t}
			}

			deployment: [ID=_]: {
			\tapiVersion: "apps/v1"
			\tkind:       "Deployment"
			\tmetadata: name: ID
			\tspec: {
			\t\t// 1 is the default, but we allow any number
			\t\treplicas: *1 | int
			\t\ttemplate: {
			\t\t\tmetadata: labels: {
			\t\t\t\tapp:       ID
			\t\t\t\tdomain:    "prod"
			\t\t\t\tcomponent: string
			\t\t\t}
			\t\t\t// we always have one namesake container
			\t\t\tspec: containers: [{name: ID}]
			\t\t}
			\t}
			}

			"""
		Target: "/workdir/services/kube.cue"
	}
	badsnapshot2: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "badsnapshot2"
		Order:           17
		Terminal:        "term1"
		Stmts: [{
			Negated:  true
			CmdStr:   "cue eval -c ./... >snapshot2"
			ExitCode: 1
			Output: """
				// /workdir/services/mon/alertmanager
				deployment.alertmanager.spec.template.metadata.labels.component: incomplete value string:
				    ./kube.cue:36:16
				service.alertmanager.metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service.alertmanager.spec.selector.component: incomplete value string:
				    ./kube.cue:11:15
				// /workdir/services/mon/nodeexporter
				service."node-exporter".metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service."node-exporter".spec.selector.component: incomplete value string:
				    ./kube.cue:11:15
				// /workdir/services/mon/prometheus
				deployment.prometheus.spec.template.metadata.labels.component: incomplete value string:
				    ./kube.cue:36:16
				service.prometheus.metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service.prometheus.spec.selector.component: incomplete value string:
				    ./kube.cue:11:15
				// /workdir/services/proxy/authproxy
				deployment.authproxy.spec.template.metadata.labels.component: incomplete value string:
				    ./kube.cue:36:16
				service.authproxy.metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service.authproxy.spec.selector.component: incomplete value string:
				    ./kube.cue:11:15

				"""
			ComparisonOutput: """
				// /workdir/services/mon/alertmanager
				deployment.alertmanager.spec.template.metadata.labels.component: incomplete value string:
				    ./kube.cue:36:16
				service.alertmanager.metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service.alertmanager.spec.selector.component: incomplete value string:
				    ./kube.cue:11:15
				// /workdir/services/mon/nodeexporter
				service."node-exporter".metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service."node-exporter".spec.selector.component: incomplete value string:
				    ./kube.cue:11:15
				// /workdir/services/mon/prometheus
				deployment.prometheus.spec.template.metadata.labels.component: incomplete value string:
				    ./kube.cue:36:16
				service.prometheus.metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service.prometheus.spec.selector.component: incomplete value string:
				    ./kube.cue:11:15
				// /workdir/services/proxy/authproxy
				deployment.authproxy.spec.template.metadata.labels.component: incomplete value string:
				    ./kube.cue:36:16
				service.authproxy.metadata.labels.component: incomplete value string:
				    ./kube.cue:11:15
				service.authproxy.spec.selector.component: incomplete value string:
				    ./kube.cue:11:15

				"""
		}]
	}
	sedfix: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "sedfix"
		Order:           18
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "sed -i.bak 's/component:.*string/component: #Component/' kube.cue"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "rm kube.cue.bak"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated: false
			CmdStr: """
				cat <<EOF >>kube.cue

				#Component: string
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated: false
			CmdStr: """
				ls -d */ | sed 's/.$//' | xargs -I DIR sh -c 'cd DIR; echo "package kube

				#Component: \\"DIR\\"
				" > kube.cue; cd ..'
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue fmt kube.cue */kube.cue"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	snapshot2: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "snapshot2"
		Order:           19
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  true
			CmdStr:   "diff -wu snapshot snapshot2"
			ExitCode: 1
			Output: #"""
				--- snapshot\#t2022-02-22 17:04:33.883794333 +0000
				+++ snapshot2\#t2022-02-22 17:04:35.555886481 +0000
				@@ -1,3 +1,9 @@
				+service: {}
				+deployment: {}
				+// ---
				+service: {}
				+deployment: {}
				+// ---
				 service: {
				     bartender: {
				         apiVersion: "v1"
				@@ -208,6 +214,7 @@
				             selector: {
				                 app:    "maitred"
				                 domain: "prod"
				+                component: "frontend"
				             }
				         }
				     }
				@@ -270,6 +277,7 @@
				             selector: {
				                 app:    "valeter"
				                 domain: "prod"
				+                component: "frontend"
				             }
				         }
				     }
				@@ -330,6 +338,8 @@
				             }]
				             selector: {
				                 app: "waiter"
				+                domain:    "prod"
				+                component: "frontend"
				             }
				         }
				     }
				@@ -432,6 +442,9 @@
				     }
				 }
				 // ---
				+service: {}
				+deployment: {}
				+// ---
				 service: {
				     download: {
				         apiVersion: "v1"
				@@ -454,6 +467,7 @@
				             selector: {
				                 app:    "download"
				                 domain: "prod"
				+                component: "infra"
				             }
				         }
				     }
				@@ -497,6 +511,7 @@
				             name: "etcd"
				             labels: {
				                 app:       "etcd"
				+                domain:    "prod"
				                 component: "infra"
				             }
				         }
				@@ -515,10 +530,13 @@
				             }]
				             selector: {
				                 app: "etcd"
				+                domain:    "prod"
				+                component: "infra"
				             }
				         }
				     }
				 }
				+deployment: {}
				 statefulSet: {
				     etcd: {
				         apiVersion: "apps/v1"
				@@ -712,6 +730,35 @@
				     }
				 }
				 // ---
				+service: {
				+    tasks: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "tasks"
				+            labels: {
				+                app:       "tasks"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        spec: {
				+            type:           "LoadBalancer"
				+            loadBalancerIP: "1.2.3.4"
				+            ports: [{
				+                port:       443
				+                targetPort: 7443
				+                protocol:   "TCP"
				+                name:       "http"
				+            }]
				+            selector: {
				+                app:       "tasks"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+    }
				+}
				 deployment: {
				     tasks: {
				         apiVersion: "apps/v1"
				@@ -729,6 +776,7 @@
				                     }
				                     labels: {
				                         app:       "tasks"
				+                        domain:    "prod"
				                         component: "infra"
				                     }
				                 }
				@@ -757,32 +805,6 @@
				         }
				     }
				 }
				-service: {
				-    tasks: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "tasks"
				-            labels: {
				-                app:       "tasks"
				-                component: "infra"
				-            }
				-        }
				-        spec: {
				-            type:           "LoadBalancer"
				-            loadBalancerIP: "1.2.3.4"
				-            ports: [{
				-                port:       443
				-                targetPort: 7443
				-                protocol:   "TCP"
				-                name:       "http"
				-            }]
				-            selector: {
				-                app: "tasks"
				-            }
				-        }
				-    }
				-}
				 // ---
				 service: {
				     updater: {
				@@ -806,6 +828,7 @@
				             selector: {
				                 app:    "updater"
				                 domain: "prod"
				+                component: "infra"
				             }
				         }
				     }
				@@ -852,6 +875,35 @@
				     }
				 }
				 // ---
				+service: {
				+    watcher: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "watcher"
				+            labels: {
				+                app:       "watcher"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        spec: {
				+            type:           "LoadBalancer"
				+            loadBalancerIP: "1.2.3.4."
				+            ports: [{
				+                port:       7788
				+                targetPort: 7788
				+                protocol:   "TCP"
				+                name:       "http"
				+            }]
				+            selector: {
				+                app:       "watcher"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+    }
				+}
				 deployment: {
				     watcher: {
				         apiVersion: "apps/v1"
				@@ -894,33 +946,9 @@
				         }
				     }
				 }
				-service: {
				-    watcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "watcher"
				-            labels: {
				-                app:       "watcher"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				-        spec: {
				-            type:           "LoadBalancer"
				-            loadBalancerIP: "1.2.3.4."
				-            ports: [{
				-                port:       7788
				-                targetPort: 7788
				-                protocol:   "TCP"
				-                name:       "http"
				-            }]
				-            selector: {
				-                app: "watcher"
				-            }
				-        }
				-    }
				-}
				+// ---
				+service: {}
				+deployment: {}
				 // ---
				 service: {
				     caller: {
				@@ -944,6 +972,7 @@
				             selector: {
				                 app:    "caller"
				                 domain: "prod"
				+                component: "kitchen"
				             }
				         }
				     }
				@@ -1500,6 +1529,8 @@
				             }]
				             selector: {
				                 app: "souschef"
				+                domain:    "prod"
				+                component: "kitchen"
				             }
				         }
				     }
				@@ -1543,33 +1574,9 @@
				     }
				 }
				 // ---
				-configMap: {
				-    alertmanager: {
				-        apiVersion: "v1"
				-        kind:       "ConfigMap"
				-        metadata: {
				-            name: "alertmanager"
				-        }
				-        data: {
				-            "alerts.yaml": """
				-                receivers:
				-                  - name: pager
				-                    slack_configs:
				-                      - channel: '#cloudmon'
				-                        text: |-
				-                          {{ range .Alerts }}{{ .Annotations.description }}
				-                          {{ end }}
				-                        send_resolved: true
				-                route:
				-                  receiver: pager
				-                  group_by:
				-                    - alertname
				-                    - cluster
				-
				-                """
				-        }
				-    }
				-}
				+service: {}
				+deployment: {}
				+// ---
				 service: {
				     alertmanager: {
				         apiVersion: "v1"
				@@ -1582,6 +1589,8 @@
				             name: "alertmanager"
				             labels: {
				                 app: "alertmanager"
				+                domain:    "prod"
				+                component: "mon"
				             }
				         }
				         spec: {
				@@ -1593,7 +1602,36 @@
				             }]
				             selector: {
				                 app: "alertmanager"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+    }
				             }
				+configMap: {
				+    alertmanager: {
				+        apiVersion: "v1"
				+        kind:       "ConfigMap"
				+        metadata: {
				+            name: "alertmanager"
				+        }
				+        data: {
				+            "alerts.yaml": """
				+                receivers:
				+                  - name: pager
				+                    slack_configs:
				+                      - channel: '#cloudmon'
				+                        text: |-
				+                          {{ range .Alerts }}{{ .Annotations.description }}
				+                          {{ end }}
				+                        send_resolved: true
				+                route:
				+                  receiver: pager
				+                  group_by:
				+                    - alertname
				+                    - cluster
				+
				+                """
				         }
				     }
				 }
				@@ -1616,6 +1654,8 @@
				                     name: "alertmanager"
				                     labels: {
				                         app: "alertmanager"
				+                        domain:    "prod"
				+                        component: "mon"
				                     }
				                 }
				                 spec: {
				@@ -1650,6 +1690,33 @@
				     }
				 }
				 // ---
				+service: {
				+    grafana: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "grafana"
				+            labels: {
				+                app:       "grafana"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+        spec: {
				+            ports: [{
				+                name:       "grafana"
				+                port:       3000
				+                protocol:   "TCP"
				+                targetPort: 3000
				+            }]
				+            selector: {
				+                app:       "grafana"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+    }
				+}
				 deployment: {
				     grafana: {
				         apiVersion: "apps/v1"
				@@ -1667,6 +1734,7 @@
				                 metadata: {
				                     labels: {
				                         app:       "grafana"
				+                        domain:    "prod"
				                         component: "mon"
				                     }
				                 }
				@@ -1714,31 +1782,6 @@
				         }
				     }
				 }
				-service: {
				-    grafana: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "grafana"
				-            labels: {
				-                app:       "grafana"
				-                component: "mon"
				-            }
				-        }
				-        spec: {
				-            ports: [{
				-                name:       "grafana"
				-                port:       3000
				-                protocol:   "TCP"
				-                targetPort: 3000
				-            }]
				-            selector: {
				-                app:       "grafana"
				-                component: "mon"
				-            }
				-        }
				-    }
				-}
				 // ---
				 service: {
				     "node-exporter": {
				@@ -1751,6 +1794,8 @@
				             name: "node-exporter"
				             labels: {
				                 app: "node-exporter"
				+                domain:    "prod"
				+                component: "mon"
				             }
				         }
				         spec: {
				@@ -1763,10 +1808,13 @@
				             }]
				             selector: {
				                 app: "node-exporter"
				+                domain:    "prod"
				+                component: "mon"
				             }
				         }
				     }
				 }
				+deployment: {}
				 daemonSet: {
				     "node-exporter": {
				         apiVersion: "apps/v1"
				@@ -1831,6 +1879,37 @@
				     }
				 }
				 // ---
				+service: {
				+    prometheus: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            annotations: {
				+                "prometheus.io/scrape": "true"
				+            }
				+            name: "prometheus"
				+            labels: {
				+                app:       "prometheus"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+        spec: {
				+            type: "NodePort"
				+            ports: [{
				+                name:     "main"
				+                port:     9090
				+                protocol: "TCP"
				+                nodePort: 30900
				+            }]
				+            selector: {
				+                app:       "prometheus"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+    }
				+}
				 configMap: {
				     prometheus: {
				         apiVersion: "v1"
				@@ -2066,33 +2145,6 @@
				         }
				     }
				 }
				-service: {
				-    prometheus: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            annotations: {
				-                "prometheus.io/scrape": "true"
				-            }
				-            name: "prometheus"
				-            labels: {
				-                app: "prometheus"
				-            }
				-        }
				-        spec: {
				-            type: "NodePort"
				-            ports: [{
				-                name:     "main"
				-                port:     9090
				-                protocol: "TCP"
				-                nodePort: 30900
				-            }]
				-            selector: {
				-                app: "prometheus"
				-            }
				-        }
				-    }
				-}
				 deployment: {
				     prometheus: {
				         apiVersion: "apps/v1"
				@@ -2119,6 +2171,8 @@
				                     name: "prometheus"
				                     labels: {
				                         app: "prometheus"
				+                        domain:    "prod"
				+                        component: "mon"
				                     }
				                     annotations: {
				                         "prometheus.io.scrape": "true"
				@@ -2150,6 +2204,77 @@
				     }
				 }
				 // ---
				+service: {}
				+deployment: {}
				+// ---
				+service: {
				+    authproxy: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "authproxy"
				+            labels: {
				+                app:       "authproxy"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        spec: {
				+            ports: [{
				+                port:       4180
				+                protocol:   "TCP"
				+                targetPort: 4180
				+                name:       "client"
				+            }]
				+            selector: {
				+                app:       "authproxy"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+    }
				+}
				+deployment: {
				+    authproxy: {
				+        apiVersion: "apps/v1"
				+        kind:       "Deployment"
				+        metadata: {
				+            name: "authproxy"
				+        }
				+        spec: {
				+            replicas: 1
				+            template: {
				+                metadata: {
				+                    labels: {
				+                        app:       "authproxy"
				+                        domain:    "prod"
				+                        component: "proxy"
				+                    }
				+                }
				+                spec: {
				+                    containers: [{
				+                        image: "skippy/oauth2_proxy:2.0.1"
				+                        ports: [{
				+                            containerPort: 4180
				+                        }]
				+                        args: ["--config=/etc/authproxy/authproxy.cfg"]
				+                        name: "authproxy"
				+                        volumeMounts: [{
				+                            name:      "config-volume"
				+                            mountPath: "/etc/authproxy"
				+                        }]
				+                    }]
				+                    volumes: [{
				+                        name: "config-volume"
				+                        configMap: {
				+                            name: "authproxy"
				+                        }
				+                    }]
				+                }
				+            }
				+        }
				+    }
				+}
				 configMap: {
				     authproxy: {
				         apiVersion: "v1"
				@@ -2214,71 +2339,36 @@
				         }
				     }
				 }
				-deployment: {
				-    authproxy: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				-        metadata: {
				-            name: "authproxy"
				-        }
				-        spec: {
				-            replicas: 1
				-            template: {
				-                metadata: {
				-                    labels: {
				-                        app:    "authproxy"
				-                        domain: "prod"
				-                    }
				-                }
				-                spec: {
				-                    containers: [{
				-                        image: "skippy/oauth2_proxy:2.0.1"
				-                        ports: [{
				-                            containerPort: 4180
				-                        }]
				-                        args: ["--config=/etc/authproxy/authproxy.cfg"]
				-                        name: "authproxy"
				-                        volumeMounts: [{
				-                            name:      "config-volume"
				-                            mountPath: "/etc/authproxy"
				-                        }]
				-                    }]
				-                    volumes: [{
				-                        name: "config-volume"
				-                        configMap: {
				-                            name: "authproxy"
				-                        }
				-                    }]
				-                }
				-            }
				-        }
				-    }
				-}
				+// ---
				 service: {
				-    authproxy: {
				+    goget: {
				         apiVersion: "v1"
				         kind:       "Service"
				         metadata: {
				-            name: "authproxy"
				+            name: "goget"
				             labels: {
				-                app:    "authproxy"
				+                app:       "goget"
				                 domain: "prod"
				+                component: "proxy"
				             }
				         }
				         spec: {
				+            type:           "LoadBalancer"
				+            loadBalancerIP: "1.3.5.7"
				             ports: [{
				-                port:       4180
				+                port:       443
				+                targetPort: 7443
				                 protocol:   "TCP"
				-                targetPort: 4180
				-                name:       "client"
				+                name:       "https"
				             }]
				             selector: {
				-                app: "authproxy"
				+                app:       "goget"
				+                domain:    "prod"
				+                component: "proxy"
				             }
				         }
				     }
				 }
				-// ---
				 deployment: {
				     goget: {
				         apiVersion: "apps/v1"
				@@ -2292,6 +2382,7 @@
				                 metadata: {
				                     labels: {
				                         app:       "goget"
				+                        domain:    "prod"
				                         component: "proxy"
				                     }
				                 }
				@@ -2318,33 +2409,91 @@
				         }
				     }
				 }
				+// ---
				 service: {
				-    goget: {
				+    nginx: {
				         apiVersion: "v1"
				         kind:       "Service"
				         metadata: {
				-            name: "goget"
				+            name: "nginx"
				             labels: {
				-                app:       "goget"
				+                app:       "nginx"
				+                domain:    "prod"
				                 component: "proxy"
				             }
				         }
				         spec: {
				             type:           "LoadBalancer"
				-            loadBalancerIP: "1.3.5.7"
				+            loadBalancerIP: "1.3.4.5"
				             ports: [{
				+                port:       80
				+                targetPort: 80
				+                protocol:   "TCP"
				+                name:       "http"
				+            }, {
				                 port:       443
				-                targetPort: 7443
				                 protocol:   "TCP"
				                 name:       "https"
				             }]
				             selector: {
				-                app: "goget"
				+                app:       "nginx"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+    }
				+}
				+deployment: {
				+    nginx: {
				+        apiVersion: "apps/v1"
				+        kind:       "Deployment"
				+        metadata: {
				+            name: "nginx"
				+        }
				+        spec: {
				+            replicas: 1
				+            template: {
				+                metadata: {
				+                    labels: {
				+                        app:       "nginx"
				+                        domain:    "prod"
				+                        component: "proxy"
				+                    }
				+                }
				+                spec: {
				+                    volumes: [{
				+                        name: "secret-volume"
				+                        secret: {
				+                            secretName: "proxy-secrets"
				+                        }
				+                    }, {
				+                        name: "config-volume"
				+                        configMap: {
				+                            name: "nginx"
				+                        }
				+                    }]
				+                    containers: [{
				+                        image: "nginx:1.11.10-alpine"
				+                        ports: [{
				+                            containerPort: 80
				+                        }, {
				+                            containerPort: 443
				+                        }]
				+                        name: "nginx"
				+                        volumeMounts: [{
				+                            mountPath: "/etc/ssl"
				+                            name:      "secret-volume"
				+                        }, {
				+                            name:      "config-volume"
				+                            mountPath: "/etc/nginx/nginx.conf"
				+                            subPath:   "nginx.conf"
				+                        }]
				+                    }]
				+                }
				             }
				         }
				     }
				 }
				-// ---
				 configMap: {
				     nginx: {
				         apiVersion: "v1"
				@@ -2510,83 +2659,3 @@
				         }
				     }
				 }
				-deployment: {
				-    nginx: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				-        metadata: {
				-            name: "nginx"
				-        }
				-        spec: {
				-            replicas: 1
				-            template: {
				-                metadata: {
				-                    labels: {
				-                        app:       "nginx"
				-                        component: "proxy"
				-                    }
				-                }
				-                spec: {
				-                    volumes: [{
				-                        name: "secret-volume"
				-                        secret: {
				-                            secretName: "proxy-secrets"
				-                        }
				-                    }, {
				-                        name: "config-volume"
				-                        configMap: {
				-                            name: "nginx"
				-                        }
				-                    }]
				-                    containers: [{
				-                        image: "nginx:1.11.10-alpine"
				-                        ports: [{
				-                            containerPort: 80
				-                        }, {
				-                            containerPort: 443
				-                        }]
				-                        name: "nginx"
				-                        volumeMounts: [{
				-                            mountPath: "/etc/ssl"
				-                            name:      "secret-volume"
				-                        }, {
				-                            name:      "config-volume"
				-                            mountPath: "/etc/nginx/nginx.conf"
				-                            subPath:   "nginx.conf"
				-                        }]
				-                    }]
				-                }
				-            }
				-        }
				-    }
				-}
				-service: {
				-    nginx: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "nginx"
				-            labels: {
				-                app:       "nginx"
				-                component: "proxy"
				-            }
				-        }
				-        spec: {
				-            type:           "LoadBalancer"
				-            loadBalancerIP: "1.3.4.5"
				-            ports: [{
				-                port:       80
				-                targetPort: 80
				-                protocol:   "TCP"
				-                name:       "http"
				-            }, {
				-                port:     443
				-                protocol: "TCP"
				-                name:     "https"
				-            }]
				-            selector: {
				-                app: "nginx"
				-            }
				-        }
				-    }
				-}

				"""#
			ComparisonOutput: #"""
				--- snapshot\#t2022-02-22 17:04:33.883794333 +0000
				+++ snapshot2\#t2022-02-22 17:04:35.555886481 +0000
				@@ -1,3 +1,9 @@
				+service: {}
				+deployment: {}
				+// ---
				+service: {}
				+deployment: {}
				+// ---
				 service: {
				     bartender: {
				         apiVersion: "v1"
				@@ -208,6 +214,7 @@
				             selector: {
				                 app:    "maitred"
				                 domain: "prod"
				+                component: "frontend"
				             }
				         }
				     }
				@@ -270,6 +277,7 @@
				             selector: {
				                 app:    "valeter"
				                 domain: "prod"
				+                component: "frontend"
				             }
				         }
				     }
				@@ -330,6 +338,8 @@
				             }]
				             selector: {
				                 app: "waiter"
				+                domain:    "prod"
				+                component: "frontend"
				             }
				         }
				     }
				@@ -432,6 +442,9 @@
				     }
				 }
				 // ---
				+service: {}
				+deployment: {}
				+// ---
				 service: {
				     download: {
				         apiVersion: "v1"
				@@ -454,6 +467,7 @@
				             selector: {
				                 app:    "download"
				                 domain: "prod"
				+                component: "infra"
				             }
				         }
				     }
				@@ -497,6 +511,7 @@
				             name: "etcd"
				             labels: {
				                 app:       "etcd"
				+                domain:    "prod"
				                 component: "infra"
				             }
				         }
				@@ -515,10 +530,13 @@
				             }]
				             selector: {
				                 app: "etcd"
				+                domain:    "prod"
				+                component: "infra"
				             }
				         }
				     }
				 }
				+deployment: {}
				 statefulSet: {
				     etcd: {
				         apiVersion: "apps/v1"
				@@ -712,6 +730,35 @@
				     }
				 }
				 // ---
				+service: {
				+    tasks: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "tasks"
				+            labels: {
				+                app:       "tasks"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        spec: {
				+            type:           "LoadBalancer"
				+            loadBalancerIP: "1.2.3.4"
				+            ports: [{
				+                port:       443
				+                targetPort: 7443
				+                protocol:   "TCP"
				+                name:       "http"
				+            }]
				+            selector: {
				+                app:       "tasks"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+    }
				+}
				 deployment: {
				     tasks: {
				         apiVersion: "apps/v1"
				@@ -729,6 +776,7 @@
				                     }
				                     labels: {
				                         app:       "tasks"
				+                        domain:    "prod"
				                         component: "infra"
				                     }
				                 }
				@@ -757,32 +805,6 @@
				         }
				     }
				 }
				-service: {
				-    tasks: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "tasks"
				-            labels: {
				-                app:       "tasks"
				-                component: "infra"
				-            }
				-        }
				-        spec: {
				-            type:           "LoadBalancer"
				-            loadBalancerIP: "1.2.3.4"
				-            ports: [{
				-                port:       443
				-                targetPort: 7443
				-                protocol:   "TCP"
				-                name:       "http"
				-            }]
				-            selector: {
				-                app: "tasks"
				-            }
				-        }
				-    }
				-}
				 // ---
				 service: {
				     updater: {
				@@ -806,6 +828,7 @@
				             selector: {
				                 app:    "updater"
				                 domain: "prod"
				+                component: "infra"
				             }
				         }
				     }
				@@ -852,6 +875,35 @@
				     }
				 }
				 // ---
				+service: {
				+    watcher: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "watcher"
				+            labels: {
				+                app:       "watcher"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        spec: {
				+            type:           "LoadBalancer"
				+            loadBalancerIP: "1.2.3.4."
				+            ports: [{
				+                port:       7788
				+                targetPort: 7788
				+                protocol:   "TCP"
				+                name:       "http"
				+            }]
				+            selector: {
				+                app:       "watcher"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+    }
				+}
				 deployment: {
				     watcher: {
				         apiVersion: "apps/v1"
				@@ -894,33 +946,9 @@
				         }
				     }
				 }
				-service: {
				-    watcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "watcher"
				-            labels: {
				-                app:       "watcher"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				-        spec: {
				-            type:           "LoadBalancer"
				-            loadBalancerIP: "1.2.3.4."
				-            ports: [{
				-                port:       7788
				-                targetPort: 7788
				-                protocol:   "TCP"
				-                name:       "http"
				-            }]
				-            selector: {
				-                app: "watcher"
				-            }
				-        }
				-    }
				-}
				+// ---
				+service: {}
				+deployment: {}
				 // ---
				 service: {
				     caller: {
				@@ -944,6 +972,7 @@
				             selector: {
				                 app:    "caller"
				                 domain: "prod"
				+                component: "kitchen"
				             }
				         }
				     }
				@@ -1500,6 +1529,8 @@
				             }]
				             selector: {
				                 app: "souschef"
				+                domain:    "prod"
				+                component: "kitchen"
				             }
				         }
				     }
				@@ -1543,33 +1574,9 @@
				     }
				 }
				 // ---
				-configMap: {
				-    alertmanager: {
				-        apiVersion: "v1"
				-        kind:       "ConfigMap"
				-        metadata: {
				-            name: "alertmanager"
				-        }
				-        data: {
				-            "alerts.yaml": """
				-                receivers:
				-                  - name: pager
				-                    slack_configs:
				-                      - channel: '#cloudmon'
				-                        text: |-
				-                          {{ range .Alerts }}{{ .Annotations.description }}
				-                          {{ end }}
				-                        send_resolved: true
				-                route:
				-                  receiver: pager
				-                  group_by:
				-                    - alertname
				-                    - cluster
				-
				-                """
				-        }
				-    }
				-}
				+service: {}
				+deployment: {}
				+// ---
				 service: {
				     alertmanager: {
				         apiVersion: "v1"
				@@ -1582,6 +1589,8 @@
				             name: "alertmanager"
				             labels: {
				                 app: "alertmanager"
				+                domain:    "prod"
				+                component: "mon"
				             }
				         }
				         spec: {
				@@ -1593,7 +1602,36 @@
				             }]
				             selector: {
				                 app: "alertmanager"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+    }
				             }
				+configMap: {
				+    alertmanager: {
				+        apiVersion: "v1"
				+        kind:       "ConfigMap"
				+        metadata: {
				+            name: "alertmanager"
				+        }
				+        data: {
				+            "alerts.yaml": """
				+                receivers:
				+                  - name: pager
				+                    slack_configs:
				+                      - channel: '#cloudmon'
				+                        text: |-
				+                          {{ range .Alerts }}{{ .Annotations.description }}
				+                          {{ end }}
				+                        send_resolved: true
				+                route:
				+                  receiver: pager
				+                  group_by:
				+                    - alertname
				+                    - cluster
				+
				+                """
				         }
				     }
				 }
				@@ -1616,6 +1654,8 @@
				                     name: "alertmanager"
				                     labels: {
				                         app: "alertmanager"
				+                        domain:    "prod"
				+                        component: "mon"
				                     }
				                 }
				                 spec: {
				@@ -1650,6 +1690,33 @@
				     }
				 }
				 // ---
				+service: {
				+    grafana: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "grafana"
				+            labels: {
				+                app:       "grafana"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+        spec: {
				+            ports: [{
				+                name:       "grafana"
				+                port:       3000
				+                protocol:   "TCP"
				+                targetPort: 3000
				+            }]
				+            selector: {
				+                app:       "grafana"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+    }
				+}
				 deployment: {
				     grafana: {
				         apiVersion: "apps/v1"
				@@ -1667,6 +1734,7 @@
				                 metadata: {
				                     labels: {
				                         app:       "grafana"
				+                        domain:    "prod"
				                         component: "mon"
				                     }
				                 }
				@@ -1714,31 +1782,6 @@
				         }
				     }
				 }
				-service: {
				-    grafana: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "grafana"
				-            labels: {
				-                app:       "grafana"
				-                component: "mon"
				-            }
				-        }
				-        spec: {
				-            ports: [{
				-                name:       "grafana"
				-                port:       3000
				-                protocol:   "TCP"
				-                targetPort: 3000
				-            }]
				-            selector: {
				-                app:       "grafana"
				-                component: "mon"
				-            }
				-        }
				-    }
				-}
				 // ---
				 service: {
				     "node-exporter": {
				@@ -1751,6 +1794,8 @@
				             name: "node-exporter"
				             labels: {
				                 app: "node-exporter"
				+                domain:    "prod"
				+                component: "mon"
				             }
				         }
				         spec: {
				@@ -1763,10 +1808,13 @@
				             }]
				             selector: {
				                 app: "node-exporter"
				+                domain:    "prod"
				+                component: "mon"
				             }
				         }
				     }
				 }
				+deployment: {}
				 daemonSet: {
				     "node-exporter": {
				         apiVersion: "apps/v1"
				@@ -1831,6 +1879,37 @@
				     }
				 }
				 // ---
				+service: {
				+    prometheus: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            annotations: {
				+                "prometheus.io/scrape": "true"
				+            }
				+            name: "prometheus"
				+            labels: {
				+                app:       "prometheus"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+        spec: {
				+            type: "NodePort"
				+            ports: [{
				+                name:     "main"
				+                port:     9090
				+                protocol: "TCP"
				+                nodePort: 30900
				+            }]
				+            selector: {
				+                app:       "prometheus"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+    }
				+}
				 configMap: {
				     prometheus: {
				         apiVersion: "v1"
				@@ -2066,33 +2145,6 @@
				         }
				     }
				 }
				-service: {
				-    prometheus: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            annotations: {
				-                "prometheus.io/scrape": "true"
				-            }
				-            name: "prometheus"
				-            labels: {
				-                app: "prometheus"
				-            }
				-        }
				-        spec: {
				-            type: "NodePort"
				-            ports: [{
				-                name:     "main"
				-                port:     9090
				-                protocol: "TCP"
				-                nodePort: 30900
				-            }]
				-            selector: {
				-                app: "prometheus"
				-            }
				-        }
				-    }
				-}
				 deployment: {
				     prometheus: {
				         apiVersion: "apps/v1"
				@@ -2119,6 +2171,8 @@
				                     name: "prometheus"
				                     labels: {
				                         app: "prometheus"
				+                        domain:    "prod"
				+                        component: "mon"
				                     }
				                     annotations: {
				                         "prometheus.io.scrape": "true"
				@@ -2150,6 +2204,77 @@
				     }
				 }
				 // ---
				+service: {}
				+deployment: {}
				+// ---
				+service: {
				+    authproxy: {
				+        apiVersion: "v1"
				+        kind:       "Service"
				+        metadata: {
				+            name: "authproxy"
				+            labels: {
				+                app:       "authproxy"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        spec: {
				+            ports: [{
				+                port:       4180
				+                protocol:   "TCP"
				+                targetPort: 4180
				+                name:       "client"
				+            }]
				+            selector: {
				+                app:       "authproxy"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+    }
				+}
				+deployment: {
				+    authproxy: {
				+        apiVersion: "apps/v1"
				+        kind:       "Deployment"
				+        metadata: {
				+            name: "authproxy"
				+        }
				+        spec: {
				+            replicas: 1
				+            template: {
				+                metadata: {
				+                    labels: {
				+                        app:       "authproxy"
				+                        domain:    "prod"
				+                        component: "proxy"
				+                    }
				+                }
				+                spec: {
				+                    containers: [{
				+                        image: "skippy/oauth2_proxy:2.0.1"
				+                        ports: [{
				+                            containerPort: 4180
				+                        }]
				+                        args: ["--config=/etc/authproxy/authproxy.cfg"]
				+                        name: "authproxy"
				+                        volumeMounts: [{
				+                            name:      "config-volume"
				+                            mountPath: "/etc/authproxy"
				+                        }]
				+                    }]
				+                    volumes: [{
				+                        name: "config-volume"
				+                        configMap: {
				+                            name: "authproxy"
				+                        }
				+                    }]
				+                }
				+            }
				+        }
				+    }
				+}
				 configMap: {
				     authproxy: {
				         apiVersion: "v1"
				@@ -2214,71 +2339,36 @@
				         }
				     }
				 }
				-deployment: {
				-    authproxy: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				-        metadata: {
				-            name: "authproxy"
				-        }
				-        spec: {
				-            replicas: 1
				-            template: {
				-                metadata: {
				-                    labels: {
				-                        app:    "authproxy"
				-                        domain: "prod"
				-                    }
				-                }
				-                spec: {
				-                    containers: [{
				-                        image: "skippy/oauth2_proxy:2.0.1"
				-                        ports: [{
				-                            containerPort: 4180
				-                        }]
				-                        args: ["--config=/etc/authproxy/authproxy.cfg"]
				-                        name: "authproxy"
				-                        volumeMounts: [{
				-                            name:      "config-volume"
				-                            mountPath: "/etc/authproxy"
				-                        }]
				-                    }]
				-                    volumes: [{
				-                        name: "config-volume"
				-                        configMap: {
				-                            name: "authproxy"
				-                        }
				-                    }]
				-                }
				-            }
				-        }
				-    }
				-}
				+// ---
				 service: {
				-    authproxy: {
				+    goget: {
				         apiVersion: "v1"
				         kind:       "Service"
				         metadata: {
				-            name: "authproxy"
				+            name: "goget"
				             labels: {
				-                app:    "authproxy"
				+                app:       "goget"
				                 domain: "prod"
				+                component: "proxy"
				             }
				         }
				         spec: {
				+            type:           "LoadBalancer"
				+            loadBalancerIP: "1.3.5.7"
				             ports: [{
				-                port:       4180
				+                port:       443
				+                targetPort: 7443
				                 protocol:   "TCP"
				-                targetPort: 4180
				-                name:       "client"
				+                name:       "https"
				             }]
				             selector: {
				-                app: "authproxy"
				+                app:       "goget"
				+                domain:    "prod"
				+                component: "proxy"
				             }
				         }
				     }
				 }
				-// ---
				 deployment: {
				     goget: {
				         apiVersion: "apps/v1"
				@@ -2292,6 +2382,7 @@
				                 metadata: {
				                     labels: {
				                         app:       "goget"
				+                        domain:    "prod"
				                         component: "proxy"
				                     }
				                 }
				@@ -2318,33 +2409,91 @@
				         }
				     }
				 }
				+// ---
				 service: {
				-    goget: {
				+    nginx: {
				         apiVersion: "v1"
				         kind:       "Service"
				         metadata: {
				-            name: "goget"
				+            name: "nginx"
				             labels: {
				-                app:       "goget"
				+                app:       "nginx"
				+                domain:    "prod"
				                 component: "proxy"
				             }
				         }
				         spec: {
				             type:           "LoadBalancer"
				-            loadBalancerIP: "1.3.5.7"
				+            loadBalancerIP: "1.3.4.5"
				             ports: [{
				+                port:       80
				+                targetPort: 80
				+                protocol:   "TCP"
				+                name:       "http"
				+            }, {
				                 port:       443
				-                targetPort: 7443
				                 protocol:   "TCP"
				                 name:       "https"
				             }]
				             selector: {
				-                app: "goget"
				+                app:       "nginx"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+    }
				+}
				+deployment: {
				+    nginx: {
				+        apiVersion: "apps/v1"
				+        kind:       "Deployment"
				+        metadata: {
				+            name: "nginx"
				+        }
				+        spec: {
				+            replicas: 1
				+            template: {
				+                metadata: {
				+                    labels: {
				+                        app:       "nginx"
				+                        domain:    "prod"
				+                        component: "proxy"
				+                    }
				+                }
				+                spec: {
				+                    volumes: [{
				+                        name: "secret-volume"
				+                        secret: {
				+                            secretName: "proxy-secrets"
				+                        }
				+                    }, {
				+                        name: "config-volume"
				+                        configMap: {
				+                            name: "nginx"
				+                        }
				+                    }]
				+                    containers: [{
				+                        image: "nginx:1.11.10-alpine"
				+                        ports: [{
				+                            containerPort: 80
				+                        }, {
				+                            containerPort: 443
				+                        }]
				+                        name: "nginx"
				+                        volumeMounts: [{
				+                            mountPath: "/etc/ssl"
				+                            name:      "secret-volume"
				+                        }, {
				+                            name:      "config-volume"
				+                            mountPath: "/etc/nginx/nginx.conf"
				+                            subPath:   "nginx.conf"
				+                        }]
				+                    }]
				+                }
				             }
				         }
				     }
				 }
				-// ---
				 configMap: {
				     nginx: {
				         apiVersion: "v1"
				@@ -2510,83 +2659,3 @@
				         }
				     }
				 }
				-deployment: {
				-    nginx: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				-        metadata: {
				-            name: "nginx"
				-        }
				-        spec: {
				-            replicas: 1
				-            template: {
				-                metadata: {
				-                    labels: {
				-                        app:       "nginx"
				-                        component: "proxy"
				-                    }
				-                }
				-                spec: {
				-                    volumes: [{
				-                        name: "secret-volume"
				-                        secret: {
				-                            secretName: "proxy-secrets"
				-                        }
				-                    }, {
				-                        name: "config-volume"
				-                        configMap: {
				-                            name: "nginx"
				-                        }
				-                    }]
				-                    containers: [{
				-                        image: "nginx:1.11.10-alpine"
				-                        ports: [{
				-                            containerPort: 80
				-                        }, {
				-                            containerPort: 443
				-                        }]
				-                        name: "nginx"
				-                        volumeMounts: [{
				-                            mountPath: "/etc/ssl"
				-                            name:      "secret-volume"
				-                        }, {
				-                            name:      "config-volume"
				-                            mountPath: "/etc/nginx/nginx.conf"
				-                            subPath:   "nginx.conf"
				-                        }]
				-                    }]
				-                }
				-            }
				-        }
				-    }
				-}
				-service: {
				-    nginx: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "nginx"
				-            labels: {
				-                app:       "nginx"
				-                component: "proxy"
				-            }
				-        }
				-        spec: {
				-            type:           "LoadBalancer"
				-            loadBalancerIP: "1.3.4.5"
				-            ports: [{
				-                port:       80
				-                targetPort: 80
				-                protocol:   "TCP"
				-                name:       "http"
				-            }, {
				-                port:     443
				-                protocol: "TCP"
				-                name:     "https"
				-            }]
				-            selector: {
				-                app: "nginx"
				-            }
				-        }
				-    }
				-}

				"""#
		}]
	}
	resettosnapshot2: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "resettosnapshot2"
		Order:           20
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cp snapshot2 snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	trim1: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "trim1"
		Order:           21
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				 1887 total

				"""
			ComparisonOutput: """
				 1887 total

				"""
		}, {
			Negated:          false
			CmdStr:           "cue trim ./..."
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				 1312 total

				"""
			ComparisonOutput: """
				 1312 total

				"""
		}]
	}
	snapshot3: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "snapshot3"
		Order:           22
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "diff -wu snapshot snapshot2 | wc -l"
			ExitCode: 0
			Output: """
				0

				"""
			ComparisonOutput: """
				0

				"""
		}]
	}
	daemonstatefuldeployment: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "daemonstatefuldeployment"
		Order:           23
		Terminal:        "term1"
		Stmts: [{
			Negated: false
			CmdStr: """
				cat <<EOF >>kube.cue

				daemonSet: [ID=_]: _spec & {
				\t apiVersion: "apps/v1"
				\t kind:       "DaemonSet"
				\t _name:      ID
				}

				statefulSet: [ID=_]: _spec & {
				\t apiVersion: "apps/v1"
				\t kind:       "StatefulSet"
				\t _name:      ID
				}

				deployment: [ID=_]: _spec & {
				\t apiVersion: "apps/v1"
				\t kind:       "Deployment"
				\t _name:      ID
				\t spec: replicas: *1 | int
				}

				configMap: [ID=_]: {
				\t metadata: name: ID
				\t metadata: labels: component: #Component
				}

				_spec: {
				\t _name: string

				\t metadata: name: _name
				\t metadata: labels: component: #Component
				\t spec: selector: {}
				\t spec: template: {
				\t\t  metadata: labels: {
				\t\t\t\tapp:       _name
				\t\t\t\tcomponent: #Component
				\t\t\t\tdomain:    "prod"
				\t\t  }
				\t\t  spec: containers: [{name: _name}]
				\t }
				}
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue fmt"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	daemonstatefulservice: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "daemonstatefulservice"
		Order:           24
		Terminal:        "term1"
		Stmts: [{
			Negated: false
			CmdStr: """
				cat <<EOF >>kube.cue

				// Define the _export option and set the default to true
				// for all ports defined in all containers.
				_spec: spec: template: spec: containers: [...{
				\t ports: [...{
				\t\t  _export: *true | false // include the port in the service
				\t }]
				}]

				for x in [deployment, daemonSet, statefulSet] for k, v in x {
				\t service: "\\(k)": {
				\t\t  spec: selector: v.spec.template.metadata.labels

				\t\t  spec: ports: [
				\t\t\t\tfor c in v.spec.template.spec.containers
				\t\t\t\tfor p in c.ports
				\t\t\t\tif p._export {
				\t\t\t\t\t let Port = p.containerPort // Port is an alias
				\t\t\t\t\t port:       *Port | int
				\t\t\t\t\t targetPort: *Port | int
				\t\t\t\t}
				\t\t  ]
				\t }
				}
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue fmt"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	quickpatches: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "quickpatches"
		Order:           25
		Terminal:        "term1"
		Stmts: [{
			Negated: false
			CmdStr: """
				cat <<EOF >>infra/events/kube.cue

				deployment: events: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated: false
			CmdStr: """
				cat <<EOF >>infra/tasks/kube.cue

				deployment: tasks: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated: false
			CmdStr: """
				cat <<EOF >>infra/watcher/kube.cue

				deployment: watcher: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	trim2: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "trim2"
		Order:           26
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue trim ./..."
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				 1242 total

				"""
			ComparisonOutput: """
				 1242 total

				"""
		}]
	}
	simplify: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "simplify"
		Order:           27
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "head frontend/breaddispatcher/kube.cue"
			ExitCode: 0
			Output: """
				package kube

				deployment: breaddispatcher: {
				\tspec: {
				\t\ttemplate: {
				\t\t\tmetadata: {
				\t\t\t\tannotations: {
				\t\t\t\t\t"prometheus.io.scrape": "true"
				\t\t\t\t\t"prometheus.io.port":   "7080"
				\t\t\t\t}

				"""
			ComparisonOutput: """
				package kube

				deployment: breaddispatcher: {
				\tspec: {
				\t\ttemplate: {
				\t\t\tmetadata: {
				\t\t\t\tannotations: {
				\t\t\t\t\t"prometheus.io.scrape": "true"
				\t\t\t\t\t"prometheus.io.port":   "7080"
				\t\t\t\t}

				"""
		}, {
			Negated:          false
			CmdStr:           "cue trim ./... -s"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "head -7 frontend/breaddispatcher/kube.cue"
			ExitCode: 0
			Output: """
				package kube

				deployment: breaddispatcher: spec: template: {
				\tmetadata: annotations: {
				\t\t"prometheus.io.scrape": "true"
				\t\t"prometheus.io.port":   "7080"
				\t}

				"""
			ComparisonOutput: """
				package kube

				deployment: breaddispatcher: spec: template: {
				\tmetadata: annotations: {
				\t\t"prometheus.io.scrape": "true"
				\t\t"prometheus.io.port":   "7080"
				\t}

				"""
		}, {
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				 1090 total

				"""
			ComparisonOutput: """
				 1090 total

				"""
		}]
	}
	snapshotpostsimplify: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "snapshotpostsimplify"
		Order:           28
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cp snapshot2 snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	frontendtweaks: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "frontendtweaks"
		Order:           29
		Terminal:        "term1"
		Stmts: [{
			Negated: false
			CmdStr: """
				cat <<EOF >>frontend/kube.cue

				deployment: [string]: spec: template: {
				\t metadata: annotations: {
				\t\t  "prometheus.io.scrape": "true"
				\t\t  "prometheus.io.port":   "\\(spec.containers[0].ports[0].containerPort)"
				\t }
				\t spec: containers: [{
				\t\t  ports: [{containerPort: *7080 | int}] // 7080 is the default
				\t }]
				}
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue fmt ./frontend"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  true
			CmdStr:   "diff -wu snapshot snapshot2"
			ExitCode: 1
			Output: """
				--- snapshot\t2022-02-22 17:04:43.112163848 +0000
				+++ snapshot2\t2022-02-22 17:04:44.108119140 +0000
				@@ -188,6 +188,7 @@
				                 metadata: {
				                     annotations: {
				                         "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "7080"
				                     }
				                     labels: {
				                         app:       "host"
				@@ -327,6 +328,7 @@
				                 metadata: {
				                     annotations: {
				                         "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "8080"
				                     }
				                     labels: {
				                         app:       "valeter"

				"""
			ComparisonOutput: """
				--- snapshot\t2022-02-22 17:04:43.112163848 +0000
				+++ snapshot2\t2022-02-22 17:04:44.108119140 +0000
				@@ -188,6 +188,7 @@
				                 metadata: {
				                     annotations: {
				                         "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "7080"
				                     }
				                     labels: {
				                         app:       "host"
				@@ -327,6 +328,7 @@
				                 metadata: {
				                     annotations: {
				                         "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "8080"
				                     }
				                     labels: {
				                         app:       "valeter"

				"""
		}, {
			Negated:          false
			CmdStr:           "cp snapshot2 snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	simplifyfrontend: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "simplifyfrontend"
		Order:           30
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue trim ./frontend/... -s"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				 1046 total

				"""
			ComparisonOutput: """
				 1046 total

				"""
		}]
	}
	snapshotpostfrontendsimplify: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "snapshotpostfrontendsimplify"
		Order:           31
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cp snapshot2 snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	kitchenpart1: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "kitchenpart1"
		Order:           32
		Terminal:        "term1"
		Stmts: [{
			Negated: false
			CmdStr: """
				cat <<EOF >>kitchen/kube.cue

				deployment: [string]: spec: template: {
				\t metadata: annotations: "prometheus.io.scrape": "true"
				\t spec: containers: [{
				\t\t  ports: [{
				\t\t\t\tcontainerPort: 8080
				\t\t  }]
				\t\t  livenessProbe: {
				\t\t\t\thttpGet: {
				\t\t\t\t\t path: "/debug/health"
				\t\t\t\t\t port: 8080
				\t\t\t\t}
				\t\t\t\tinitialDelaySeconds: 40
				\t\t\t\tperiodSeconds:       3
				\t\t  }
				\t }]
				}
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue fmt ./kitchen"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	kitchenpart2: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "kitchenpart2"
		Order:           33
		Terminal:        "term1"
		Stmts: [{
			Negated: false
			CmdStr: """
				cat <<EOF >>kitchen/kube.cue

				deployment: [ID=_]: spec: template: spec: {
				\t _hasDisks: *true | bool

				\t // field comprehension using just "if"
				\t if _hasDisks {
				\t\t  volumes: [{
				\t\t\t\tname: *"\\(ID)-disk" | string
				\t\t\t\tgcePersistentDisk: pdName: *"\\(ID)-disk" | string
				\t\t\t\tgcePersistentDisk: fsType: "ext4"
				\t\t  }, {
				\t\t\t\tname: *"secret-\\(ID)" | string
				\t\t\t\tsecret: secretName: *"\\(ID)-secrets" | string
				\t\t  }, ...]

				\t\t  containers: [{
				\t\t\t\tvolumeMounts: [{
				\t\t\t\t\t name:      *"\\(ID)-disk" | string
				\t\t\t\t\t mountPath: *"/logs" | string
				\t\t\t\t}, {
				\t\t\t\t\t mountPath: *"/etc/certs" | string
				\t\t\t\t\t name:      *"secret-\\(ID)" | string
				\t\t\t\t\t readOnly:  true
				\t\t\t\t}, ...]
				\t\t  }]
				\t }
				}
				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated: false
			CmdStr: """
				cat <<EOF >>kitchen/souschef/kube.cue

				deployment: souschef: spec: template: spec: {
				\t _hasDisks: false
				}

				EOF
				"""
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue fmt ./kitchen/..."
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	kitchencheck: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "kitchencheck"
		Order:           34
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue trim -s ./kitchen/..."
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  true
			CmdStr:   "diff -wu snapshot snapshot2"
			ExitCode: 1
			Output: """
				--- snapshot\t2022-02-22 17:04:45.504056477 +0000
				+++ snapshot2\t2022-02-22 17:04:47.283976577 +0000
				@@ -1091,14 +1091,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "caller"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1132,11 +1132,11 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				+                        name: "caller"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-key=/etc/certs/client.key", "-cert=/etc/certs/client.pem", "-ca=/etc/certs/servfx.ca", "-ssh-tunnel-key=/sslcerts/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "caller"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1197,14 +1197,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "dishwasher"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1238,11 +1238,11 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				+                        name: "dishwasher"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "dishwasher"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1303,14 +1303,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "expiditer"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1327,6 +1327,10 @@
				                     }]
				                     containers: [{
				                         image: "gcr.io/myproj/expiditer:v0.5.34"
				+                        name:  "expiditer"
				+                        ports: [{
				+                            containerPort: 8080
				+                        }]
				                         volumeMounts: [{
				                             name:      "expiditer-disk"
				                             mountPath: "/logs"
				@@ -1335,11 +1339,7 @@
				                             name:      "secret-expiditer"
				                             readOnly:  true
				                         }]
				-                        ports: [{
				-                            containerPort: 8080
				-                        }]
				                         args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "expiditer"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1400,14 +1400,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "headchef"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1432,11 +1432,11 @@
				                             name:      "secret-headchef"
				                             readOnly:  true
				                         }]
				+                        name: "headchef"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "headchef"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1497,14 +1497,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "linecook"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1529,11 +1529,11 @@
				                             name:      "secret-kitchen"
				                             readOnly:  true
				                         }]
				+                        name: "linecook"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-name=linecook", "-env=prod", "-logdir=/logs", "-event-server=events:7788", "-etcd", "etcd:2379", "-reconnect-delay", "1h", "-recovery-overlap", "100000"]
				-                        name: "linecook"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1594,14 +1594,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "pastrychef"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1626,11 +1626,11 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				+                        name: "pastrychef"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788", "-reconnect-delay=1m", "-etcd=etcd:2379", "-recovery-overlap=10000"]
				-                        name: "pastrychef"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1696,14 +1696,17 @@
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     containers: [{
				                         image: "gcr.io/myproj/souschef:v0.5.3"
				+                        name:  "souschef"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        name: "souschef"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"

				"""
			ComparisonOutput: """
				--- snapshot\t2022-02-22 17:04:45.504056477 +0000
				+++ snapshot2\t2022-02-22 17:04:47.283976577 +0000
				@@ -1091,14 +1091,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "caller"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1132,11 +1132,11 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				+                        name: "caller"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-key=/etc/certs/client.key", "-cert=/etc/certs/client.pem", "-ca=/etc/certs/servfx.ca", "-ssh-tunnel-key=/sslcerts/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "caller"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1197,14 +1197,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "dishwasher"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1238,11 +1238,11 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				+                        name: "dishwasher"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "dishwasher"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1303,14 +1303,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "expiditer"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1327,6 +1327,10 @@
				                     }]
				                     containers: [{
				                         image: "gcr.io/myproj/expiditer:v0.5.34"
				+                        name:  "expiditer"
				+                        ports: [{
				+                            containerPort: 8080
				+                        }]
				                         volumeMounts: [{
				                             name:      "expiditer-disk"
				                             mountPath: "/logs"
				@@ -1335,11 +1339,7 @@
				                             name:      "secret-expiditer"
				                             readOnly:  true
				                         }]
				-                        ports: [{
				-                            containerPort: 8080
				-                        }]
				                         args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "expiditer"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1400,14 +1400,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "headchef"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1432,11 +1432,11 @@
				                             name:      "secret-headchef"
				                             readOnly:  true
				                         }]
				+                        name: "headchef"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-logdir=/logs", "-event-server=events:7788"]
				-                        name: "headchef"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1497,14 +1497,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "linecook"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1529,11 +1529,11 @@
				                             name:      "secret-kitchen"
				                             readOnly:  true
				                         }]
				+                        name: "linecook"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-name=linecook", "-env=prod", "-logdir=/logs", "-event-server=events:7788", "-etcd", "etcd:2379", "-reconnect-delay", "1h", "-recovery-overlap", "100000"]
				-                        name: "linecook"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1594,14 +1594,14 @@
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                    }
				                     labels: {
				                         app:       "pastrychef"
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -1626,11 +1626,11 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				+                        name: "pastrychef"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				                         args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788", "-reconnect-delay=1m", "-etcd=etcd:2379", "-recovery-overlap=10000"]
				-                        name: "pastrychef"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1696,14 +1696,17 @@
				                         domain:    "prod"
				                         component: "kitchen"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                    }
				                 }
				                 spec: {
				                     containers: [{
				                         image: "gcr.io/myproj/souschef:v0.5.3"
				+                        name:  "souschef"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        name: "souschef"
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"

				"""
		}, {
			Negated:          false
			CmdStr:           "cp snapshot2 snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				  925 total

				"""
			ComparisonOutput: """
				  925 total

				"""
		}]
	}
	kubetool: {
		StepType: 2
		Name:     "kubetool"
		Order:    35
		Terminal: "term1"
		Language: "cue"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package kube

			objects: [ for v in objectSets for x in v {x}]

			objectSets: [
			\tservice,
			\tdeployment,
			\tstatefulSet,
			\tdaemonSet,
			\tconfigMap,
			]

			"""
		Target: "/workdir/services/kube_tool.cue"
	}
	lstool: {
		StepType: 2
		Name:     "lstool"
		Order:    36
		Terminal: "term1"
		Language: "cue"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package kube

			import (
			\t"text/tabwriter"
			\t"tool/cli"
			\t"tool/file"
			)

			command: ls: {
			\ttask: print: cli.Print & {
			\t\ttext: tabwriter.Write([
			\t\t\tfor x in objects {
			\t\t\t\t"\\(x.kind)  \\t\\(x.metadata.labels.component)  \\t\\(x.metadata.name)"
			\t\t\t},
			\t\t])
			\t}

			\ttask: write: file.Create & {
			\t\tfilename: "foo.txt"
			\t\tcontents: task.print.text
			\t}
			}

			"""
		Target: "/workdir/services/ls_tool.cue"
	}
	cuecmdlsmaitred: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cuecmdlsmaitred"
		Order:           37
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cue cmd ls ./frontend/maitred"
			ExitCode: 0
			Output: """
				Service      frontend   maitred
				Deployment   frontend   maitred


				"""
			ComparisonOutput: """
				Service      frontend   maitred
				Deployment   frontend   maitred


				"""
		}]
	}
	cuelsmaitred: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cuelsmaitred"
		Order:           38
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cue ls ./frontend/maitred"
			ExitCode: 0
			Output: """
				Service      frontend   maitred
				Deployment   frontend   maitred


				"""
			ComparisonOutput: """
				Service      frontend   maitred
				Deployment   frontend   maitred


				"""
		}]
	}
	cuelsall: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cuelsall"
		Order:           39
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cue ls ./..."
			ExitCode: 0
			Output: """
				Service       frontend   bartender
				Service       frontend   breaddispatcher
				Service       frontend   host
				Service       frontend   maitred
				Service       frontend   valeter
				Service       frontend   waiter
				Service       frontend   waterdispatcher
				Service       infra      download
				Service       infra      etcd
				Service       infra      events
				Service       infra      tasks
				Service       infra      updater
				Service       infra      watcher
				Service       kitchen    caller
				Service       kitchen    dishwasher
				Service       kitchen    expiditer
				Service       kitchen    headchef
				Service       kitchen    linecook
				Service       kitchen    pastrychef
				Service       kitchen    souschef
				Service       mon        alertmanager
				Service       mon        grafana
				Service       mon        node-exporter
				Service       mon        prometheus
				Service       proxy      authproxy
				Service       proxy      goget
				Service       proxy      nginx
				Deployment    frontend   bartender
				Deployment    frontend   breaddispatcher
				Deployment    frontend   host
				Deployment    frontend   maitred
				Deployment    frontend   valeter
				Deployment    frontend   waiter
				Deployment    frontend   waterdispatcher
				Deployment    infra      download
				Deployment    infra      events
				Deployment    infra      tasks
				Deployment    infra      updater
				Deployment    infra      watcher
				Deployment    kitchen    caller
				Deployment    kitchen    dishwasher
				Deployment    kitchen    expiditer
				Deployment    kitchen    headchef
				Deployment    kitchen    linecook
				Deployment    kitchen    pastrychef
				Deployment    kitchen    souschef
				Deployment    mon        alertmanager
				Deployment    mon        grafana
				Deployment    mon        prometheus
				Deployment    proxy      authproxy
				Deployment    proxy      goget
				Deployment    proxy      nginx
				StatefulSet   infra      etcd
				DaemonSet     mon        node-exporter
				ConfigMap     mon        alertmanager
				ConfigMap     mon        prometheus
				ConfigMap     proxy      authproxy
				ConfigMap     proxy      nginx


				"""
			ComparisonOutput: """
				Service       frontend   bartender
				Service       frontend   breaddispatcher
				Service       frontend   host
				Service       frontend   maitred
				Service       frontend   valeter
				Service       frontend   waiter
				Service       frontend   waterdispatcher
				Service       infra      download
				Service       infra      etcd
				Service       infra      events
				Service       infra      tasks
				Service       infra      updater
				Service       infra      watcher
				Service       kitchen    caller
				Service       kitchen    dishwasher
				Service       kitchen    expiditer
				Service       kitchen    headchef
				Service       kitchen    linecook
				Service       kitchen    pastrychef
				Service       kitchen    souschef
				Service       mon        alertmanager
				Service       mon        grafana
				Service       mon        node-exporter
				Service       mon        prometheus
				Service       proxy      authproxy
				Service       proxy      goget
				Service       proxy      nginx
				Deployment    frontend   bartender
				Deployment    frontend   breaddispatcher
				Deployment    frontend   host
				Deployment    frontend   maitred
				Deployment    frontend   valeter
				Deployment    frontend   waiter
				Deployment    frontend   waterdispatcher
				Deployment    infra      download
				Deployment    infra      events
				Deployment    infra      tasks
				Deployment    infra      updater
				Deployment    infra      watcher
				Deployment    kitchen    caller
				Deployment    kitchen    dishwasher
				Deployment    kitchen    expiditer
				Deployment    kitchen    headchef
				Deployment    kitchen    linecook
				Deployment    kitchen    pastrychef
				Deployment    kitchen    souschef
				Deployment    mon        alertmanager
				Deployment    mon        grafana
				Deployment    mon        prometheus
				Deployment    proxy      authproxy
				Deployment    proxy      goget
				Deployment    proxy      nginx
				StatefulSet   infra      etcd
				DaemonSet     mon        node-exporter
				ConfigMap     mon        alertmanager
				ConfigMap     mon        prometheus
				ConfigMap     proxy      authproxy
				ConfigMap     proxy      nginx


				"""
		}]
	}
	dumptool: {
		StepType: 2
		Name:     "dumptool"
		Order:    40
		Terminal: "term1"
		Language: "cue"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package kube

			import (
			\t"encoding/yaml"
			\t"tool/cli"
			)

			command: dump: {
			\ttask: print: cli.Print & {
			\t\ttext: yaml.MarshalStream(objects)
			\t}
			}

			"""
		Target: "/workdir/services/dump_tool.cue"
	}
	createtool: {
		StepType: 2
		Name:     "createtool"
		Order:    41
		Terminal: "term1"
		Language: "cue"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package kube

			import (
			\t"encoding/yaml"
			\t"tool/exec"
			\t"tool/cli"
			)

			command: create: {
			\ttask: kube: exec.Run & {
			\t\tcmd:    "kubectl create --dry-run=client -f -"
			\t\tstdin:  yaml.MarshalStream(objects)
			\t\tstdout: string
			\t}

			\ttask: display: cli.Print & {
			\t\ttext: task.kube.stdout
			\t}
			}

			"""
		Target: "/workdir/services/create_tool.cue"
	}
	createall: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "createall"
		Order:           42
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "cue create ./frontend/..."
			ExitCode: 0
			Output: """
				service/bartender created (dry run)
				service/breaddispatcher created (dry run)
				service/host created (dry run)
				service/maitred created (dry run)
				service/valeter created (dry run)
				service/waiter created (dry run)
				service/waterdispatcher created (dry run)
				deployment.apps/bartender created (dry run)
				deployment.apps/breaddispatcher created (dry run)
				deployment.apps/host created (dry run)
				deployment.apps/maitred created (dry run)
				deployment.apps/valeter created (dry run)
				deployment.apps/waiter created (dry run)
				deployment.apps/waterdispatcher created (dry run)


				"""
			ComparisonOutput: """
				service/bartender created (dry run)
				service/breaddispatcher created (dry run)
				service/host created (dry run)
				service/maitred created (dry run)
				service/valeter created (dry run)
				service/waiter created (dry run)
				service/waterdispatcher created (dry run)
				deployment.apps/bartender created (dry run)
				deployment.apps/breaddispatcher created (dry run)
				deployment.apps/host created (dry run)
				deployment.apps/maitred created (dry run)
				deployment.apps/valeter created (dry run)
				deployment.apps/waiter created (dry run)
				deployment.apps/waterdispatcher created (dry run)


				"""
		}]
	}
	allgoget: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "allgoget"
		Order:           43
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go get k8s.io/api/apps/v1@v0.23.4"
			ExitCode: 0
			Output: """
				go get: added github.com/go-logr/logr v1.2.0
				go get: added github.com/gogo/protobuf v1.3.2
				go get: added github.com/google/go-cmp v0.5.5
				go get: added github.com/google/gofuzz v1.1.0
				go get: added github.com/json-iterator/go v1.1.12
				go get: added github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
				go get: added github.com/modern-go/reflect2 v1.0.2
				go get: added golang.org/x/net v0.0.0-20211209124913-491a49abca63
				go get: added golang.org/x/text v0.3.7
				go get: added gopkg.in/inf.v0 v0.9.1
				go get: added gopkg.in/yaml.v2 v2.4.0
				go get: added k8s.io/api v0.23.4
				go get: added k8s.io/apimachinery v0.23.4
				go get: added k8s.io/klog/v2 v2.30.0
				go get: added k8s.io/utils v0.0.0-20211116205334-6203023598ed
				go get: added sigs.k8s.io/json v0.0.0-20211020170558-c049b76a60c6
				go get: added sigs.k8s.io/structured-merge-diff/v4 v4.2.1

				"""
			ComparisonOutput: """

				go get: added github.com/go-logr/logr v1.2.0
				go get: added github.com/gogo/protobuf v1.3.2
				go get: added github.com/google/go-cmp v0.5.5
				go get: added github.com/google/gofuzz v1.1.0
				go get: added github.com/json-iterator/go v1.1.12
				go get: added github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
				go get: added github.com/modern-go/reflect2 v1.0.2
				go get: added golang.org/x/net v0.0.0-20211209124913-491a49abca63
				go get: added golang.org/x/text v0.3.7
				go get: added gopkg.in/inf.v0 v0.9.1
				go get: added gopkg.in/yaml.v2 v2.4.0
				go get: added k8s.io/api v0.23.4
				go get: added k8s.io/apimachinery v0.23.4
				go get: added k8s.io/klog/v2 v2.30.0
				go get: added k8s.io/utils v0.0.0-20211116205334-6203023598ed
				go get: added sigs.k8s.io/json v0.0.0-20211020170558-c049b76a60c6
				go get: added sigs.k8s.io/structured-merge-diff/v4 v4.2.1
				"""
		}, {
			Negated:          false
			CmdStr:           "cue get go k8s.io/api/apps/v1"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	k8sdefs: {
		StepType: 2
		Name:     "k8sdefs"
		Order:    44
		Terminal: "term1"
		Language: "cue"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package kube

			import (
			\t"k8s.io/api/core/v1"
			\tapps_v1 "k8s.io/api/apps/v1"
			)

			service: [string]:     v1.#Service
			deployment: [string]:  apps_v1.#Deployment
			daemonSet: [string]:   apps_v1.#DaemonSet
			statefulSet: [string]: apps_v1.#StatefulSet

			"""
		Target: "/workdir/services/k8s_defs.cue"
	}
	cuefmtpostk8sdefs: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "cuefmtpostk8sdefs"
		Order:           45
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue fmt"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	postk8sdefscheck: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "postk8sdefscheck"
		Order:           46
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "cue trim -s ./"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cue eval -c ./... >snapshot2"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  true
			CmdStr:   "diff -wu snapshot snapshot2"
			ExitCode: 1
			Output: """
				--- snapshot\t2022-02-22 17:04:47.287976398 +0000
				+++ snapshot2\t2022-02-22 17:05:01.079357311 +0000
				@@ -12,21 +12,11 @@
				 // ---
				 service: {
				     bartender: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "bartender"
				-            labels: {
				-                app:       "bartender"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -35,12 +25,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "bartender"
				+            labels: {
				+                app:       "bartender"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     bartender: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -58,12 +56,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/bartender:v0.1.34"
				                         name:  "bartender"
				+                        image: "gcr.io/myproj/bartender:v0.1.34"
				+                        args: []
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: []
				                     }]
				                 }
				             }
				@@ -74,6 +72,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -82,21 +82,11 @@
				 // ---
				 service: {
				     breaddispatcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "breaddispatcher"
				-            labels: {
				-                app:       "breaddispatcher"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -105,12 +95,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "breaddispatcher"
				+            labels: {
				+                app:       "breaddispatcher"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     breaddispatcher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -128,12 +126,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/breaddispatcher:v0.3.24"
				                         name:  "breaddispatcher"
				+                        image: "gcr.io/myproj/breaddispatcher:v0.3.24"
				+                        args: ["-etcd=etcd:2379", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: ["-etcd=etcd:2379", "-event-server=events:7788"]
				                     }]
				                 }
				             }
				@@ -144,6 +142,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -152,21 +152,11 @@
				 // ---
				 service: {
				     host: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "host"
				-            labels: {
				-                app:       "host"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -175,12 +165,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "host"
				+            labels: {
				+                app:       "host"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     host: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 2
				             selector: {}
				@@ -198,12 +196,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/host:v0.1.10"
				                         name:  "host"
				+                        image: "gcr.io/myproj/host:v0.1.10"
				+                        args: []
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: []
				                     }]
				                 }
				             }
				@@ -214,6 +212,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -222,21 +222,11 @@
				 // ---
				 service: {
				     maitred: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "maitred"
				-            labels: {
				-                app:       "maitred"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -245,12 +235,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "maitred"
				+            labels: {
				+                app:       "maitred"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     maitred: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -268,12 +266,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/maitred:v0.0.4"
				                         name:  "maitred"
				+                        image: "gcr.io/myproj/maitred:v0.0.4"
				+                        args: []
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: []
				                     }]
				                 }
				             }
				@@ -284,6 +282,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -292,21 +292,11 @@
				 // ---
				 service: {
				     valeter: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "valeter"
				-            labels: {
				-                app:       "valeter"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				+                name:       "http"
				                 port:       8080
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 8080
				             }]
				             selector: {
				@@ -315,12 +305,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "valeter"
				+            labels: {
				+                app:       "valeter"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     valeter: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -338,11 +336,11 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "valeter"
				                         image: "gcr.io/myproj/valeter:v0.0.4"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        name: "valeter"
				                         args: ["-http=:8080", "-etcd=etcd:2379"]
				                     }]
				                 }
				@@ -354,6 +352,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -362,21 +362,11 @@
				 // ---
				 service: {
				     waiter: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "waiter"
				-            labels: {
				-                app:       "waiter"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -385,12 +375,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "waiter"
				+            labels: {
				+                app:       "waiter"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     waiter: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 5
				             selector: {}
				@@ -408,8 +406,8 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/waiter:v0.3.0"
				                         name:  "waiter"
				+                        image: "gcr.io/myproj/waiter:v0.3.0"
				                         ports: [{
				                             containerPort: 7080
				                         }]
				@@ -423,6 +421,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -431,21 +431,11 @@
				 // ---
				 service: {
				     waterdispatcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "waterdispatcher"
				-            labels: {
				-                app:       "waterdispatcher"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				+                name:       "http"
				                 port:       7080
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 7080
				             }]
				             selector: {
				@@ -454,12 +444,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "waterdispatcher"
				+            labels: {
				+                app:       "waterdispatcher"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     waterdispatcher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -477,12 +475,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/waterdispatcher:v0.0.48"
				                         name:  "waterdispatcher"
				+                        image: "gcr.io/myproj/waterdispatcher:v0.0.48"
				+                        args: ["-http=:8080", "-etcd=etcd:2379"]
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: ["-http=:8080", "-etcd=etcd:2379"]
				                     }]
				                 }
				             }
				@@ -493,6 +491,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -507,21 +507,11 @@
				 // ---
				 service: {
				     download: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "download"
				-            labels: {
				-                app:       "download"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -530,12 +520,20 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "download"
				+            labels: {
				+                app:       "download"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     download: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -549,8 +547,8 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/download:v0.0.2"
				                         name:  "download"
				+                        image: "gcr.io/myproj/download:v0.0.2"
				                         ports: [{
				                             containerPort: 7080
				                         }]
				@@ -564,6 +562,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -572,27 +572,17 @@
				 // ---
				 service: {
				     etcd: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "etcd"
				-            labels: {
				-                app:       "etcd"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             clusterIP: "None"
				             ports: [{
				                 port:       2379
				-                protocol:   "TCP"
				                 targetPort: 2379
				+                protocol:   "TCP"
				                 name:       "client"
				             }, {
				+                name:       "peer"
				                 port:       2380
				                 protocol:   "TCP"
				-                name:       "peer"
				                 targetPort: 2380
				             }]
				             selector: {
				@@ -601,28 +591,37 @@
				                 domain:    "prod"
				             }
				         }
				+        metadata: {
				+            name: "etcd"
				+            labels: {
				+                app:       "etcd"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {}
				 daemonSet: {}
				 statefulSet: {
				     etcd: {
				-        apiVersion: "apps/v1"
				-        kind:       "StatefulSet"
				         spec: {
				             serviceName: "etcd"
				             replicas:    3
				+            selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                        "prometheus.io.port":   "2379"
				-                    }
				                     labels: {
				                         app:       "etcd"
				                         component: "infra"
				                         domain:    "prod"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "2379"
				+                    }
				                 }
				                 spec: {
				                     affinity: {
				@@ -641,6 +640,7 @@
				                     }
				                     terminationGracePeriodSeconds: 10
				                     containers: [{
				+                        name:  "etcd"
				                         image: "quay.io/coreos/etcd:v3.3.10"
				                         ports: [{
				                             name:          "client"
				@@ -682,12 +682,10 @@
				                             }
				                         }]
				                         command: ["/usr/local/bin/etcd"]
				-                        name: "etcd"
				                         args: ["-name", "$(NAME)", "-data-dir", "/data/etcd3", "-initial-advertise-peer-urls", "http://$(IP):2380", "-listen-peer-urls", "http://$(IP):2380", "-listen-client-urls", "http://$(IP):2379,http://127.0.0.1:2379", "-advertise-client-urls", "http://$(IP):2379", "-discovery", "https://discovery.etcd.io/xxxxxx"]
				                     }]
				                 }
				             }
				-            selector: {}
				             volumeClaimTemplates: [{
				                 metadata: {
				                     name: "etcd3"
				@@ -711,27 +709,19 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "StatefulSet"
				+        apiVersion: "apps/v1"
				     }
				 }
				 configMap: {}
				 // ---
				 service: {
				     events: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "events"
				-            labels: {
				-                app:       "events"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             ports: [{
				+                name:       "grpc"
				                 port:       7788
				                 protocol:   "TCP"
				-                name:       "grpc"
				                 targetPort: 7788
				             }]
				             selector: {
				@@ -740,26 +730,34 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "events"
				+            labels: {
				+                app:       "events"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     events: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 2
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                        "prometheus.io.port":   "7080"
				-                    }
				                     labels: {
				                         app:       "events"
				                         domain:    "prod"
				                         component: "infra"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "7080"
				+                    }
				                 }
				                 spec: {
				                     affinity: {
				@@ -783,6 +781,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "events"
				                         image: "gcr.io/myproj/events:v0.1.31"
				                         ports: [{
				                             containerPort: 7080
				@@ -790,7 +789,6 @@
				                             containerPort: 7788
				                         }]
				                         args: ["-cert=/etc/ssl/server.pem", "-key=/etc/ssl/server.key", "-grpc=:7788"]
				-                        name: "events"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -805,6 +803,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -813,23 +813,13 @@
				 // ---
				 service: {
				     tasks: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "tasks"
				-            labels: {
				-                app:       "tasks"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.2.3.4"
				             ports: [{
				                 port:       443
				-                protocol:   "TCP"
				                 name:       "http"
				+                protocol:   "TCP"
				                 targetPort: 7443
				             }]
				             selector: {
				@@ -838,26 +828,34 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "tasks"
				+            labels: {
				+                app:       "tasks"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     tasks: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                        "prometheus.io.port":   "7080"
				-                    }
				                     labels: {
				                         app:       "tasks"
				                         domain:    "prod"
				                         component: "infra"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "7080"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -867,13 +865,13 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "tasks"
				                         image: "gcr.io/myproj/tasks:v0.2.6"
				                         ports: [{
				                             containerPort: 7080
				                         }, {
				                             containerPort: 7443
				                         }]
				-                        name: "tasks"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -888,6 +886,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -896,21 +896,11 @@
				 // ---
				 service: {
				     updater: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "updater"
				-            labels: {
				-                app:       "updater"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -919,12 +909,20 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "updater"
				+            labels: {
				+                app:       "updater"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     updater: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -944,6 +942,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "updater"
				                         image: "gcr.io/myproj/updater:v0.1.0"
				                         volumeMounts: [{
				                             mountPath: "/etc/certs"
				@@ -952,7 +951,6 @@
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        name: "updater"
				                         args: ["-key=/etc/certs/updater.pem"]
				                     }]
				                 }
				@@ -964,6 +962,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -972,23 +972,13 @@
				 // ---
				 service: {
				     watcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "watcher"
				-            labels: {
				-                app:       "watcher"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.2.3.4."
				             ports: [{
				+                name:       "http"
				                 port:       7788
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 7788
				             }]
				             selector: {
				@@ -997,12 +987,20 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "watcher"
				+            labels: {
				+                app:       "watcher"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     watcher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1022,13 +1020,13 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "watcher"
				                         image: "gcr.io/myproj/watcher:v0.1.0"
				                         ports: [{
				                             containerPort: 7080
				                         }, {
				                             containerPort: 7788
				                         }]
				-                        name: "watcher"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -1043,6 +1041,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1057,21 +1057,11 @@
				 // ---
				 service: {
				     caller: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "caller"
				-            labels: {
				-                app:       "caller"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1080,12 +1070,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "caller"
				+            labels: {
				+                app:       "caller"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     caller: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 3
				             selector: {}
				@@ -1119,6 +1117,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "caller"
				                         image: "gcr.io/myproj/caller:v0.20.14"
				                         volumeMounts: [{
				                             name:      "ssd-caller"
				@@ -1132,11 +1131,10 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				-                        name: "caller"
				+                        args: ["-env=prod", "-key=/etc/certs/client.key", "-cert=/etc/certs/client.pem", "-ca=/etc/certs/servfx.ca", "-ssh-tunnel-key=/sslcerts/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-key=/etc/certs/client.key", "-cert=/etc/certs/client.pem", "-ca=/etc/certs/servfx.ca", "-ssh-tunnel-key=/sslcerts/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1155,6 +1153,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1163,21 +1163,11 @@
				 // ---
				 service: {
				     dishwasher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "dishwasher"
				-            labels: {
				-                app:       "dishwasher"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1186,12 +1176,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "dishwasher"
				+            labels: {
				+                app:       "dishwasher"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     dishwasher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 5
				             selector: {}
				@@ -1225,6 +1223,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "dishwasher"
				                         image: "gcr.io/myproj/dishwasher:v0.2.13"
				                         volumeMounts: [{
				                             name:      "dishwasher-disk"
				@@ -1238,11 +1237,10 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				-                        name: "dishwasher"
				+                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1261,6 +1259,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1269,21 +1269,11 @@
				 // ---
				 service: {
				     expiditer: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "expiditer"
				-            labels: {
				-                app:       "expiditer"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1292,12 +1282,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "expiditer"
				+            labels: {
				+                app:       "expiditer"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     expiditer: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1326,8 +1324,9 @@
				                         }
				                     }]
				                     containers: [{
				-                        image: "gcr.io/myproj/expiditer:v0.5.34"
				                         name:  "expiditer"
				+                        image: "gcr.io/myproj/expiditer:v0.5.34"
				+                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				@@ -1339,7 +1338,6 @@
				                             name:      "secret-expiditer"
				                             readOnly:  true
				                         }]
				-                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1358,6 +1356,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1366,21 +1366,11 @@
				 // ---
				 service: {
				     headchef: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "headchef"
				-            labels: {
				-                app:       "headchef"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1389,12 +1379,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "headchef"
				+            labels: {
				+                app:       "headchef"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     headchef: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1423,6 +1421,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "headchef"
				                         image: "gcr.io/myproj/headchef:v0.2.16"
				                         volumeMounts: [{
				                             name:      "headchef-disk"
				@@ -1432,11 +1431,10 @@
				                             name:      "secret-headchef"
				                             readOnly:  true
				                         }]
				-                        name: "headchef"
				+                        args: ["-env=prod", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1455,6 +1453,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1463,21 +1463,11 @@
				 // ---
				 service: {
				     linecook: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "linecook"
				-            labels: {
				-                app:       "linecook"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1486,12 +1476,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "linecook"
				+            labels: {
				+                app:       "linecook"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     linecook: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1520,20 +1518,20 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "linecook"
				                         image: "gcr.io/myproj/linecook:v0.1.42"
				                         volumeMounts: [{
				                             name:      "linecook-disk"
				                             mountPath: "/logs"
				                         }, {
				-                            mountPath: "/etc/certs"
				                             name:      "secret-kitchen"
				+                            mountPath: "/etc/certs"
				                             readOnly:  true
				                         }]
				-                        name: "linecook"
				+                        args: ["-name=linecook", "-env=prod", "-logdir=/logs", "-event-server=events:7788", "-etcd", "etcd:2379", "-reconnect-delay", "1h", "-recovery-overlap", "100000"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-name=linecook", "-env=prod", "-logdir=/logs", "-event-server=events:7788", "-etcd", "etcd:2379", "-reconnect-delay", "1h", "-recovery-overlap", "100000"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1552,6 +1550,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1560,21 +1560,11 @@
				 // ---
				 service: {
				     pastrychef: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "pastrychef"
				-            labels: {
				-                app:       "pastrychef"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1583,12 +1573,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "pastrychef"
				+            labels: {
				+                app:       "pastrychef"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     pastrychef: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1617,20 +1615,20 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "pastrychef"
				                         image: "gcr.io/myproj/pastrychef:v0.1.15"
				                         volumeMounts: [{
				                             name:      "pastrychef-disk"
				                             mountPath: "/logs"
				                         }, {
				-                            mountPath: "/etc/certs"
				                             name:      "secret-ssh-key"
				+                            mountPath: "/etc/certs"
				                             readOnly:  true
				                         }]
				-                        name: "pastrychef"
				+                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788", "-reconnect-delay=1m", "-etcd=etcd:2379", "-recovery-overlap=10000"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788", "-reconnect-delay=1m", "-etcd=etcd:2379", "-recovery-overlap=10000"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1649,6 +1647,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1657,21 +1657,11 @@
				 // ---
				 service: {
				     souschef: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "souschef"
				-            labels: {
				-                app:       "souschef"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1680,12 +1670,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "souschef"
				+            labels: {
				+                app:       "souschef"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     souschef: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1702,8 +1700,8 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/souschef:v0.5.3"
				                         name:  "souschef"
				+                        image: "gcr.io/myproj/souschef:v0.5.3"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				@@ -1725,6 +1723,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1739,14 +1739,12 @@
				 // ---
				 service: {
				     alertmanager: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				         metadata: {
				+            name: "alertmanager"
				             annotations: {
				                 "prometheus.io/scrape": "true"
				                 "prometheus.io/path":   "/metrics"
				             }
				-            name: "alertmanager"
				             labels: {
				                 app:       "alertmanager"
				                 domain:    "prod"
				@@ -1755,9 +1753,9 @@
				         }
				         spec: {
				             ports: [{
				+                name:       "main"
				                 port:       9093
				                 protocol:   "TCP"
				-                name:       "main"
				                 targetPort: 9093
				             }]
				             selector: {
				@@ -1766,19 +1764,19 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     alertmanager: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				+            replicas: 1
				             selector: {
				                 matchLabels: {
				                     app: "alertmanager"
				                 }
				             }
				-            replicas: 1
				             template: {
				                 metadata: {
				                     name: "alertmanager"
				@@ -1790,13 +1788,13 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "alertmanager"
				                         image: "prom/alertmanager:v0.15.2"
				                         args: ["--config.file=/etc/alertmanager/alerts.yaml", "--storage.path=/alertmanager", "--web.external-url=https://alertmanager.example.com"]
				                         ports: [{
				                             name:          "alertmanager"
				                             containerPort: 9093
				                         }]
				-                        name: "alertmanager"
				                         volumeMounts: [{
				                             name:      "config-volume"
				                             mountPath: "/etc/alertmanager"
				@@ -1823,6 +1821,8 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1860,16 +1860,6 @@
				 // ---
				 service: {
				     grafana: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "grafana"
				-            labels: {
				-                app:       "grafana"
				-                domain:    "prod"
				-                component: "mon"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 name:       "grafana"
				@@ -1883,18 +1873,26 @@
				                 component: "mon"
				             }
				         }
				+        metadata: {
				+            name: "grafana"
				+            labels: {
				+                app:       "grafana"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     grafana: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         metadata: {
				+            name: "grafana"
				             labels: {
				                 app:       "grafana"
				                 component: "mon"
				             }
				-            name: "grafana"
				         }
				         spec: {
				             replicas: 1
				@@ -1916,6 +1914,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "grafana"
				                         image: "grafana/grafana:4.5.2"
				                         ports: [{
				                             containerPort: 8080
				@@ -1940,7 +1939,6 @@
				                             name:  "GF_AUTH_ANONYMOUS_ORG_ROLE"
				                             value: "admin"
				                         }]
				-                        name: "grafana"
				                         volumeMounts: [{
				                             name:      "grafana-volume"
				                             mountPath: "/var/lib/grafana"
				@@ -1949,6 +1947,8 @@
				                 }
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1957,13 +1957,11 @@
				 // ---
				 service: {
				     "node-exporter": {
				-        apiVersion: "v1"
				-        kind:       "Service"
				         metadata: {
				+            name: "node-exporter"
				             annotations: {
				                 "prometheus.io/scrape": "true"
				             }
				-            name: "node-exporter"
				             labels: {
				                 app:       "node-exporter"
				                 domain:    "prod"
				@@ -1974,9 +1972,9 @@
				             type:      "ClusterIP"
				             clusterIP: "None"
				             ports: [{
				+                name:       "metrics"
				                 port:       9100
				                 protocol:   "TCP"
				-                name:       "metrics"
				                 targetPort: 9100
				             }]
				             selector: {
				@@ -1985,14 +1983,15 @@
				                 domain:    "prod"
				             }
				         }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {}
				 daemonSet: {
				     "node-exporter": {
				-        apiVersion: "apps/v1"
				-        kind:       "DaemonSet"
				         spec: {
				+            selector: {}
				             template: {
				                 metadata: {
				                     name: "node-exporter"
				@@ -2006,6 +2005,7 @@
				                     hostNetwork: true
				                     hostPID:     true
				                     containers: [{
				+                        name:  "node-exporter"
				                         image: "quay.io/prometheus/node-exporter:v0.16.0"
				                         args: ["--path.procfs=/host/proc", "--path.sysfs=/host/sys"]
				                         ports: [{
				@@ -2023,7 +2023,6 @@
				                                 cpu:    "200m"
				                             }
				                         }
				-                        name: "node-exporter"
				                         volumeMounts: [{
				                             name:      "proc"
				                             readOnly:  true
				@@ -2047,7 +2046,6 @@
				                     }]
				                 }
				             }
				-            selector: {}
				         }
				         metadata: {
				             name: "node-exporter"
				@@ -2055,6 +2053,8 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "DaemonSet"
				+        apiVersion: "apps/v1"
				     }
				 }
				 statefulSet: {}
				@@ -2062,13 +2062,11 @@
				 // ---
				 service: {
				     prometheus: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				         metadata: {
				+            name: "prometheus"
				             annotations: {
				                 "prometheus.io/scrape": "true"
				             }
				-            name: "prometheus"
				             labels: {
				                 app:       "prometheus"
				                 domain:    "prod"
				@@ -2078,10 +2076,10 @@
				         spec: {
				             type: "NodePort"
				             ports: [{
				-                port:       9090
				-                protocol:   "TCP"
				                 name:       "main"
				                 nodePort:   30900
				+                port:       9090
				+                protocol:   "TCP"
				                 targetPort: 9090
				             }]
				             selector: {
				@@ -2090,13 +2088,14 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     prometheus: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				+            replicas: 1
				             strategy: {
				                 rollingUpdate: {
				                     maxSurge:       0
				@@ -2109,7 +2108,6 @@
				                     app: "prometheus"
				                 }
				             }
				-            replicas: 1
				             template: {
				                 metadata: {
				                     name: "prometheus"
				@@ -2124,13 +2122,13 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "prometheus"
				                         image: "prom/prometheus:v2.4.3"
				                         args: ["--config.file=/etc/prometheus/prometheus.yml", "--web.external-url=https://prometheus.example.com"]
				                         ports: [{
				                             name:          "web"
				                             containerPort: 9090
				                         }]
				-                        name: "prometheus"
				                         volumeMounts: [{
				                             name:      "config-volume"
				                             mountPath: "/etc/prometheus"
				@@ -2151,6 +2149,8 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -2402,21 +2402,11 @@
				 // ---
				 service: {
				     authproxy: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "authproxy"
				-            labels: {
				-                app:       "authproxy"
				-                domain:    "prod"
				-                component: "proxy"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       4180
				-                protocol:   "TCP"
				                 targetPort: 4180
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -2425,12 +2415,20 @@
				                 component: "proxy"
				             }
				         }
				+        metadata: {
				+            name: "authproxy"
				+            labels: {
				+                app:       "authproxy"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     authproxy: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -2444,12 +2442,12 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "authproxy"
				                         image: "skippy/oauth2_proxy:2.0.1"
				                         ports: [{
				                             containerPort: 4180
				                         }]
				                         args: ["--config=/etc/authproxy/authproxy.cfg"]
				-                        name: "authproxy"
				                         volumeMounts: [{
				                             name:      "config-volume"
				                             mountPath: "/etc/authproxy"
				@@ -2470,6 +2468,8 @@
				                 component: "proxy"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -2544,23 +2544,13 @@
				 // ---
				 service: {
				     goget: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "goget"
				-            labels: {
				-                app:       "goget"
				-                domain:    "prod"
				-                component: "proxy"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.3.5.7"
				             ports: [{
				                 port:       443
				-                protocol:   "TCP"
				                 name:       "https"
				+                protocol:   "TCP"
				                 targetPort: 7443
				             }]
				             selector: {
				@@ -2569,12 +2559,20 @@
				                 component: "proxy"
				             }
				         }
				+        metadata: {
				+            name: "goget"
				+            labels: {
				+                app:       "goget"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     goget: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -2594,11 +2592,11 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "goget"
				                         image: "gcr.io/myproj/goget:v0.5.1"
				                         ports: [{
				                             containerPort: 7443
				                         }]
				-                        name: "goget"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -2613,6 +2611,8 @@
				                 component: "proxy"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -2621,28 +2621,18 @@
				 // ---
				 service: {
				     nginx: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "nginx"
				-            labels: {
				-                app:       "nginx"
				-                domain:    "prod"
				-                component: "proxy"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.3.4.5"
				             ports: [{
				+                name:       "http"
				                 port:       80
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 80
				             }, {
				+                name:       "https"
				                 port:       443
				                 protocol:   "TCP"
				-                name:       "https"
				                 targetPort: 443
				             }]
				             selector: {
				@@ -2651,12 +2641,20 @@
				                 component: "proxy"
				             }
				         }
				+        metadata: {
				+            name: "nginx"
				+            labels: {
				+                app:       "nginx"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     nginx: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -2681,13 +2679,13 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "nginx"
				                         image: "nginx:1.11.10-alpine"
				                         ports: [{
				                             containerPort: 80
				                         }, {
				                             containerPort: 443
				                         }]
				-                        name: "nginx"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -2706,6 +2704,8 @@
				                 component: "proxy"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}

				"""
			ComparisonOutput: """
				--- snapshot\t2022-02-22 17:04:47.287976398 +0000
				+++ snapshot2\t2022-02-22 17:05:01.079357311 +0000
				@@ -12,21 +12,11 @@
				 // ---
				 service: {
				     bartender: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "bartender"
				-            labels: {
				-                app:       "bartender"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -35,12 +25,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "bartender"
				+            labels: {
				+                app:       "bartender"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     bartender: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -58,12 +56,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/bartender:v0.1.34"
				                         name:  "bartender"
				+                        image: "gcr.io/myproj/bartender:v0.1.34"
				+                        args: []
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: []
				                     }]
				                 }
				             }
				@@ -74,6 +72,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -82,21 +82,11 @@
				 // ---
				 service: {
				     breaddispatcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "breaddispatcher"
				-            labels: {
				-                app:       "breaddispatcher"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -105,12 +95,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "breaddispatcher"
				+            labels: {
				+                app:       "breaddispatcher"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     breaddispatcher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -128,12 +126,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/breaddispatcher:v0.3.24"
				                         name:  "breaddispatcher"
				+                        image: "gcr.io/myproj/breaddispatcher:v0.3.24"
				+                        args: ["-etcd=etcd:2379", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: ["-etcd=etcd:2379", "-event-server=events:7788"]
				                     }]
				                 }
				             }
				@@ -144,6 +142,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -152,21 +152,11 @@
				 // ---
				 service: {
				     host: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "host"
				-            labels: {
				-                app:       "host"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -175,12 +165,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "host"
				+            labels: {
				+                app:       "host"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     host: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 2
				             selector: {}
				@@ -198,12 +196,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/host:v0.1.10"
				                         name:  "host"
				+                        image: "gcr.io/myproj/host:v0.1.10"
				+                        args: []
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: []
				                     }]
				                 }
				             }
				@@ -214,6 +212,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -222,21 +222,11 @@
				 // ---
				 service: {
				     maitred: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "maitred"
				-            labels: {
				-                app:       "maitred"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -245,12 +235,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "maitred"
				+            labels: {
				+                app:       "maitred"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     maitred: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -268,12 +266,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/maitred:v0.0.4"
				                         name:  "maitred"
				+                        image: "gcr.io/myproj/maitred:v0.0.4"
				+                        args: []
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: []
				                     }]
				                 }
				             }
				@@ -284,6 +282,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -292,21 +292,11 @@
				 // ---
				 service: {
				     valeter: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "valeter"
				-            labels: {
				-                app:       "valeter"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				+                name:       "http"
				                 port:       8080
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 8080
				             }]
				             selector: {
				@@ -315,12 +305,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "valeter"
				+            labels: {
				+                app:       "valeter"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     valeter: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -338,11 +336,11 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "valeter"
				                         image: "gcr.io/myproj/valeter:v0.0.4"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        name: "valeter"
				                         args: ["-http=:8080", "-etcd=etcd:2379"]
				                     }]
				                 }
				@@ -354,6 +352,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -362,21 +362,11 @@
				 // ---
				 service: {
				     waiter: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "waiter"
				-            labels: {
				-                app:       "waiter"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -385,12 +375,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "waiter"
				+            labels: {
				+                app:       "waiter"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     waiter: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 5
				             selector: {}
				@@ -408,8 +406,8 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/waiter:v0.3.0"
				                         name:  "waiter"
				+                        image: "gcr.io/myproj/waiter:v0.3.0"
				                         ports: [{
				                             containerPort: 7080
				                         }]
				@@ -423,6 +421,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -431,21 +431,11 @@
				 // ---
				 service: {
				     waterdispatcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "waterdispatcher"
				-            labels: {
				-                app:       "waterdispatcher"
				-                domain:    "prod"
				-                component: "frontend"
				-            }
				-        }
				         spec: {
				             ports: [{
				+                name:       "http"
				                 port:       7080
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 7080
				             }]
				             selector: {
				@@ -454,12 +444,20 @@
				                 component: "frontend"
				             }
				         }
				+        metadata: {
				+            name: "waterdispatcher"
				+            labels: {
				+                app:       "waterdispatcher"
				+                domain:    "prod"
				+                component: "frontend"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     waterdispatcher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -477,12 +475,12 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/waterdispatcher:v0.0.48"
				                         name:  "waterdispatcher"
				+                        image: "gcr.io/myproj/waterdispatcher:v0.0.48"
				+                        args: ["-http=:8080", "-etcd=etcd:2379"]
				                         ports: [{
				                             containerPort: 7080
				                         }]
				-                        args: ["-http=:8080", "-etcd=etcd:2379"]
				                     }]
				                 }
				             }
				@@ -493,6 +491,8 @@
				                 component: "frontend"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -507,21 +507,11 @@
				 // ---
				 service: {
				     download: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "download"
				-            labels: {
				-                app:       "download"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       7080
				-                protocol:   "TCP"
				                 targetPort: 7080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -530,12 +520,20 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "download"
				+            labels: {
				+                app:       "download"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     download: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -549,8 +547,8 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/download:v0.0.2"
				                         name:  "download"
				+                        image: "gcr.io/myproj/download:v0.0.2"
				                         ports: [{
				                             containerPort: 7080
				                         }]
				@@ -564,6 +562,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -572,27 +572,17 @@
				 // ---
				 service: {
				     etcd: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "etcd"
				-            labels: {
				-                app:       "etcd"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             clusterIP: "None"
				             ports: [{
				                 port:       2379
				-                protocol:   "TCP"
				                 targetPort: 2379
				+                protocol:   "TCP"
				                 name:       "client"
				             }, {
				+                name:       "peer"
				                 port:       2380
				                 protocol:   "TCP"
				-                name:       "peer"
				                 targetPort: 2380
				             }]
				             selector: {
				@@ -601,28 +591,37 @@
				                 domain:    "prod"
				             }
				         }
				+        metadata: {
				+            name: "etcd"
				+            labels: {
				+                app:       "etcd"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {}
				 daemonSet: {}
				 statefulSet: {
				     etcd: {
				-        apiVersion: "apps/v1"
				-        kind:       "StatefulSet"
				         spec: {
				             serviceName: "etcd"
				             replicas:    3
				+            selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                        "prometheus.io.port":   "2379"
				-                    }
				                     labels: {
				                         app:       "etcd"
				                         component: "infra"
				                         domain:    "prod"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "2379"
				+                    }
				                 }
				                 spec: {
				                     affinity: {
				@@ -641,6 +640,7 @@
				                     }
				                     terminationGracePeriodSeconds: 10
				                     containers: [{
				+                        name:  "etcd"
				                         image: "quay.io/coreos/etcd:v3.3.10"
				                         ports: [{
				                             name:          "client"
				@@ -682,12 +682,10 @@
				                             }
				                         }]
				                         command: ["/usr/local/bin/etcd"]
				-                        name: "etcd"
				                         args: ["-name", "$(NAME)", "-data-dir", "/data/etcd3", "-initial-advertise-peer-urls", "http://$(IP):2380", "-listen-peer-urls", "http://$(IP):2380", "-listen-client-urls", "http://$(IP):2379,http://127.0.0.1:2379", "-advertise-client-urls", "http://$(IP):2379", "-discovery", "https://discovery.etcd.io/xxxxxx"]
				                     }]
				                 }
				             }
				-            selector: {}
				             volumeClaimTemplates: [{
				                 metadata: {
				                     name: "etcd3"
				@@ -711,27 +709,19 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "StatefulSet"
				+        apiVersion: "apps/v1"
				     }
				 }
				 configMap: {}
				 // ---
				 service: {
				     events: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "events"
				-            labels: {
				-                app:       "events"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             ports: [{
				+                name:       "grpc"
				                 port:       7788
				                 protocol:   "TCP"
				-                name:       "grpc"
				                 targetPort: 7788
				             }]
				             selector: {
				@@ -740,26 +730,34 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "events"
				+            labels: {
				+                app:       "events"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     events: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 2
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                        "prometheus.io.port":   "7080"
				-                    }
				                     labels: {
				                         app:       "events"
				                         domain:    "prod"
				                         component: "infra"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "7080"
				+                    }
				                 }
				                 spec: {
				                     affinity: {
				@@ -783,6 +781,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "events"
				                         image: "gcr.io/myproj/events:v0.1.31"
				                         ports: [{
				                             containerPort: 7080
				@@ -790,7 +789,6 @@
				                             containerPort: 7788
				                         }]
				                         args: ["-cert=/etc/ssl/server.pem", "-key=/etc/ssl/server.key", "-grpc=:7788"]
				-                        name: "events"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -805,6 +803,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -813,23 +813,13 @@
				 // ---
				 service: {
				     tasks: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "tasks"
				-            labels: {
				-                app:       "tasks"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.2.3.4"
				             ports: [{
				                 port:       443
				-                protocol:   "TCP"
				                 name:       "http"
				+                protocol:   "TCP"
				                 targetPort: 7443
				             }]
				             selector: {
				@@ -838,26 +828,34 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "tasks"
				+            labels: {
				+                app:       "tasks"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     tasks: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				             template: {
				                 metadata: {
				-                    annotations: {
				-                        "prometheus.io.scrape": "true"
				-                        "prometheus.io.port":   "7080"
				-                    }
				                     labels: {
				                         app:       "tasks"
				                         domain:    "prod"
				                         component: "infra"
				                     }
				+                    annotations: {
				+                        "prometheus.io.scrape": "true"
				+                        "prometheus.io.port":   "7080"
				+                    }
				                 }
				                 spec: {
				                     volumes: [{
				@@ -867,13 +865,13 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "tasks"
				                         image: "gcr.io/myproj/tasks:v0.2.6"
				                         ports: [{
				                             containerPort: 7080
				                         }, {
				                             containerPort: 7443
				                         }]
				-                        name: "tasks"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -888,6 +886,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -896,21 +896,11 @@
				 // ---
				 service: {
				     updater: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "updater"
				-            labels: {
				-                app:       "updater"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -919,12 +909,20 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "updater"
				+            labels: {
				+                app:       "updater"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     updater: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -944,6 +942,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "updater"
				                         image: "gcr.io/myproj/updater:v0.1.0"
				                         volumeMounts: [{
				                             mountPath: "/etc/certs"
				@@ -952,7 +951,6 @@
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        name: "updater"
				                         args: ["-key=/etc/certs/updater.pem"]
				                     }]
				                 }
				@@ -964,6 +962,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -972,23 +972,13 @@
				 // ---
				 service: {
				     watcher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "watcher"
				-            labels: {
				-                app:       "watcher"
				-                domain:    "prod"
				-                component: "infra"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.2.3.4."
				             ports: [{
				+                name:       "http"
				                 port:       7788
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 7788
				             }]
				             selector: {
				@@ -997,12 +987,20 @@
				                 component: "infra"
				             }
				         }
				+        metadata: {
				+            name: "watcher"
				+            labels: {
				+                app:       "watcher"
				+                domain:    "prod"
				+                component: "infra"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     watcher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1022,13 +1020,13 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "watcher"
				                         image: "gcr.io/myproj/watcher:v0.1.0"
				                         ports: [{
				                             containerPort: 7080
				                         }, {
				                             containerPort: 7788
				                         }]
				-                        name: "watcher"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -1043,6 +1041,8 @@
				                 component: "infra"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1057,21 +1057,11 @@
				 // ---
				 service: {
				     caller: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "caller"
				-            labels: {
				-                app:       "caller"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1080,12 +1070,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "caller"
				+            labels: {
				+                app:       "caller"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     caller: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 3
				             selector: {}
				@@ -1119,6 +1117,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "caller"
				                         image: "gcr.io/myproj/caller:v0.20.14"
				                         volumeMounts: [{
				                             name:      "ssd-caller"
				@@ -1132,11 +1131,10 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				-                        name: "caller"
				+                        args: ["-env=prod", "-key=/etc/certs/client.key", "-cert=/etc/certs/client.pem", "-ca=/etc/certs/servfx.ca", "-ssh-tunnel-key=/sslcerts/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-key=/etc/certs/client.key", "-cert=/etc/certs/client.pem", "-ca=/etc/certs/servfx.ca", "-ssh-tunnel-key=/sslcerts/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1155,6 +1153,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1163,21 +1163,11 @@
				 // ---
				 service: {
				     dishwasher: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "dishwasher"
				-            labels: {
				-                app:       "dishwasher"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1186,12 +1176,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "dishwasher"
				+            labels: {
				+                app:       "dishwasher"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     dishwasher: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 5
				             selector: {}
				@@ -1225,6 +1223,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "dishwasher"
				                         image: "gcr.io/myproj/dishwasher:v0.2.13"
				                         volumeMounts: [{
				                             name:      "dishwasher-disk"
				@@ -1238,11 +1237,10 @@
				                             name:      "secret-ssh-key"
				                             readOnly:  true
				                         }]
				-                        name: "dishwasher"
				+                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1261,6 +1259,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1269,21 +1269,11 @@
				 // ---
				 service: {
				     expiditer: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "expiditer"
				-            labels: {
				-                app:       "expiditer"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1292,12 +1282,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "expiditer"
				+            labels: {
				+                app:       "expiditer"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     expiditer: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1326,8 +1324,9 @@
				                         }
				                     }]
				                     containers: [{
				-                        image: "gcr.io/myproj/expiditer:v0.5.34"
				                         name:  "expiditer"
				+                        image: "gcr.io/myproj/expiditer:v0.5.34"
				+                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				@@ -1339,7 +1338,6 @@
				                             name:      "secret-expiditer"
				                             readOnly:  true
				                         }]
				-                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1358,6 +1356,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1366,21 +1366,11 @@
				 // ---
				 service: {
				     headchef: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "headchef"
				-            labels: {
				-                app:       "headchef"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1389,12 +1379,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "headchef"
				+            labels: {
				+                app:       "headchef"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     headchef: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1423,6 +1421,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "headchef"
				                         image: "gcr.io/myproj/headchef:v0.2.16"
				                         volumeMounts: [{
				                             name:      "headchef-disk"
				@@ -1432,11 +1431,10 @@
				                             name:      "secret-headchef"
				                             readOnly:  true
				                         }]
				-                        name: "headchef"
				+                        args: ["-env=prod", "-logdir=/logs", "-event-server=events:7788"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-logdir=/logs", "-event-server=events:7788"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1455,6 +1453,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1463,21 +1463,11 @@
				 // ---
				 service: {
				     linecook: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "linecook"
				-            labels: {
				-                app:       "linecook"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1486,12 +1476,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "linecook"
				+            labels: {
				+                app:       "linecook"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     linecook: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1520,20 +1518,20 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "linecook"
				                         image: "gcr.io/myproj/linecook:v0.1.42"
				                         volumeMounts: [{
				                             name:      "linecook-disk"
				                             mountPath: "/logs"
				                         }, {
				-                            mountPath: "/etc/certs"
				                             name:      "secret-kitchen"
				+                            mountPath: "/etc/certs"
				                             readOnly:  true
				                         }]
				-                        name: "linecook"
				+                        args: ["-name=linecook", "-env=prod", "-logdir=/logs", "-event-server=events:7788", "-etcd", "etcd:2379", "-reconnect-delay", "1h", "-recovery-overlap", "100000"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-name=linecook", "-env=prod", "-logdir=/logs", "-event-server=events:7788", "-etcd", "etcd:2379", "-reconnect-delay", "1h", "-recovery-overlap", "100000"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1552,6 +1550,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1560,21 +1560,11 @@
				 // ---
				 service: {
				     pastrychef: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "pastrychef"
				-            labels: {
				-                app:       "pastrychef"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1583,12 +1573,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "pastrychef"
				+            labels: {
				+                app:       "pastrychef"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     pastrychef: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1617,20 +1615,20 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "pastrychef"
				                         image: "gcr.io/myproj/pastrychef:v0.1.15"
				                         volumeMounts: [{
				                             name:      "pastrychef-disk"
				                             mountPath: "/logs"
				                         }, {
				-                            mountPath: "/etc/certs"
				                             name:      "secret-ssh-key"
				+                            mountPath: "/etc/certs"
				                             readOnly:  true
				                         }]
				-                        name: "pastrychef"
				+                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788", "-reconnect-delay=1m", "-etcd=etcd:2379", "-recovery-overlap=10000"]
				                         ports: [{
				                             containerPort: 8080
				                         }]
				-                        args: ["-env=prod", "-ssh-tunnel-key=/etc/certs/tunnel-private.pem", "-logdir=/logs", "-event-server=events:7788", "-reconnect-delay=1m", "-etcd=etcd:2379", "-recovery-overlap=10000"]
				                         livenessProbe: {
				                             httpGet: {
				                                 path: "/debug/health"
				@@ -1649,6 +1647,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1657,21 +1657,11 @@
				 // ---
				 service: {
				     souschef: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "souschef"
				-            labels: {
				-                app:       "souschef"
				-                domain:    "prod"
				-                component: "kitchen"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       8080
				-                protocol:   "TCP"
				                 targetPort: 8080
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -1680,12 +1670,20 @@
				                 component: "kitchen"
				             }
				         }
				+        metadata: {
				+            name: "souschef"
				+            labels: {
				+                app:       "souschef"
				+                domain:    "prod"
				+                component: "kitchen"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     souschef: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -1702,8 +1700,8 @@
				                 }
				                 spec: {
				                     containers: [{
				-                        image: "gcr.io/myproj/souschef:v0.5.3"
				                         name:  "souschef"
				+                        image: "gcr.io/myproj/souschef:v0.5.3"
				                         ports: [{
				                             containerPort: 8080
				                         }]
				@@ -1725,6 +1723,8 @@
				                 component: "kitchen"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1739,14 +1739,12 @@
				 // ---
				 service: {
				     alertmanager: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				         metadata: {
				+            name: "alertmanager"
				             annotations: {
				                 "prometheus.io/scrape": "true"
				                 "prometheus.io/path":   "/metrics"
				             }
				-            name: "alertmanager"
				             labels: {
				                 app:       "alertmanager"
				                 domain:    "prod"
				@@ -1755,9 +1753,9 @@
				         }
				         spec: {
				             ports: [{
				+                name:       "main"
				                 port:       9093
				                 protocol:   "TCP"
				-                name:       "main"
				                 targetPort: 9093
				             }]
				             selector: {
				@@ -1766,19 +1764,19 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     alertmanager: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				+            replicas: 1
				             selector: {
				                 matchLabels: {
				                     app: "alertmanager"
				                 }
				             }
				-            replicas: 1
				             template: {
				                 metadata: {
				                     name: "alertmanager"
				@@ -1790,13 +1788,13 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "alertmanager"
				                         image: "prom/alertmanager:v0.15.2"
				                         args: ["--config.file=/etc/alertmanager/alerts.yaml", "--storage.path=/alertmanager", "--web.external-url=https://alertmanager.example.com"]
				                         ports: [{
				                             name:          "alertmanager"
				                             containerPort: 9093
				                         }]
				-                        name: "alertmanager"
				                         volumeMounts: [{
				                             name:      "config-volume"
				                             mountPath: "/etc/alertmanager"
				@@ -1823,6 +1821,8 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1860,16 +1860,6 @@
				 // ---
				 service: {
				     grafana: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "grafana"
				-            labels: {
				-                app:       "grafana"
				-                domain:    "prod"
				-                component: "mon"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 name:       "grafana"
				@@ -1883,18 +1873,26 @@
				                 component: "mon"
				             }
				         }
				+        metadata: {
				+            name: "grafana"
				+            labels: {
				+                app:       "grafana"
				+                domain:    "prod"
				+                component: "mon"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     grafana: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         metadata: {
				+            name: "grafana"
				             labels: {
				                 app:       "grafana"
				                 component: "mon"
				             }
				-            name: "grafana"
				         }
				         spec: {
				             replicas: 1
				@@ -1916,6 +1914,7 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "grafana"
				                         image: "grafana/grafana:4.5.2"
				                         ports: [{
				                             containerPort: 8080
				@@ -1940,7 +1939,6 @@
				                             name:  "GF_AUTH_ANONYMOUS_ORG_ROLE"
				                             value: "admin"
				                         }]
				-                        name: "grafana"
				                         volumeMounts: [{
				                             name:      "grafana-volume"
				                             mountPath: "/var/lib/grafana"
				@@ -1949,6 +1947,8 @@
				                 }
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -1957,13 +1957,11 @@
				 // ---
				 service: {
				     "node-exporter": {
				-        apiVersion: "v1"
				-        kind:       "Service"
				         metadata: {
				+            name: "node-exporter"
				             annotations: {
				                 "prometheus.io/scrape": "true"
				             }
				-            name: "node-exporter"
				             labels: {
				                 app:       "node-exporter"
				                 domain:    "prod"
				@@ -1974,9 +1972,9 @@
				             type:      "ClusterIP"
				             clusterIP: "None"
				             ports: [{
				+                name:       "metrics"
				                 port:       9100
				                 protocol:   "TCP"
				-                name:       "metrics"
				                 targetPort: 9100
				             }]
				             selector: {
				@@ -1985,14 +1983,15 @@
				                 domain:    "prod"
				             }
				         }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {}
				 daemonSet: {
				     "node-exporter": {
				-        apiVersion: "apps/v1"
				-        kind:       "DaemonSet"
				         spec: {
				+            selector: {}
				             template: {
				                 metadata: {
				                     name: "node-exporter"
				@@ -2006,6 +2005,7 @@
				                     hostNetwork: true
				                     hostPID:     true
				                     containers: [{
				+                        name:  "node-exporter"
				                         image: "quay.io/prometheus/node-exporter:v0.16.0"
				                         args: ["--path.procfs=/host/proc", "--path.sysfs=/host/sys"]
				                         ports: [{
				@@ -2023,7 +2023,6 @@
				                                 cpu:    "200m"
				                             }
				                         }
				-                        name: "node-exporter"
				                         volumeMounts: [{
				                             name:      "proc"
				                             readOnly:  true
				@@ -2047,7 +2046,6 @@
				                     }]
				                 }
				             }
				-            selector: {}
				         }
				         metadata: {
				             name: "node-exporter"
				@@ -2055,6 +2053,8 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "DaemonSet"
				+        apiVersion: "apps/v1"
				     }
				 }
				 statefulSet: {}
				@@ -2062,13 +2062,11 @@
				 // ---
				 service: {
				     prometheus: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				         metadata: {
				+            name: "prometheus"
				             annotations: {
				                 "prometheus.io/scrape": "true"
				             }
				-            name: "prometheus"
				             labels: {
				                 app:       "prometheus"
				                 domain:    "prod"
				@@ -2078,10 +2076,10 @@
				         spec: {
				             type: "NodePort"
				             ports: [{
				-                port:       9090
				-                protocol:   "TCP"
				                 name:       "main"
				                 nodePort:   30900
				+                port:       9090
				+                protocol:   "TCP"
				                 targetPort: 9090
				             }]
				             selector: {
				@@ -2090,13 +2088,14 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     prometheus: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				+            replicas: 1
				             strategy: {
				                 rollingUpdate: {
				                     maxSurge:       0
				@@ -2109,7 +2108,6 @@
				                     app: "prometheus"
				                 }
				             }
				-            replicas: 1
				             template: {
				                 metadata: {
				                     name: "prometheus"
				@@ -2124,13 +2122,13 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "prometheus"
				                         image: "prom/prometheus:v2.4.3"
				                         args: ["--config.file=/etc/prometheus/prometheus.yml", "--web.external-url=https://prometheus.example.com"]
				                         ports: [{
				                             name:          "web"
				                             containerPort: 9090
				                         }]
				-                        name: "prometheus"
				                         volumeMounts: [{
				                             name:      "config-volume"
				                             mountPath: "/etc/prometheus"
				@@ -2151,6 +2149,8 @@
				                 component: "mon"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -2402,21 +2402,11 @@
				 // ---
				 service: {
				     authproxy: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "authproxy"
				-            labels: {
				-                app:       "authproxy"
				-                domain:    "prod"
				-                component: "proxy"
				-            }
				-        }
				         spec: {
				             ports: [{
				                 port:       4180
				-                protocol:   "TCP"
				                 targetPort: 4180
				+                protocol:   "TCP"
				                 name:       "client"
				             }]
				             selector: {
				@@ -2425,12 +2415,20 @@
				                 component: "proxy"
				             }
				         }
				+        metadata: {
				+            name: "authproxy"
				+            labels: {
				+                app:       "authproxy"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     authproxy: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -2444,12 +2442,12 @@
				                 }
				                 spec: {
				                     containers: [{
				+                        name:  "authproxy"
				                         image: "skippy/oauth2_proxy:2.0.1"
				                         ports: [{
				                             containerPort: 4180
				                         }]
				                         args: ["--config=/etc/authproxy/authproxy.cfg"]
				-                        name: "authproxy"
				                         volumeMounts: [{
				                             name:      "config-volume"
				                             mountPath: "/etc/authproxy"
				@@ -2470,6 +2468,8 @@
				                 component: "proxy"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -2544,23 +2544,13 @@
				 // ---
				 service: {
				     goget: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "goget"
				-            labels: {
				-                app:       "goget"
				-                domain:    "prod"
				-                component: "proxy"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.3.5.7"
				             ports: [{
				                 port:       443
				-                protocol:   "TCP"
				                 name:       "https"
				+                protocol:   "TCP"
				                 targetPort: 7443
				             }]
				             selector: {
				@@ -2569,12 +2559,20 @@
				                 component: "proxy"
				             }
				         }
				+        metadata: {
				+            name: "goget"
				+            labels: {
				+                app:       "goget"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     goget: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -2594,11 +2592,11 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "goget"
				                         image: "gcr.io/myproj/goget:v0.5.1"
				                         ports: [{
				                             containerPort: 7443
				                         }]
				-                        name: "goget"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -2613,6 +2611,8 @@
				                 component: "proxy"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}
				@@ -2621,28 +2621,18 @@
				 // ---
				 service: {
				     nginx: {
				-        apiVersion: "v1"
				-        kind:       "Service"
				-        metadata: {
				-            name: "nginx"
				-            labels: {
				-                app:       "nginx"
				-                domain:    "prod"
				-                component: "proxy"
				-            }
				-        }
				         spec: {
				             type:           "LoadBalancer"
				             loadBalancerIP: "1.3.4.5"
				             ports: [{
				+                name:       "http"
				                 port:       80
				                 protocol:   "TCP"
				-                name:       "http"
				                 targetPort: 80
				             }, {
				+                name:       "https"
				                 port:       443
				                 protocol:   "TCP"
				-                name:       "https"
				                 targetPort: 443
				             }]
				             selector: {
				@@ -2651,12 +2641,20 @@
				                 component: "proxy"
				             }
				         }
				+        metadata: {
				+            name: "nginx"
				+            labels: {
				+                app:       "nginx"
				+                domain:    "prod"
				+                component: "proxy"
				+            }
				+        }
				+        kind:       "Service"
				+        apiVersion: "v1"
				     }
				 }
				 deployment: {
				     nginx: {
				-        apiVersion: "apps/v1"
				-        kind:       "Deployment"
				         spec: {
				             replicas: 1
				             selector: {}
				@@ -2681,13 +2679,13 @@
				                         }
				                     }]
				                     containers: [{
				+                        name:  "nginx"
				                         image: "nginx:1.11.10-alpine"
				                         ports: [{
				                             containerPort: 80
				                         }, {
				                             containerPort: 443
				                         }]
				-                        name: "nginx"
				                         volumeMounts: [{
				                             mountPath: "/etc/ssl"
				                             name:      "secret-volume"
				@@ -2706,6 +2704,8 @@
				                 component: "proxy"
				             }
				         }
				+        kind:       "Deployment"
				+        apiVersion: "apps/v1"
				     }
				 }
				 daemonSet: {}

				"""
		}, {
			Negated:          false
			CmdStr:           "cp snapshot2 snapshot"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:  false
			CmdStr:   "find . | grep kube.cue | xargs wc -l | tail -1"
			ExitCode: 0
			Output: """
				  925 total

				"""
			ComparisonOutput: """
				  925 total

				"""
		}]
	}
}
Hash: "0b93d61e02a82b97499dad39a39a7d5c28fdda25590122a21f6a7733f5c7fa7c"
Delims: ["{{{", "}}}"]
