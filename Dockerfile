FROM python:latest
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
RUN pip install psycopg2
COPY manager manager
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]
CMD python -m manager