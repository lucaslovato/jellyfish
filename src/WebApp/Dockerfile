FROM registry.gitlab.com/brick-abode-developers/fee/year/year-ap-dev

ARG docker_user

RUN useradd -ms /bin/bash app -u ${docker_user}

USER app

VOLUME ["/home/app/app"]

WORKDIR /home/app/app/src/WebApp

EXPOSE 5000

ENTRYPOINT ["./entrypoint.sh"]
