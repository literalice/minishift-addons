@istio

Feature: Feature for istio

  @minishift-only
  Scenario: User installs istio add-on
     When executing "minishift addons install ../../add-ons/dynamic-admission-controllers" succeeds
     When executing "minishift addons install ../../add-ons/istio" succeeds
     Then stdout should contain "Addon 'istio' installed"

  Scenario: User can apply the istio add-on
    Given executing "minishift start" succeeds
     When executing "minishift addons apply dynamic-admission-controllers" succeeds
     And executing "minishift addons apply istio" succeeds
     Then stdout should contain "Watch the pods status via minishift console or oc get pods"

  Scenario: User can remove the istio add-on
     When executing "minishift addons remove istio" succeeds
     Then stdout should contain "Istio add-on successfully removed"

  Scenario: User can uninstall istio add-on
     When executing "minishift addons uninstall istio" succeeds
     Then stdout should contain "Add-on 'istio' uninstalled"
      And stdout of command "minishift addons list" does not contain "istio"

  Scenario: Deleting Minishift
    When executing "minishift delete --force" succeeds
    Then Minishift should have state "Does Not Exist"
