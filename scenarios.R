sourceDir("datamakers")

#generates a simple baseline and effect
baseline.simple = rep(1, 1024)
effect.simple = rep(1, 1024)
effect.simple[500:600] = 2

addScenario(dsc_multiseq, name = "simple_base_simple_effect_null", fn = pois.2grp, args = list(m = 30, type = "null", baseline = baseline.simple, effect = effect.simple), seed = 1:100)
addScenario(dsc_multiseq, name = "simple_base_simple_effect_alt", fn = pois.2grp, args = list(m = 30, type = "alt", baseline = baseline.simple, effect = effect.simple), seed = 1:100)