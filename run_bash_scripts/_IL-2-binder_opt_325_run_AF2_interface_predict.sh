#!/bin/bash
source activate dl_binder_design
CUDA_VISIBLE_DEVICES=2 /home/wjy/Software/dl_binder_design/af2_initial_guess/interfaceAF2predict.py -silent out.silent
