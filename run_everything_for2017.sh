datacardFolder=$1 
python prepareShapesAndCards.py -o $datacardFolder -p histos_suitable_for_limits_200101v39_2017/training_0101010101/ #-rebinning 8
#for i in ${1}/H*t/*.dat; do sed -i 's/ttbb       1/ttbb       1.00 [0.5,2.0]/g' $i; done #for RateParam
#for i in ${1}/H*t/*.dat; do sed -i 's/ttcc       1/ttcc       1.00 [0.5,2.0]/g' $i; done #for RateParam
#for i in ${1}/H*t/*.dat; do sed -i 's/qcd        1/qcd        1 [0.5,2.0]/g' $i; done #for RateParam
python run_all_limits.py $datacardFolder
python plotLimitsPerCategory.py -limitfolder $datacardFolder #-unblind True
python printLimitLatexTable.py $datacardFolder False #unblind
python run_all_closureChecks.py $datacardFolder
python run_all_impacts.py $datacardFolder
python run_all_gatherFailedFits.py $datacardFolder
python run_all_postfits.py $datacardFolder
