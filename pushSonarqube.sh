#!/bin/sh
echo "#################### Report To Sonarqube ####################"
echo "#################### Branch is $3 ####################" 
if [ "$3" != 'master' ]; then
    echo "#################### Branch is not master. Skipping... ####################"    
    exit 0
fi
/usr/bin/sonar-scanner -Dsonar.projectKey=$1 -Dsonar.sources=. -Dsonar.host.url=https://sonarcloud.io -Dsonar.login="$2" -Dsonar.organization=example -Dsonar.go.coverage.reportPaths="coverage.out"  -Dsonar.exclusions="**/vendor/**,**/*_test.go,config/**,docs/**,resources/**,**/*.html,tests/**,**/*.xml,**/*.json,**/*.yml,**/*.mod,**/*.sum,*.sh,**/*.md,**/*.orig,**/*.yaml" -Dsonar.tests="." -Dsonar.test.inclusions="**/*_test.go"  -Dsonar.test.exclusions="**/vendor/**,config/**,docs/**,resources/**" -Dsonar.go.golangci-lint.reportPaths="report.xml"
# Use the following line to debug
#/usr/bin/sonar-scanner -X -Dsonar.projectKey=$1 -Dsonar.sources=. -Dsonar.host.url=https://sonarcloud.io -Dsonar.login="$2" -Dsonar.organization=example -Dsonar.go.coverage.reportPaths="coverage.out"  -Dsonar.exclusions="**/vendor/**,**/*_test.go,config/**,docs/**,resources/**" -Dsonar.tests="." -Dsonar.test.inclusions="**/*_test.go"  -Dsonar.test.exclusions="**/vendor/**,config/**,docs/**,resources/**"
if [ $? -eq 1 ]; then
    echo "#################### Report To Failed ####################"    
    exit 1
fi
echo "#################### Finished Reporting To Sonarqube ####################"