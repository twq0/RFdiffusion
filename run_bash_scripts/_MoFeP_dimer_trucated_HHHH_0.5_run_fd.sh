#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=0 nohup python /home/wjy/Software/RFdiffusion-main/scripts/run_inference.py inference.input_pdb=../Initial_target.pdb inference.output_prefix=./hhhh_0.5 'ppi.hotspot_res=[B231,B230,A10,B207,A89,A63,A64,A88]' scaffoldguided.scaffoldguided=True scaffoldguided.target_pdb=True scaffoldguided.target_path=../Initial_target.pdb scaffoldguided.scaffold_dir=/home/wjy/Workshop/twq/binder_design/scaffolds/HHHH scaffoldguided.mask_loops=False denoiser.noise_scale_ca=0.5 denoiser.noise_scale_frame=0.5 inference.num_designs=1000 diffuser.T=20  > log & 
