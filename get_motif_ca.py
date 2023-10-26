#import os, argparse
import glob, subprocess, os
from pymol import cmd
from pymol.commanding import reinitialize
#########################
#Align af2 models to natives, calculate rms_fit with motif.
#########################
filenum = int(subprocess.getoutput('cat rawname.log | wc -l'))
native = '6vw1_A.pdb'
raw_range = '24-42/64-82'

resi_sele = ' or '.join([f'resi {i}'for i in raw_range.split('/')])

for i in range(1,filenum+1):
    af2_model = subprocess.getoutput(f'ls *_AF2_{i}.pdb')
    cmd.load(native, 'native')
    cmd.load(af2_model, 'af2_model')
    cmd.align('native', 'af2_model and chain A')
    motif_ca_rmsd = round(cmd.align('native and ('+resi_sele+') and name CA', 'af2_model and chain A and name CA', cycles=0)[0], 3)
    os.system(f"sed -i '{i}s/$/ {motif_ca_rmsd}/' rawname.log")
    print(f'index {i} finish: {motif_ca_rmsd}')
    reinitialize()


#parser = argparse.ArgumentParser()
#parser.add_argument('--native', type=str, required=True)
#parser.add_argument('--af2_model', type=str, required=True)
#parser.add_argument('--motif_range', type=str, required=True, help='Separate by slash(/)')

#args = parser.parse_args()
#cmd.load(args.native, 'native')
#cmd.load(args.af2_model, 'af2_model')
