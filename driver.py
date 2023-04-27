import csv
import abs_tools as ABS

abs_data = ABS.Abs_Actions.get_all()
compNames = []

for device in abs_data['data']:
    print(device)

with open('compNameList', 'w') as wf:
    write = csv.writer(wf)
    write.writerow(compNames)

with open('compNameList', newline='') as rf:
    read = csv.reader(rf)
    for col in read:
        for obj in col:
            print(obj)