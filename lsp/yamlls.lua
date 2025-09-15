return {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = vim.tbl_extend("force",
        {
          kubernetes = {
            "*-backendtrafficpolicy.yaml",
            "*-clusterrole.yaml",
            "*-clusterrolebinding.yaml",
            "*-configmap.yaml",
            "*-deployment.yaml",
            "*-gateway.yaml",
            "*-httproute.yaml",
            "*-namespace.yaml",
            "*-persistentvolume.yaml",
            "*-persistentvolumeclaim.yaml",
            "*-role.yaml",
            "*-rolebinding.yaml",
            "*-secret.yaml",
            "*-service.yaml",
            "*-storageclass.yaml",
            "*-tcproute.yaml",
          },
        },
        require("schemastore").yaml.schemas(
          {
            extra = {
              {
                name = "Argo Workflows",
                description = "Argo Workflows",
                url = "https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json",
                fileMatch = {
                  "*-workflowtemplate.yaml",
                  "*-workflow.yaml",
                  "*-cronworkflow.yaml",
                },
              },
              {
                name = "Argo Events",
                description = "Argo Events",
                url = "https://raw.githubusercontent.com/argoproj/argo-events/refs/heads/master/api/jsonschema/schema.json",
                fileMatch = {
                  "*-sensor.yaml",
                  "*-eventsource.yaml",
                  "*-eventbus.yaml",
                },
              },
            },
          }
        )
      ),
    },
  },
}
