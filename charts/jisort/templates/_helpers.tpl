{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "jisort.mysql.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "mysql" "chartValues" .Values.mysql "context" $) -}}
{{- end -}}

{{/*
Return Database Host
*/}}
{{- define "database.host" -}}
{{- printf "%s" (include "jisort.mysql.fullname" .) -}}
{{- end -}}

{{/*
Return Database Port
*/}}
{{- define "database.port" -}}
{{- printf "3306" -}}
{{- end -}}

{{/*
Return Database Secret Name
*/}}
{{- define "database.secretName" -}}
{{- printf "%s" (include "jisort.mysql.fullname" .) -}}
{{- end -}}

{{/*
Return Database Secret Key for root User
*/}}
{{- define "database.secretKeyRoot" -}}
{{- printf "mysql-root-password" -}}
{{- end -}}

{{/*
Return Database User
*/}}
{{- define "database.username" -}}
{{- printf "%s" .Values.mysql.auth.username -}}
{{- end -}}

{{/*
Return Database Secret Key
*/}}
{{- define "database.secretKey" -}}
{{- printf "mysql-password" -}}
{{- end -}}

{{/*
Return Hikari JDBC Driver
*/}}
{{- define "hikari.jdbcDriver" -}}
{{- printf "org.mariadb.jdbc.Driver" -}}
{{- end -}}

{{/*
Return Hikari JDBC URL
*/}}
{{- define "hikari.jdbcUrl" -}}
{{- printf "jdbc:mariadb://%s:%s/%s" (include "database.host" .) (include "database.port" .) .Values.mysql.auth.database -}}
{{- end -}}

{{/*
Return Tenant Database Name
*/}}
{{- define "tenant.databaseName" -}}
{{- printf "fineract_default" -}}
{{- end -}}

{{/*
Return Server Protocol
*/}}
{{- define "server.protocol" -}}
{{- if .Values.server.ssl.enabled -}}
{{- printf "HTTPS" -}}
{{- else -}}
{{- printf "HTTP" -}}
{{- end -}}
{{- end -}}
