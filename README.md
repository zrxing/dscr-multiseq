# dscr-multiseq
A simulation study to benchmark the package multiseq, when run with different options under different scenarios. Current alternative method includes WaveQTL by Heejung Shim and Matthew Stephens.

# Background 

For a general introduction to DSCs, see [here](https://github.com/stephens999/dscr/blob/master/intro.md).

This dsc aims to benchmark the package multiseq for internal testing purposes. Different simulation scenarios can be considered, and different options for multiseq can be specified. WaveQTL (Heejung Shim and Matthew Stephens) is also included for testing and comparison purposes.



# Input, meta and output formats

This DSC uses the following formats:

`input: list(sim.data [matrix], g [vector])` #sim.data is a simulated matrix of Poisson or overdispersed Poisson counts. g contains the grouping indicator for each row of sim.data


`output: results from running multiseq [list] or WaveQTL [numeric]` 


# Scores

The performance of a method is determined by the log likelihood ratios for a given method, under null and alternative simulations. The final performance is given by the ROC curve generated based on the ranking of the log likelihood ratios under the null and the alternative.

See [score.R](score.R).

# To add a method

To add a method there are two steps.

- add a `.R` file containing an R function implenting that method to the `methods/` subdirectory
- add the method to the list of methods in the `methods.R` file.

Each method function must take arguments `(input,args)` where `input` is a list with the correct format (defined above), and `args` is a list containing any additional arguments the method requires.

Each method function must return `output`, where `output` is a list with the correct format (defined above).

# To add a scenario

To add a scenario there are two steps, the first of which can be skipped if you are using an existing datamaker function

- add a `.R` file containing an R function implenting a datamaker to the `datamakers/` subdirectory
- add the scenario to the list of scenarios in the `scenarios.R` file.

Each datamaker function must return a `list(input)` where `input` is a list with the correct format
(defined above).


