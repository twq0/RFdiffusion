#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=3 nohup python \
/home/wjy/Software/RFdiffusion/scripts/run_inference.py \
inference.input_pdb=1fap_A.pdb \
inference.output_prefix=./1FAP_A_fd \
'ppi.hotspot_res=[A36,A48,A59,A99]' \
scaffoldguided.scaffoldguided=True \
scaffoldguided.target_pdb=True \
scaffoldguided.target_path=./1fap_A.pdb \
scaffoldguided.scaffold_dir=/data3/Workshop/twq/RFdiffusion_root/scaffolds/cao2021_recommended_adj_secstruct/ \
scaffoldguided.mask_loops=False \
denoiser.noise_scale_ca=0.5 \
denoiser.noise_scale_frame=0.5 \
inference.num_designs=2000 \
diffuser.T=20  > log & 
# scaffoldguided.scaffold_list=./select.txt 
