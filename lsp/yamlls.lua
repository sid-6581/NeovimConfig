return {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(
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
      ),
    },
  },
}
