import glob, os, subprocess

##########################
calc_rmsd_filepath = '/data1/twq/Workshop/RFDiffusion/6VW1_repeat/calculate_rmsd.py'
##########################

def save_bb(filename,outdir):
    with open(filename, 'r') as f:
        lines = f.readlines()

    new_lines = []
    atom_number = 1
    for line in lines:
        if line.startswith("ATOM") and line[21] == 'A' and line[12:16].strip() == "CA":
            new_lines.append(line[:6] + "{:5d}".format(atom_number) + line[11:])
            atom_number += 1

    output_file_path = f"Backbone_{filename}"
    with open(outdir+'/'+output_file_path, 'w') as f:
        f.write("".join(new_lines))

def calc_rmsd(file1,file2): # TO-DO: save to log
    result = subprocess.getoutput(f'python {calc_rmsd_filepath} {file1} {file2}')
    return round(float(result),3)

if __name__ == '__main__':
    filelist = glob.glob('*.pdb')
    filenum = int(subprocess.getoutput('cat rawname.log | wc -l'))

    if not os.path.exists('backbone'):
        os.mkdir('backbone')
        print("saving backbone")
        for file in filelist:
            save_bb(file, 'backbone')
        print('finished')

    for i in range(1,filenum+1):
        file1 = subprocess.getoutput(f'ls backbone/*AF2_{i}.pdb')
        file2 = subprocess.getoutput(f'ls backbone/*design_{i}.pdb')
        rmsd = calc_rmsd(file1, file2)
        #print(f'index {i} rmsd {rmsd}')
        #print(f"sed '{i}s/$/ {rmsd}/' rawname.log")
        os.system(f"sed -i '{i}s/$/ {rmsd}/' rawname.log")
