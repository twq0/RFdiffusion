#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=2 nohup python /home/wjy/Software/RFdiffusion/scripts/run_inference.py inference.input_pdb=1.pdb inference.output_prefix=./fold_cond 'ppi.hotspot_res=[A79,A80,C215]' scaffoldguided.scaffoldguided=True scaffoldguided.target_pdb=True scaffoldguided.target_path=./1.pdb scaffoldguided.scaffold_dir=/data3/Workshop/twq/RFdiffusion_root/scaffolds/cao2021_recommended_adj_secstruct/ferr scaffoldguided.mask_loops=False denoiser.noise_scale_ca=0.5 denoiser.noise_scale_frame=0.5 inference.num_designs=2000 diffuser.T=20  > log & 
