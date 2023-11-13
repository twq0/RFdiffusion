#!/bin/bash
#source activate SE3nv
CUDA_VISIBLE_DEVICES=3 python ../scripts/run_inference.py 'contigmap.contigs=["71-71/0 128-128"]' 'contigmap.provide_seq=[71-198]' inference.output_prefix=./1m47_binder_7_partialT inference.input_pdb=./1m47_binder_7.pdb inference.num_designs=10000 diffuser.T=20 diffuser.partial_T=8 inference.ckpt_override_path=../models/Complex_beta_ckpt.pt
