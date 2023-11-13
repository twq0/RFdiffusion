#!/bin/bash
source activate SE3nv
CUDA_VISIBLE_DEVICES=1 nohup python /home/wjy/Software/RFdiffusion/scripts/run_inference.py inference.input_pdb=Dimer-turnover-interface-binder_417_dldesign_2_af2pred.pdb inference.output_prefix=./417_2_pd 'contigmap.contigs=[60-60/0 B61-1058]' inference.num_designs=1000 diffuser.T=20 diffuser.partial_T=8 > diff.log & 
