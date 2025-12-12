# A bootcamp module with following structure

- Kickoff (Live) – overview, expectations
- Self-paced modules – video, reading, labs
- Weekly live Q&A
- Final challenge + certification
- Feedback loop

## Core capabilities
### Content Hosting
NextGen platform (ideally)
Supplement with GitOps-based content via GitHub Pages
### Labs
Pre-provisioned OpenShift clusters or CodeReady containers
Browser-based terminals (like Katacoda-style or Instruqt)
### Communication
Slack/Discord channels
Embedded chat in your platform
### Tracking & Analytics
Completion rates
Lab success metrics
Engagement dashboards

## bootcamp layers
LAYER 1 — Orientation (O-Module)
LAYER 2 — Core Content Modules (C-Modules)
LAYER 3 — Practice Layer (P-Modules)
LAYER 4 — Capstone Layer (X-Modules)

**Example of an OpenShift bootcamp weekly distribution**

<img width="760" height="209" alt="Image" src="https://github.com/user-attachments/assets/27850025-beb4-4e15-a06f-b82aab9236e6" />

## bootcamp model

```
Bootcamp
 └── Layer (orientation, core, practice, capstone)
       └── Module (C1, C2, P1…)
             └── Component (primer, lab, demo, quiz…)
```

```yaml
bootcamp:
  name: "NextGen Bootcamp"
  version: "1.0"
  description: "Cohort-based, intensive OpenShift/cloud-native bootcamp."
  duration_weeks: 3
  audience: 
    - "Platform Engineers"
    - "Application Developers"
    - "Cloud/DevOps Practitioners"
  outcomes:
    - "Deploy, manage, and troubleshoot cloud-native apps on OpenShift"
    - "Understand CI/CD, GitOps, observability"
    - "Deliver a full end-to-end capstone scenario"
layers:
  orientation:
    - id: O1
      name: "Kickoff Session"
      type: "live"
      objectives:
        - "Set expectations"
        - "Introduce tools and labs"
        - "Explain cohort structure"
      resources:
        - "slides/welcome.pdf"
        - "channel:discussion"
    - id: O2
      name: "Baseline Assessment"
      type: "quiz"
      questions: 15
      linked_labs:
        - "openshift-sandbox-orientation"
        - "oc-cli-101"
  core_modules:
    - id: C1
      name: "Containers & Kubernetes Fundamentals"
      components:
        primer: "videos/k8s-basics.mp4"
        demo: "demos/podman-intro"
        lab: "podman-basics-lab"
        quiz: "c1-quiz"
        discussion: "post-your-container-image"
      linked_labs:
        - "podman-basics-lab"
        - "k8s-objects-101"
    - id: C2
      name: "OpenShift Fundamentals"
      components:
        primer: "videos/openshift-overview.mp4"
        demo: "demos/oc-cli-demo"
        lab: "openshift-console-and-cli"
        quiz: "c2-quiz"
        discussion: "create-your-first-project"
      linked_labs:
        - "openshift-console-basics"
        - "oc-cli-operations"
        - "deploy-first-app"
    - id: C3
      name: "Deployment Patterns"
      components:
        primer: "videos/routes-and-services.mp4"
        demo: "demos/deployments-demo"
        lab: "routes-services-scaling"
        quiz: "c3-quiz"
        discussion: "probe-and-scaling-patterns"
      linked_labs:
        - "routes-lab"
        - "services-basics"
        - "configmaps-secrets-lab"
        - "health-checks-lab"
    - id: C4
      name: "CI/CD with Tekton"
      components:
        primer: "videos/tekton-basics.mp4"
        demo: "demos/tekton-pipeline-demo"
        lab: "tekton-build-pipeline"
        quiz: "c4-quiz"
        discussion: "pipeline-patterns"
      linked_labs:
        - "tekton-intro-lab"
        - "tekton-pipeline-lab"
    - id: C5
      name: "GitOps with ArgoCD"
      components:
        primer: "videos/gitops-overview.mp4"
        demo: "demos/argocd-sync-demo"
        lab: "argocd-environment-sync"
        quiz: "c5-quiz"
        discussion: "gitops-advantages"
      linked_labs:
        - "argocd-intro-lab"
        - "gitops-multi-env-lab"
    - id: C6
      name: "Observability & Troubleshooting"
      components:
        primer: "videos/openshift-monitoring.mp4"
        demo: "demos/logging-tracing-demo"
        lab: "openshift-observability"
        quiz: "c6-quiz"
        discussion: "troubleshooting-scenarios"
      linked_labs:
        - "logging-loki-lab"
        - "prometheus-grafana-lab"
        - "failed-pod-troubleshooting"
  practice_modules:
    - id: P1
      name: "Guided Challenge"
      description: "Scenario-based practice with hints"
      scenario: "Fix a failing deployment and expose it"
      linked_labs:
        - "failed-pod-troubleshooting"
        - "routes-lab"
    - id: P2
      name: "Unguided Challenge"
      description: "Outcome-based task: learners choose approach"
      scenario: "Deploy → Configure → Expose → Add liveness probe"
      linked_labs:
        - "deploy-first-app"
        - "configmaps-secrets-lab"
        - "health-checks-lab"
    - id: P3
      name: "Weekly Team Challenge"
      description: "Group exercise implementing multi-env GitOps"
      linked_labs:
        - "gitops-multi-env-lab"
  capstone:
    - id: X1
      name: "Capstone Design"
      deliverables:
        - "architecture-diagram"
        - "deployment-plan"
    - id: X2
      name: "Capstone Build"
      tasks:
        - "Deploy app"
        - "Configure runtime parameters"
        - "Build CI pipeline"
        - "Enable GitOps"
        - "Add observability"
      linked_labs:
        - "deploy-first-app"
        - "tekton-pipeline-lab"
        - "argocd-intro-lab"
        - "logging-loki-lab"
    - id: X3
      name: "Capstone Showcase"
      format: "5-minute video or live presentation"
    - id: X4
      name: "Completion Badge"
      badge_id: "bootcamp-level-1"
```



1 - OpenShift
2 - Containers and Podman
3 - Kubernetes
4 - Quarkus
5 - NextJS
