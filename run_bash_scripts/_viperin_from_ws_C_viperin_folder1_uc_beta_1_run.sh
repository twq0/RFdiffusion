#!/bin/bash

source activate SE3nv

CUDA_VISIBLE_DEVICES=0 python /home/wjy/Software/RFdiffusion-main/scripts/run_inference.py \
inference.input_pdb=../6b4c_A_0001.pdb \
inference.output_prefix=./uc-beta-1 \
'contigmap.contigs=[A1-259/0 45-80]' \
'ppi.hotspot_res=[A93,A199,A207]' \
denoiser.noise_scale_ca=1 denoiser.noise_scale_frame=1 \
inference.ckpt_override_path=/home/wjy/Software/RFdiffusion-main/models/Complex_beta_ckpt.pt \
inference.num_designs=1000 diffuser.T=20  > uc_0.log 2>&1
