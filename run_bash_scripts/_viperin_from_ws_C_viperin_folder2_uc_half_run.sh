#!/bin/bash

source activate SE3nv

CUDA_VISIBLE_DEVICES=1 python /home/wjy/Software/RFdiffusion-main/scripts/run_inference.py \
inference.input_pdb=../6b4c_A_0001.pdb \
inference.output_prefix=./uc-half \
'contigmap.contigs=[A1-259/0 45-80]' \
'ppi.hotspot_res=[A93,A199,A207]' \
denoiser.noise_scale_ca=0.5 denoiser.noise_scale_frame=0.5 \
inference.num_designs=1000 diffuser.T=20  > uc_half.log 2>&1
