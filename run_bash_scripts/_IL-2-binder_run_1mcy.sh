#!/bin/bash
#source activate SE3nv
CUDA_VISIBLE_DEVICES=2 python ../scripts/run_inference.py 'contigmap.contigs=[A1-154/0 70-100]' inference.output_prefix=./1mcy_binder inference.input_pdb=./1mcy_clean.pdb inference.num_designs=10 denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0
