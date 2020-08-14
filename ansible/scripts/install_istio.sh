#! /bin/bash
export PATH=~/istio/bin:$PATH
cd ~/istio
istioctl manifest apply --set profile=demo
