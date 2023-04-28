import csv
import abs_tools as ABS
import subprocess, sys

abs_data = ABS.Abs_Actions.get_all()

with open('compNameList.csv', 'w') as wf:
    write = csv.writer(wf)
    write.writerow(['Name'])
    for device in abs_data['data']:
        if 'deviceName' in device:
            write.writerow([device['deviceName']])

with open('compNameList.csv', newline='') as rf:
    read = csv.reader(rf)
    for col in read:
        for obj in col:
            print(obj)

setup_script = 'ps_tools.ps1'

p = subprocess.run([
    "powershell.exe", 
    "-File", 
    setup_script,
],
stdout=sys.stdout)