import os, subprocess

#os.environ['CALC_RMSD'] = ''

###########################################
prefix = os.path.basename(os.getcwd()) + '_'
rootdir = os.path.abspath('./')
filter_metrics = 'NR>1 && $2<5'
###########################################


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
        tmpout = subprocess.getoutput(f"awk '{filter_metrics} {{print $9}}' out.sc").split('\n')
        scoreout = subprocess.getoutput(f"awk '{filter_metrics} {{print $2}}' out.sc").split('\n')

        if len(tmpout) == 1 and len(tmpout[0]) == 0:
            os.chdir(rootdir)
            continue

        #print(f'len tmpout = {len(tmpout)}, tmpout 0 = {tmpout[0]}, len tmpout 0 = {len(tmpout[0])}')
        tmpout_clean = []
        for i in tmpout:
            tmpout_clean.append(i[0:i.rfind('_dldesign')])

        for i in zip(tmpout, tmpout_clean, scoreout):
            #print(i)
            if 'out.silent' in files:
                print(f'old school {root}')
                subprocess.getoutput(f'silentextractspecific out.silent {i[0]}')
                subprocess.getoutput(f'cp {root}/{i[0]}.pdb {rootdir}/passed/{prefix}AF2_{startindex}.pdb')
                subprocess.getoutput(f'cp {root}/{i[1]}.pdb {rootdir}/passed/{prefix}design_{startindex}.pdb')
                with open(f'{rootdir}/passed/rawname.log', 'a+') as fo:
                    fo.write(f'{startindex} {i[0]} {i[2]}\n')
                startindex += 1
            elif 'af2' in dirs:
                print(f'new school {root}')
                subprocess.getoutput(f'cp {root}/af2/{i[0]}.pdb {rootdir}/passed/{prefix}AF2_{startindex}.pdb')
                subprocess.getoutput(f'cp {root}/../{i[1]}.pdb {rootdir}/passed/{prefix}design_{startindex}.pdb')
                with open(f'{rootdir}/passed/rawname.log' , 'a+') as fo:
                    fo.write(f'{startindex} {i[0]} {i[2]}\n')
                startindex += 1
    os.chdir(rootdir)
