{{- define "postgres.app.name" -}}
{{- printf "%s-db" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.chart.name" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.secret.name" -}}
{{- printf "%s-secret" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.configMap.name" -}}
{{- printf "%s-configmap" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.stateful.name" -}}
{{- printf "%s-stateful" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.pod.name" -}}
{{- printf "%s-pod" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.headless.service.name" -}}
{{- printf "%s-headless-service" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.labels" -}}
helm.sh/chart: {{ include "postgres.chart.name" . }}
{{ include "postgres.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "postgres.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postgres.app.name" . }}
app.kubernetes.io/app-tier: {{ .Values.tier}}
{{- if .Chart.AppVersion }}
app.kubernetes.io/postgresql-version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: "postgresql"
{{- end }}

