FROM 489437247049.dkr.ecr.us-east-1.amazonaws.com/pyroscope:dev as pyroscope

FROM ruby:2.7.1

COPY . /app/src
WORKDIR /app/src
RUN gem install bundler
RUN bundle update --bundler
RUN bundle install
COPY --from=pyroscope /usr/bin/pyroscope /usr/bin/pyroscope
ENTRYPOINT ["/usr/bin/pyroscope", "exec", "ruby"]
