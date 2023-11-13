#!/bin/bash
source activate dl_binder_design
/data3/Softwares/silent_tools/silentfrompdbs *.pdb > my_designs.silent
CUDA_VISIBLE_DEVICES=2 python /home/wjy/Software/dl_binder_design/mpnn_fr/dl_interface_design.py -silent my_designs.silent -output_intermediates -checkpoint_path /home/wjy/Software/dl_binder_design/mpnn_fr/ProteinMPNN/vanilla_model_weights/v_48_020.pt
