FROM base:pike
MAINTAINER duongmn@viettel.com.vn
LABEL openstack_version="pike"
ENV DEBIAN_FRONTEND noninteractive
ENV SERVICE octavia
#Clear cache apt
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update -y
#create folder
RUN mkdir -p /var/log/octavia \
        && mkdir -p /var/lib/octavia \
	&& mkdir -p /etc/octavia
#create user
RUN useradd --home-dir "/var/lib/octavia" \
        --create-home \
        --system \
        --shell /bin/false \
        octavia
#install git
RUN apt-get -y install --no-install-recommends python-setuptools python-dev gcc libssl-dev libffi-dev \
  && apt-get clean
#install octavia from source
RUN git clone https://github.com/openstack/octavia.git \
  && cd octavia \
  && git checkout stable/pike \
  && cp -R etc/* /etc/octavia \
  && pip --no-cache-dir install --upgrade  . \
  && rm -rf /octavia
#copy sudoer file
COPY octavia_sudoers /etc/sudoers.d/octavia_sudoers
#copy script
COPY copy_file.sh /usr/local/bin/copy_file.sh
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/*.sh
VOLUME ["/var/log/octavia", "/var/lib/octavia"]
EXPOSE 9876 5555
USER octavia
CMD ["start.sh"]
