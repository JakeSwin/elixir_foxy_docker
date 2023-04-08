FROM osrf/ros:foxy-desktop

RUN apt update && apt install -y -q --allow-unauthenticated software-properties-common curl git sudo unzip erlang-inets erlang-os-mon erlang-runtime-tools erlang-ssl erlang-xmerl erlang-dev erlang-parsetools

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN bash -c 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"; \ 
		brew install elixir; \
		mix do local.rebar --force, local.hex --force; \
		mix escript.install hex livebook'
# RUN bash -c "source /opt/ros/foxy/setup.bash"
# RUN /ros_entrypoint.sh
COPY ./fastrtps-profile.xml /
COPY ./entrypoint.sh /
ENV FASTRTPS_DEFAULT_PROFILES_FILE=/fastrtps-profile.xml
ENV LANG="en_US.uft8"
ENV LC_ALL="en_US.utf8"
ENTRYPOINT [ "/entrypoint.sh" ]
