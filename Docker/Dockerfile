# Base image
FROM base_image:tag

# Set environment variables
ENV KEY=VALUE \
    ANOTHER_KEY=ANOTHER_VALUE

# Set the working directory
WORKDIR /app

# Copy files from the host to the container's working directory
COPY source_file_or_directory destination_directory/

# Install dependencies or run commands (use the appropriate package manager for your base image)
RUN command_to_install_dependencies

# Expose ports
EXPOSE 80 443

# Define the default command to run when the container starts
CMD ["command", "arg1", "arg2"]

# Add metadata to the image
LABEL key="value"

# Define a volume
VOLUME /data

# User for subsequent commands
USER username

# Execute a command at runtime
ENTRYPOINT ["command", "arg1", "arg2"]
