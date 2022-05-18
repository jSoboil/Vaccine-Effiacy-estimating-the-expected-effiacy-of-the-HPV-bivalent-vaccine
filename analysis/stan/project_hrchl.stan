// Random Effects
// Pair-wise meta-analysis
// Binomial model, logit link
data {
 int <lower = 0> n_s;
 int <lower = 0> y_0[n_s];
 int <lower = 0> n_0[n_s];
 int <lower = 0> y_1[n_s];
 int <lower = 0> n_1[n_s];
}
parameters {
 real psi;
 real mu[n_s];
 real delta[n_s];
 real <lower = 0> tau;
}
transformed parameters {
 real p_eff;
 real odds_eff;
 // anti-logit
 odds_eff = exp(psi);         // transform log-odds ratio to odds-ratio
 p_eff = 1 / (1 + odds_eff);  // transform odds ratio to probability
}
model {
 // hyperpriors
 psi ~ normal(0.85, 1);     // populatiuon-level ATE (Kamolratanakul S. et al)
 tau ~ inv_chi_square(5);   // populatiuon-level stdev
 // priors
 for (i in 1:n_s) {
  // group-level random effect (Matthijsse S. et al)
  mu[i] ~ normal(-1.38, 0.7);
  // group-level average treatment effect (ATE)
  delta[i] ~ student_t(2, psi, tau);
  // control: binomial likelihood with logit link
  y_0[i] ~ binomial_logit(n_0[i], mu[i]);
  // vaccine: binomial likelihood with logit link
  y_1[i] ~ binomial_logit(n_1[i], mu[i] + delta[i]);
 }
}
// End file
