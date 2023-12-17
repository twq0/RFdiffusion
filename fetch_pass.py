import os, subprocess

prefix = 'apyrase_binder_'
rootdir = os.path.abspath('./')

if not os.path.exists('passed'):
    os.mkdir('passed')

startindex = 0
for i in os.listdir('passed'):
    print(i)
    if prefix in i:
        try:
            startindex = max(startindex, int(i.split('_')[-1].split('.')[0].strip()))
        except:
            pass
startindex += 1

for root, dirs, files in os.walk('./'):
    root = os.path.abspath(root)
    if 'out.sc' in files:
        os.chdir(root)
        tmpout = subprocess.getoutput("awk 'NR>1 && $3<10 && $5>80 {print $9}' out.sc").split('\n')
        pae = subprocess.getoutput("awk 'NR>1 && $3<10 && $5>80 {print $3}' out.sc").split('\n')
        plddt = subprocess.getoutput("awk 'NR>1 && $3<10 && $5>80 {print $5}' out.sc").split('\n')

        if len(tmpout) == 1 and len(tmpout[0]) == 0:
            os.chdir(rootdir)
            continue

        #print(f'len tmpout = {len(tmpout)}, tmpout 0 = {tmpout[0]}, len tmpout 0 = {len(tmpout[0])}')
        tmpout_clean = []
        for i in tmpout:
            tmpout_clean.append(i[0:i.rfind('_dldesign')])

        for i in zip(tmpout, tmpout_clean, pae, plddt):
            #print(i)
            if 'out.silent' in files:
                print(f'old school {root}')
                subprocess.getoutput(f'silentextractspecific out.silent {i[0]}')
                subprocess.getoutput(f'cp {root}/{i[0]}.pdb {rootdir}/passed/{prefix}AF2_{startindex}.pdb')
                subprocess.getoutput(f'cp {root}/{i[1]}.pdb {rootdir}/passed/{prefix}design_{startindex}.pdb')
                with open(f'{rootdir}/passed/rawname.log', 'a+') as fo:
                    fo.write(f'{startindex} {i[0]} {i[2]} {i[3]}\n')
                startindex += 1
            elif 'af2' in dirs:
                print(f'new school {root}')
                subprocess.getoutput(f'cp {root}/af2/{i[0]}.pdb {rootdir}/passed/{prefix}AF2_{startindex}.pdb')
                subprocess.getoutput(f'cp {root}/../{i[1]}.pdb {rootdir}/passed/{prefix}design_{startindex}.pdb')
                with open(f'{rootdir}/passed/rawname.log' , 'a+') as fo:
                    fo.write(f'{startindex} {i[0]} {i[2]} {i[3]}\n')
                startindex += 1
    os.chdir(rootdir)
