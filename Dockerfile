FROM base/archlinux

MAINTAINER Daniel Chen <chend@vt.edu>

RUN pacman -Syyu --noconfirm wget base-devel libx11 xorg-xhost

COPY test.cpp /test.cpp
RUN g++ test.cpp -lX11

COPY install_lens.sh /code/install_lens.sh
RUN cd /code && bash install_lens.sh

RUN echo "export LENSDIR=/code/Lens" >> ~/.bashrc && \
    echo "export HOSTTYPE=x86_64-linux" >> ~/.bashrc && \
    echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LENSDIR}/Bin/${HOSTTYPE}' >> ~/.bashrc && \
    echo 'export PATH=${PATH}:${LENSDIR}/Bin/${HOSTTYPE}' >> ~/.bashrc

CMD lens
