FROM mysql:5.7

COPY ./database-entrypoint /usr/local/bin/

RUN chmod +x /usr/local/bin/database-entrypoint

#RUN echo "[mysqld]" > /etc/mysql/conf.d/sqlmode.cnf
#RUN echo "sql_mode = STRICT_TRANS_TABLES,​NO_ZERO_IN_DATE,​NO_ZERO_DATE,​ERROR_FOR_DIVISION_BY_ZERO,​NO_AUTO_CREATE_USER,​NO_ENGINE_SUBSTITUTION" >> /etc/mysql/conf.d/sqlmode.cnf


ENTRYPOINT ["/usr/local/bin/database-entrypoint"]
