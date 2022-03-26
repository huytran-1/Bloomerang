$logger = Logger.new(STDOUT)

After do |scenario|
  scenario_name = scenario.name
  if scenario.failed?
    $logger.info("SCENARIO STATUS = FAILED " + scenario_name + "\n")
  else
    $logger.info("SCENARIO STATUS = PASSED " + scenario_name + "\n")
  end
end

AfterStep do |result, test_step|
  stepName = test_step.text
  if result.passed?
    $logger.info("PASSED: " + stepName + "\n")
  else
    $logger.info("FAILED: " + stepName + "\n")
  end
end