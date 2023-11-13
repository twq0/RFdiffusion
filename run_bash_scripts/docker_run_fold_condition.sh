#!/bin/bash
docker run -id --rm --gpus all \
  -v /data1/twq/Workshop/RFDiffusion/models:/models \
  -v /data1/twq/Workshop/RFDiffusion/MoFe-tetramer-interface/outputs_pdb_foldseek_1526_0:/outputs \
  -v /data1/twq/Workshop/RFDiffusion/MoFe-tetramer-interface/inputs:/inputs \
  -v /data1/twq/Workshop/RFDiffusion/data/scaffolds/PDB_foldseek_1526:/scaffolds \
  rfdiffusion \
  inference.output_prefix=/outputs/pdb_foldseek_0 \
  inference.model_directory_path=/models \
  inference.input_pdb=/inputs/7ut6_SF4_range20_0001.pdb \
  inference.num_designs=1526 \
  'ppi.hotspot_res=[B231,B230,A10,B207,A89,A63,A64,A88]' \
  denoiser.noise_scale_ca=0 \
  denoiser.noise_scale_frame=0 \
  diffuser.T=20 \
  scaffoldguided.mask_loops=False \
  scaffoldguided.scaffoldguided=True \
  scaffoldguided.target_path=/inputs/7ut6_SF4_range20_0001.pdb \
  scaffoldguided.scaffold_dir=/scaffolds \
  scaffoldguided.target_pdb=True
