FROM golang

ARG app_env
ENV APP_ENV $app_env

WORKDIR /go/src/app

COPY ./ .

RUN go get ./
RUN go build

CMD if [ ${APP_ENV} = production ]; \
	then \
	app; \
	else \
	go get github.com/pilu/fresh && \
	fresh; \
	fi
	
EXPOSE 8080