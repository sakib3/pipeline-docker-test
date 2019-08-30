FROM centos:7

RUN yum install -y epel-release && \
    yum install -y iproute openconnect sudo gcc-c++ bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel which autoconf rsync git make

# Clean cache
RUN yum clean all

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV RBENV_ROOT=/usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH

# Install rbenv and ruby environment
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv && \
    echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh && \
    # ruby-build
    mkdir -p $RBENV_ROOT/plugins && \
    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build && \
    # install ruby
    export RUBY_VERSION='1.9.3-p484' && \
    export BUNDLER_VERSION='1.0.10' && \
    rbenv install $RUBY_VERSION && rbenv global $RUBY_VERSION && cd $RBENV_ROOT && src/configure && make -C src && \
    gem install bundler -v $BUNDLER_VERSION && rbenv rehash
    # Verify rbenv installation
    #curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
