# Estimating the Expected Efficacy of the HPV Bivalent 16/18 Vaccine: a pairwise meta-analysis of Randomised Control Trial data using Stan

# Brief
This repository stores code used to estimate the expected efficacy of the HPV bivalent vaccine using Stan for the [BDA GSU](https://avehtari.github.io/BDA_course_Aalto/gsu2022.html) course project.

A hierarchical model was used to synthesise 11 Randomised Control Trials to estimate the efficacy of the bivalent HPV 16/18 strain vaccine. The expected posterior efficacy of the vaccine is estimated to be $\approx 92\%$, indicating that the bivalent 16/18 strain vaccine has a high-level of protection against the virus. However, the model suffers from poor Pareto-$\tilde{k}$ diagnostic values indicating that there is variation in the observed data that the model is unable to capture. Incorporating possible predictors, by fitting additional coefficients, would be beneficial. However, due to time constraints, this was not investigated further.