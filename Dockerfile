FROM postgres:latest

# Copy extracted PostgreSQL extension files
COPY .docker/lib/postgresql/ /usr/lib/postgresql/
COPY .docker/share/postgresql/ /usr/share/postgresql/

# Ensure permissions are correct
RUN chmod -R 755 /usr/lib/postgresql/ /usr/share/postgresql/

# Run PostgreSQL
CMD ["postgres"]
