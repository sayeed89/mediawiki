FROM 8801302644/unify-iscan:working

WORKDIR /app

COPY . ./iscan/

RUN chmod +x /app/iscan/entrypoint.sh
#CMD ["./main", "scan", "-p", "/app/iscan", "--report-formats", "html", "-o", "./results"]

ENTRYPOINT [/app/iscan/entrypoint.sh]
