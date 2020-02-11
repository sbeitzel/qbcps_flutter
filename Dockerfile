FROM google/dart

WORKDIR /app

ADD pubspec.* .
RUN pub get
COPY . .
RUN pub get --offline
RUN pub run test
