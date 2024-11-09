{{- define "labels"}}
generator: helm
app-name: {{.Chart.Name}}
date: {{ now | htmlDate }}
version: {{.Chart.Version}}
{{- end}}

{{- define "serviceType"}}
{{- if eq .Values.ENV "LOCAL"}}
type: NodePort
{{- else}}
type: LoadBalancer
{{- end}}
{{- end}}
