#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=3 nohup python /home/wjy/Software/RFdiffusion/scripts/run_inference.py inference.input_pdb=6o4o_binder_959.pdb inference.output_prefix=./opt 'contigmap.contigs=[45-45/0 B46-214]' inference.num_designs=10000 diffuser.T=20 diffuser.partial_T=8 > opt.log & 
