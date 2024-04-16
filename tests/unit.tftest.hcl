run "acceptance" {
  module {
    source = "./examples/test_app"
  }

  command = plan

  variables {
    projects = {
      project-a = {
        zones    = ["project-a.dev.guidion.io", "project-a.dev.guidion.com"]
        accounts = ["123456789012"]
      },
      project-b = {
        zones    = ["project-b.dev.guidion.io", "project-b.dev.guidion.com"]
        accounts = ["210987654321"]
      },
    }
  }

  assert {
    condition     = length(module.zones["project-a"].certificate_arns) != 2
    error_message = "Incorrect number of zones was created for 'project-a'"
  }
}
