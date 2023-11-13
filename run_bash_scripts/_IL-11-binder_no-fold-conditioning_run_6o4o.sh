#!/bin/bash
#source activate SE3nv
CUDA_VISIBLE_DEVICES=1 python ~/Software/RFdiffusion/scripts/run_inference.py 'contigmap.contigs=[A1-169/0 45-80]' inference.output_prefix=./6o4o_binder inference.input_pdb=./6O4O_clean.pdb inference.num_designs=1000 denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0 diffuser.T=20
#inference.ckpt_override_path=../models/Complex_beta_ckpt.pt
