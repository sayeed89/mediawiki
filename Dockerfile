FROM 8801302644/unify-iscan:working

WORKDIR /app

COPY . ./iscan/

CMD ["./main", "scan", "-p", "/app/iscan", "--report-formats", "html", "-o", "./results"]
