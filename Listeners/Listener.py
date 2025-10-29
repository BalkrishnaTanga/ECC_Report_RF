from robot.libraries.BuiltIn import BuiltIn
from datetime import datetime
import shutil
import os
import subprocess

class Listener:

    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        shutil.rmtree('D:/Project/ECC_REPORT/output/allure')
        os.mkdir('D:/Project/ECC_REPORT/output/allure')


    

    def close(self):
        allure_dir_name = datetime.now().strftime(r"%Y%m%d%H%M%S")

        subprocess.run(f'allure generate --single-file --output ./allure-report/allure-{allure_dir_name} ./output/allure', shell=True)