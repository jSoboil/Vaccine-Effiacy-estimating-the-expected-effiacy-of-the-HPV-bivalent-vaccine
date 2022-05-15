// Random Effects
// Pair-wise meta-analysis
// Binomial model, logit link
data {
 int <lower = 0> n_s;
 int <lower = 0> n_arms;
 vector[n_arms] y[n_s];
}
parameters {
 real mu_0[n_s];
 real delta[n_s];
 real tau[n_arms];
}
model {
 
}