# 4-Sampling-Survey-Design

## Simple Random Sampling for Digital Payment Behavior Survey
This project applies Simple Random Sampling (SRS) to stratified data to ensure proportional representation across genders. The dataset includes responses from students in the Mathematics Department, FMIPA UI, on their digital payment behavior and consumptive habits. Sampling calculations consider population size, standard deviation, and margin of error to determine the optimal sample size for each stratum.

## Key Methods
1. **Data Preprocessing**:
   - Data import and cleaning.
   - Stratification by gender (male and female).
2. **Sampling Design**:
   - Determined proportional sample sizes for each gender using the formula:
     ```R
     n <- round((N_pop * Sd^2)/((N_pop-1) * D^2 + Sd^2))
     ```
   - Simple Random Sampling (SRS) applied within each stratum using `sample_n()`.

## Output
- **Total Population**: 293 respondents.
- **Sample Sizes**:
  - Male: 34 respondents.
  - Female: 44 respondents.
- Results:
  - Generated stratified samples for males and females.
  - Saved sampled data to Excel files for further analysis.

## Data Source
- **Questionnaire**: Digital payment behavior and consumptive habits of Mathematics Department students at FMIPA UI.
