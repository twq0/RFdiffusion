#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=1 nohup python /home/wjy/Software/RFdiffusion/scripts/run_inference.py inference.input_pdb=1.pdb inference.output_prefix=./opt 'contigmap.contigs=[65-65/0 B66-162]' inference.num_designs=1000 diffuser.T=50 diffuser.partial_T=20 > opt.log & 
