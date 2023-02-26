#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from shutil import which
from subprocess import run
import os
from argparse import ArgumentParser


def stow_configs():
    if which("stow") is None:
        run(["apt-get", "install", "-y", "stow"])

    run(["stow", "fish"])
    run(["stow", "basic_vim"])
    run(["stow", "ranger"])
    run(["stow", "alacritty"])


def update():
    run(["apt-get", "update"])


def install_docker():
    update()

    required_programs = ["ca-certificates", "curl", "gnupg", "lsb-release"]
    run(["apt-get", "install"] + required_programs)

    cdocker_1 = """
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg \
            --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    """

    cdocker_2 = """
    echo \
        "deb [arch=$(dpkg --print-architecture) \
        signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee \
        /etc/apt/sources.list.d/docker.list > /dev/null
    """

    if which("docker") is None:
        docker_bins = "docker-ce docker-ce-cli containerd.io"
        os.system(cdocker_1)
        os.system(cdocker_2)
        run(["apt-get", "install"] + docker_bins.split(" "))

    if which("docker-compose") is None:
        command = """
            bash -c "curl -L \
            https://github.com/docker/compose/releases/download/\
            1.28.4/docker-compose-`uname -s`-`uname -m`\
            -o /usr/local/bin/docker-compose"
        """
        os.system(command)
        os.system("chmod +x /usr/local/bin/docker-compose")


def init_server():
    # install basic utilities

    required_programs = [
        "fish",
        "ranger",
        "neovim",
        "rsync",
        "unzip",
        "python3-pip"
    ]
    # Installs certificate on your server
    # run certbot --nginx to apply certificate
    required_programs.append("python3-certbot-nginx")

    update()
    run(["apt-get", "install"] + required_programs)

    print("Don't forget to change the shell to fish.")
    print("Run the following comannd: chsh -s /usr/bin/fish")
    print("Then restart the shell.")


def parse_args():
    parser = ArgumentParser()

    sub = parser.add_subparsers()

    stow = sub.add_parser("stow", help="stow config files")
    stow.set_defaults(func=stow_configs)

    ibasic = sub.add_parser("ibasic", help="install basic utilities")
    ibasic.set_defaults(func=init_server)

    idocker = sub.add_parser("idocker", help="install docker")
    idocker.set_defaults(func=install_docker)

    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    args.func()
