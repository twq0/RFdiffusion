#!/bin/bash
#source activate SE3nv
CUDA_VISIBLE_DEVICES=2 python ../scripts/run_inference.py 'contigmap.contigs=[A1-128/0 70-100]' inference.output_prefix=./1m47_binder inference.input_pdb=./1m47_fill.pdb inference.num_designs=1000 denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0 diffuser.T=20
#inference.ckpt_override_path=../models/Complex_beta_ckpt.pt
