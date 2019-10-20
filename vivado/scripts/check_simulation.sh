#from https://github.com/trivialmips/TrivialMIPS/blob/master/vivado/scripts/check_simulation.sh

grep "Fail" intomips.sim/sim_cpu/behav/xsim/simulate.log

if [ $? -eq 1 ]; then
    echo "CPU simulation succeeded."
else
    echo "CPU simulation failed. Please check log for more information."
    exit 1
fi