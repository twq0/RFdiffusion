#!/bin/bash
#source activate SE3nv
CUDA_VISIBLE_DEVICES=3 python ../scripts/run_inference.py 'contigmap.contigs=[A1-190/0 70-100]' inference.output_prefix=./3hhr_binder inference.input_pdb=./3hhr_fillloop.pdb inference.num_designs=10 denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0
