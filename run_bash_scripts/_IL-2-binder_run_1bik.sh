#!/bin/bash
#source activate SE3nv
CUDA_VISIBLE_DEVICES=1 python ../scripts/run_inference.py 'contigmap.contigs=[B1-110/0 70-100]' inference.output_prefix=./1bik_binder inference.input_pdb=./1bik_clean.pdb inference.num_designs=10 denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0
