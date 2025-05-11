FROM golang:1.21.0

WORKDIR /usr/src/app

COPY go.mod go.sum ./
COPY *.go ./
RUN go mod download


RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o myapp main.go parcel.go

CMD [ "/usr/src/app/myapp" ]
