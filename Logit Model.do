gen win=.
replace win=1 if winmargin>0
replace win=0 if winmargin<0
gen higher_seed=.
replace higher_seed=1 if seed<opp_seed
replace higher_seed=0 if seed>opp_seed
logit win higher_seed
logit win higher_seed winpercent opp_win
gen windiff=winpercent-opp_win
logit win higher_seed windiff
logit win higher_seed previoustournament tournamenttwoyearsback opp_previoustournament opp_tournamenttwoyearsback
test higher_seed=0
logit win higher_seed i.round
*Relative value for higher seed in later rounds 
