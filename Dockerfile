FROM ruby:2.2.6

EXPOSE 4567

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN gem install bundler && bundle install

CMD ["/bin/bash"]
