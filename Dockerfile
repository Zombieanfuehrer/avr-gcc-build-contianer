FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    python3 \
    python3-venv \
    python3-pip \
    wget \
    doxygen \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

RUN cd /opt/ && wget https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz \
    && tar -C ./ -xf ./avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz \
    && rm ./avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz

RUN chown -R root:root /opt/avr8-gnu-toolchain-linux_x86_64

RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install conan>=2 \
    && /opt/venv/bin/conan profile detect

RUN rm -rf ~/.conan2/profiles && \
    git clone https://github.com/Zombieanfuehrer/conan-profiles-linux.git ~/.conan2/profiles && \
    cd ~/.conan2/profiles && \
    if [ -f "avr-mega328p" ] && [ -f "avr-mega328p_g" ]; then \
				rm default; \
        ln -s avr-mega328p_g default; \
    else \
        echo "Required files not found"; \
        exit 1; \
    fi


ENV PATH="/opt/avr8-gnu-toolchain-linux_x86_64/bin:/opt/venv/bin:${PATH}"

WORKDIR /workspace