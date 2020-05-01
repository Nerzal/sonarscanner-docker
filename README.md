# sonarscanner-docker
sonarscanner docker image


## Run sonarqube
Example usage using go and handing in custom linter results aswell as coverage report

```
FROM nerzal/sonarscanner-docker:latest as sonarqube
ARG PROJECT_PATH
ENV PROJECT_PATH=$PROJECT_PATH
ARG SERVICE_NAME
ARG BRANCH_NAME
ARG SONAR_KEY
COPY --from=build /go/src/ /go/src/
COPY --from=lint ${PROJECT_PATH}/report.xml ${PROJECT_PATH}/report.xml
COPY --from=test ${PROJECT_PATH}/coverage.out  ${PROJECT_PATH}/coverage.out
WORKDIR ${PROJECT_PATH}
RUN chmod +x pushSonarqube.sh; sync \
&& ./pushSonarqube.sh ${SERVICE_NAME} ${SONAR_KEY} ${BRANCH_NAME}
```