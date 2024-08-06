FROM ubuntu:latest

RUN apt update && apt install -y build-essential cmake git python3 python3-venv python3-pip wget
RUN cd /opt/ && wget https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz
RUN cd /opt/ && tar -C ./ -xf ./avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz  
RUN chown -R root:root /opt/avr8-gnu-toolchain-linux_x86_64
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install conan
RUN /opt/venv/bin/conan profile detect
RUN cd ~/.conan2/profiles && git clone https://github.com/Zombieanfuehrer/conan-profiles-linux.git

ENV PATH="/opt/avr8-gnu-toolchain-linux_x86_64/bin:/opt/venv/bin:${PATH}"

WORKDIR /firmware