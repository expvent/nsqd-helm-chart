SED = $(shell which gsed)
ifeq ("$(SED)", "")
SED = $(shell which sed)
endif

APP_VERSION = $(shell  cat VERSION | grep 'app=' | awk -F '=' '{print $$2}')
CHART_VERSION = $(shell cat VERSION | grep 'chart=' | awk -F '=' '{print $$2}')
UNAME_OS = $(shell uname -s)


.PHONY: helm
helm:
	helm cm-push ./charts/nsq helm-repo --app-version ${APP_VERSION} --version ${CHART_VERSION}