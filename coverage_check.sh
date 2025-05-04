# Minimum value for coverage percent 
min_coverage=20

# Check if the coverage is good. Test will be passed if coverage value more or equal min_coverage 
coverage_check=$(fvm flutter pub run test_cov_console --pass=$min_coverage)

# If coverage_check was PASSED exit 0 
if [ "$coverage_check" == "PASSED" ] 
then 
  echo "Good coverage" 
  exit 0 
# else exit with error
else 
  echo "Coverage less than $min_coverage" 
  exit 1 
fi