FROM busybox

COPY postgrest.conf ./
RUN wget -O x https://github.com/PostgREST/postgrest/releases/download/v6.0.2/postgrest-v6.0.2-linux-x64-static.tar.xz && \
    tar xf x && \
    rm -f x && \
    adduser -D postgres

USER postgres

# see https://github.com/PostgREST/postgrest/blob/master/docker/Dockerfile
ENV PGRST_DB_URI= \
    PGRST_DB_SCHEMA=public \
    PGRST_DB_ANON_ROLE= \
    PGRST_DB_POOL=100 \
    PGRST_DB_EXTRA_SEARCH_PATH=public \
    PGRST_SERVER_HOST=*4 \
    PGRST_SERVER_PORT=3000 \
    PGRST_SERVER_PROXY_URI= \
    PGRST_JWT_SECRET= \
    PGRST_SECRET_IS_BASE64=false \
    PGRST_JWT_AUD= \
    PGRST_MAX_ROWS= \
    PGRST_PRE_REQUEST= \
    PGRST_ROLE_CLAIM_KEY=".role" \
    PGRST_ROOT_SPEC= \
    PGRST_RAW_MEDIA_TYPES=

EXPOSE 3000
CMD [ "./postgrest", "postgrest.conf" ]
