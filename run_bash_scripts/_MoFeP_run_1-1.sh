#!/bin/bash
source activate SE3nv
nohup python /home/dell/software/RFdiffusion/scripts/run_inference.py \
  inference.output_prefix=outputs/1-1/7ut8B_truncated_1-1 \
  inference.input_pdb=7ut8B_truncated_epitope_0001.pdb \
  'contigmap.contigs=[A1-100/0 45-80]' \
  'ppi.hotspot_res=[A48,A49,A67,A69]' \
  inference.num_designs=500 \
  denoiser.noise_scale_ca=0 \
  denoiser.noise_scale_frame=0 \
  diffuser.T=50 \
  > outputs/1-1/diff.log 2>&1 &
