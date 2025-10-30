#!/usr/bin/python3
# ruff: noqa: G004
from __future__ import annotations
import logging
import os

import requests
from requests.auth import HTTPBasicAuth

GENERAL_FORMAT = "%(asctime)s : %(levelname)s :%(module)s:%(lineno)s :" "%(message)s"
SYSLOG_FORMAT = "%(name)s:  %(levelname)s : %(message)s"


def setup_logger(
    name: str,
    *,
    log_file: str | None = None,
    console: bool = True,
    level: int = logging.INFO,
    general_format: str = GENERAL_FORMAT,
) -> logging.Logger:
    """Функция для установки множества логгеров.

    :param name: имя логгера.
    :param level: уровень логирования.
    :param tags: задания тэгов, используются для Loki
    """
    logger = logging.getLogger(name)


    if log_file is not None:
        # added File Handler for write log file
        handler = logging.FileHandler(log_file)
        formatter = logging.Formatter(general_format)
        handler.setFormatter(formatter)
        logger.addHandler(handler)

    if console:
        # added console logger
        shell = logging.StreamHandler()
        shell.setFormatter(logging.Formatter(general_format))
        logger.addHandler(shell)

    # setup level logging
    logger.setLevel(level)
    return logger




log = setup_logger(
    "manager_vm_bot",
    log_file="manage_vm.log",
    level=logging.DEBUG,
)


def upload_to_nexus(file:str, repo:str) -> None:

    user = os.getenv("NEXUS_USERNAME")
    if user:
        password = os.getenv("NEXUS_PASSWORD")
        auth = HTTPBasicAuth(user, password)

        with open(file, "rb") as f:
            files = {"files": f}
            headers = {"accept": "application/json",
                       "X-Nexus-UI": "true" }
            url= f"http://nexus-repository.mstornado.mst:8081/service/rest/v1/components?repository={repo}"
            log.debug(f"Send to {repo}")
            r = requests.post(url, files=files, headers=headers, auth=auth, timeout=15, verify=False)  #noqa: S501
            log.info(f"Code responce: {r.status_code}")
            log.info(f"Text responce: {r.text}")

#change version and build
control_template = """Package: rust-tools
Version: $VERSION
Section: utils
Priority: optional
Depends:
Architecture: amd64
Essential: no
Installed-Size: 20
Maintainer: titov32@gmail.com
Description: open source tools writen in rust
"""

os.system("dpkg-deb --build ./rust-tools")  #noqa: S607

upload_to_nexus("./rust-tools.deb", "astra-orel")
upload_to_nexus("./rust-tools.deb", "tornado-release")
