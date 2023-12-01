{{/*
Expand the name of the chart.
*/}}
{{- define "ids-basecamp-clearinghouse.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ids-basecamp-clearinghouse.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ids-basecamp-clearinghouse.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels CH-EDC
*/}}
{{- define "ids-basecamp-clearinghouse.ch-edc.labels" -}}
helm.sh/chart: {{ include "ids-basecamp-clearinghouse.chart" . }}
{{ include "ids-basecamp-clearinghouse.ch-edc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels CH-App
*/}}
{{- define "ids-basecamp-clearinghouse.ch-app.labels" -}}
helm.sh/chart: {{ include "ids-basecamp-clearinghouse.chart" . }}
{{ include "ids-basecamp-clearinghouse.ch-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels CH-EDC
*/}}
{{- define "ids-basecamp-clearinghouse.ch-edc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ids-basecamp-clearinghouse.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: ch-edc
{{- end }}

{{/*
Selector labels CH-App
*/}}
{{- define "ids-basecamp-clearinghouse.ch-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ids-basecamp-clearinghouse.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: ch-app
{{- end }}
