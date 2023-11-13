#!/bin/bash
source activate SE3nv
nohup python /home/dell/software/RFdiffusion/scripts/run_inference.py inference.input_pdb=Initial_target.pdb \
inference.output_prefix=./outputs/uc-beta-1/uc-beta-1 'contigmap.contigs=[A1-154/0 B155-309/0 45-80]' 'ppi.hotspot_res=[B231,B230,A10,B207,A89,A63,A64,A88]' \
denoiser.noise_scale_ca=1 denoiser.noise_scale_frame=1 inference.num_designs=800 diffuser.T=50 \
inference.ckpt_override_path=/home/dell/software/RFdiffusion/models/Complex_beta_ckpt.pt > outputs/uc_beta_1.log 2>&1 &
