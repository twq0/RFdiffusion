#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=1 nohup python /home/wjy/Software/RFdiffusion-main/scripts/run_inference.py \
inference.input_pdb=../Initial_target.pdb \
inference.output_prefix=./ntf2_half 'ppi.hotspot_res=[A62,A63,A88,A89,A110,B206,B230,B231]' scaffoldguided.scaffoldguided=True scaffoldguided.target_pdb=True scaffoldguided.target_path=../Initial_target.pdb \
scaffoldguided.scaffold_dir=/home/wjy/Workshop/twq/binder_design/scaffolds/NTF2-like_larger_than_1tp6 scaffoldguided.mask_loops=False \
denoiser.noise_scale_ca=0.5 denoiser.noise_scale_frame=0.5 inference.num_designs=2876 diffuser.T=20  > log & 
#CUDA_VISIBLE_DEVICES=3 nohup python /home/wjy/Software/RFdiffusion-main/scripts/run_inference.py inference.input_pdb=../Initial_target.pdb inference.output_prefix=./Top8k 'ppi.hotspot_res=[B231,B230,A10,B207,A89,A63,A64,A88]' scaffoldguided.scaffoldguided=True scaffoldguided.target_pdb=True scaffoldguided.target_path=../Initial_target.pdb scaffoldguided.scaffold_dir=/home/wjy/Workshop/twq/binder_design/scaffolds/Top8000_Hom50_TMcut50 scaffoldguided.mask_loops=False denoiser.noise_scale_ca=1 denoiser.noise_scale_frame=1 inference.num_designs=800 diffuser.T=20  > log & 
