#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=2 nohup python /home/wjy/Software/RFdiffusion/scripts/run_inference.py \
inference.input_pdb=../Initial_target.pdb \
inference.output_prefix=./ntf2_1 'ppi.hotspot_res=[A62,A63,A88,A89,A110,B206,B230,B231]' scaffoldguided.scaffoldguided=True scaffoldguided.target_pdb=True scaffoldguided.target_path=../Initial_target.pdb \
scaffoldguided.scaffold_dir=/data3/Workshop/twq/RFdiffusion_root/scaffolds/NTF2-like_larger_than_1tp6 scaffoldguided.mask_loops=False \
denoiser.noise_scale_ca=1 denoiser.noise_scale_frame=1 inference.num_designs=2876 diffuser.T=20  > log & 
