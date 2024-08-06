FROM ubuntu:latest

RUN apt update && apt install -y build-essential cmake git python3 python3-venv python3-pip wget
RUN cd /opt/ && wget https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz
RUN cd /opt/ && tar -C ./ -xf ./avr8-gnu-toolchain-3.7.0.1796-linux.any.x86_64.tar.gz  
RUN chown -R root:root /opt/avr8-gnu-toolchain-linux_x86_64
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install conan

# Detect conan profile
RUN /opt/venv/bin/conan profile detect

# Clone conan profiles and check for specific files
RUN rm -rf ~/.conan2/profiles && \
    git clone https://github.com/Zombieanfuehrer/conan-profiles-linux.git ~/.conan2/profiles && \
    cd ~/.conan2/profiles && \
    if [ -f "avr-mega328p" ] && [ -f "avr-mega328p_g" ]; then \
        ln -s avr-mega328p_g default; \
    else \
        echo "Required files not found"; \
        exit 1; \
    fi

# Add venv bin directory to PATH
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /firmware