FROM archlinux:base-devel

ARG username=riscv
ARG uid=1000
ARG gid=1000


RUN groupadd -g $gid -o $username && \
    useradd --system -u $uid -g $gid --create-home $username && \ 
    echo "${username} ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$username

RUN pacman-db-upgrade && \
    pacman-key --init && \
    pacman -Sy archlinux-keyring --noconfirm && \
    pacman -Syy --noconfirm && \
    pacman -S --noconfirm git gcc go base-devel

USER $username
WORKDIR /home/$username

#RUN git clone https://aur.archlinux.org/yay.git && \
#    cd yay && \
#    makepkg -sri --needed --noconfirm

COPY PKGBUILD /home/$username


#RUN echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -U 

RUN makepkg -si --noconfirm

