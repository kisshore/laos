FROM ubuntu
RUN apt-get update
RUN apt-get install gcc wget libcurl4-gnutls-dev libpq-dev libmagickwand-dev imagemagick nodejs libgeos-dev nodejs curl git software-properties-common build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server checkinstall libxml2-dev libxslt1-dev  libicu-dev logrotate nginx -y
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  apt-key add -
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo deb https://deb.nodesource.com/node_8.x xenial main > /etc/apt/sources.list.d/nodesource.list
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb &&  dpkg -i erlang-solutions_2.0_all.deb
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install  software-properties-common  postgresql-client-10 postgresql-contrib-10 postgresql-10 -y
RUN apt-get install esl-erlang elixir -y
RUN apt-get install nginx=1.14.* -y
RUN apt-get install nodejs -y
RUN mkdir /tmp/ruby
WORKDIR /tmp/ruby
RUN curl --progress https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz | tar xz
WORKDIR /tmp/ruby/ruby-2.4.1/
RUN ./configure --disable-install-rdoc
RUN make
RUN make install
RUN gem install bundler --no-ri --no-rdoc

EXPOSE 4001
ENV MIX_ENV=prod
