#!/bin/bash
source activate SE3nv
nohup python /home/dell/software/RFdiffusion/scripts/run_inference.py inference.input_pdb=Initial_target.pdb \
inference.output_prefix=./outputs/uc-1_100-150/uc-1-100-150 'contigmap.contigs=[A1-154/0 B155-309/0 100-150]' 'ppi.hotspot_res=[B231,B230,A10,B207,A89,A63,A64,A88]' \
denoiser.noise_scale_ca=1 denoiser.noise_scale_frame=1 inference.num_designs=1000 diffuser.T=20  > outputs/uc_1_100-150.log 2>&1 &
