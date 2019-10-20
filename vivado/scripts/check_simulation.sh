#from https://github.com/trivialmips/TrivialMIPS/blob/master/vivado/scripts/check_simulation.sh

grep "Fail" intomips.sim/${SIMULATION}/behav/xsim/simulate.log

if [ $? -eq 1 ]; then
    echo "$1 simulation succeeded."
else
    echo "$1 simulation failed. Please check log for more information."
    exit 1
fi