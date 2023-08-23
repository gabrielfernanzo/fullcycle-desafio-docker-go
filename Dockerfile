FROM golang:1.21 as build
WORKDIR /src
COPY . .
RUN go build -o /bin/app ./main.go

FROM scratch
COPY --from=build /bin/app /bin/app
CMD ["/bin/app"]