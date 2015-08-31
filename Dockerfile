# 2015-8-31
# Adapted from https://intercityup.com/blog/deploy-rails-app-including-database-configuration-env-vars-assets-using-docker.html

FROM phusion/passenger-ruby22:latest
MAINTAINER Daniel Bidulock "daniel@capitolhill.ca"

# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV production

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Start Nginx and Passenger
EXPOSE 80
RUN rm -f /etc/service/nginx/down

# Configure Nginx
RUN rm /etc/nginx/sites-enabled/default
ADD docker/rails-devise-template.conf /etc/nginx/sites-enabled/rails-devise-template.conf
ADD docker/postgres-env.conf /etc/nginx/main.d/postgres-env.conf

# Install the app
ADD . /home/app/rails-devise-template
WORKDIR /home/app/rails-devise-template
RUN chown -R app:app /home/app/rails-devise-template 
RUN sudo -u app bundle install --deployment
# 2015-8-31
# This needs to change. It shouldn't install with `sudo`
RUN sudo npm install
RUN sudo -u app RAILS_ENV=production rake assets:precompile

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
