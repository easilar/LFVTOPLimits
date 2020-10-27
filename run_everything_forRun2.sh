datacardFolder=$1
#python prepareRun2Combine.py -o $datacardFolder
python prepareRun2Combine.py -o $datacardFolder -p16 datacards_200101_2016v16_rebinttbbccRateBjets -p17 datacards_200101_2017v39_ttbbccRateBjets -p18 datacards_200101_2018v39_ttbbccRateBjets
#python prepareRun2Combine.py -o $datacardFolder -p16 datacards_200101_2016v16_rebinttbbccRateBjets_nobbb -p17 datacards_200101_2017v39_ttbbccRateBjets_nobbb -p18 datacards_200101_2018v39_ttbbccRateBjets_nobbb
python run_all_limits.py $datacardFolder
python plotLimitsPerCategory.py -lumi 137.2  -limitfolder $datacardFolder #For 161718  b2j3-b4j4
#python plotLimitsPerCategory.py -lumi 137.2 -printlimits True -limitfolder $datacardFolder #For 161718, 1718, 1617
python printLimitLatexTable.py $datacardFolder #For 161718 b2j3-b4j4
#python printLimitLatexTable.py $datacardFolder False #For 161718, 1718, 1617
python run_all_closureChecks.py $datacardFolder
python run_all_impacts.py $datacardFolder
python run_all_gatherFailedFits.py $datacardFolder
#python run_all_postfits.py $datacardFolder