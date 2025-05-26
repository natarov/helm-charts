{{/*
Return the fully qualified app name.
*/}}
{{- define "httpbin.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the labels for the application.
*/}}
{{- define "httpbin.labels" -}}
app: {{ include "httpbin.name" . }}
app.kubernetes.io/name: {{ include "httpbin.name" . }}
helm.sh/chart: {{ include "httpbin.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Return the selector labels for the application.
*/}}
{{- define "httpbin.selectorLabels" -}}
app: {{ include "httpbin.name" . }}
app.kubernetes.io/name: {{ include "httpbin.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return the name of the chart.
*/}}
{{- define "httpbin.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the chart name and version.
*/}}
{{- define "httpbin.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }} 