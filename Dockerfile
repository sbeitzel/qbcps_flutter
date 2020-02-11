FROM google/dart

WORKDIR /app

ADD pubspec.yaml /app/
RUN pub get
ADD . /app
RUN pub get --offline
RUN pub run test
