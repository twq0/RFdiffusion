#!/bin/bash

source activate SE3nv
CUDA_VISIBLE_DEVICES=0 python /home/wjy/Software/RFdiffusion-main/scripts/run_inference.py \
inference.input_pdb=../6b4c_A_0001.pdb \
inference.output_prefix=./ferr_0 \
'ppi.hotspot_res=[A93,A199,A207]' \
scaffoldguided.scaffoldguided=True \
scaffoldguided.target_pdb=True \
scaffoldguided.target_path=../6b4c_A_0001.pdb \
scaffoldguided.scaffold_dir=/home/wjy/Workshop/twq/binder_design/scaffolds/ferr \
scaffoldguided.mask_loops=False \
denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0 \
inference.num_designs=1000 diffuser.T=20  > log