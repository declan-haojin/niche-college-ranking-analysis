# load packages and data--------------------------------------------------------
library(tidyverse)

niche_data_500 <- read_csv("data/niche_data_500.csv")
us_dep_of_ed <- read_csv("data/us_dep_of_ed.csv", na = c("NULL", "PrivacySuppressed"))

# fix college names ------------------------------------------------------------

us_dep_of_ed <- us_dep_of_ed |>
  mutate(
    INSTNM = case_when(
      INSTNM == "Columbia University in the City of New York" ~
        "Columbia University",

      INSTNM == "Washington University in St Louis" ~
        "Washington University in St. Louis",

      INSTNM == "University of California-Los Angeles" ~
        "University of California - Los Angeles",

      INSTNM == "University of Michigan-Ann Arbor" ~
        "University of Michigan - Ann Arbor",

      INSTNM == "Georgia Institute of Technology-Main Campus" ~
        "Georgia Institute of Technology",

      INSTNM == "University of Virginia-Main Campus" ~
        "University of Virginia",

      INSTNM == "United States Military Academy" ~
        "United States Military Academy at West Point",

      INSTNM == "The University of Texas at Austin" ~
        "University of Texas - Austin",

      INSTNM == "University of California-Berkeley" ~
        "University of California - Berkeley",

      INSTNM == "University of California-Irvine" ~
        "University of California - Irvine",

      INSTNM == "University of California-San Diego" ~
        "University of California - San Diego",

      INSTNM == "University of California-Davis" ~
        "University of California - Davis",

      INSTNM == "University of California-Santa Barbara" ~
        "University of California - Santa Barbara",

      INSTNM == "University of California-Santa Cruz" ~
        "University of California - Santa Cruz",

      INSTNM == "University of California-Riverside" ~
        "University of California - Riverside",

      INSTNM == "University of North Carolina Wilmington" ~
        "University of North Carolina - Wilmington",

      INSTNM == "University of North Carolina at Greensboro" ~
        "University of North Carolina - Greensboro",

      INSTNM == "Albany College of Pharmacy and Health Sciences" ~
        "Albany College of Pharmacy & Health Sciences",

      INSTNM == "Arizona State University Campus Immersion" ~
        "Arizona State University",

      INSTNM == "Arizona State University-Downtown Phoenix" ~
        "Arizona State University - Downtown Phoenix Campus",

      INSTNM == "Augustana College" ~
        "Augustana College - Illinois",

      UNITID == "173160" ~
        "Bethel University - Minnesota",

      INSTNM == "Binghamton University" ~
        "Binghamton University, SUNY",

      INSTNM == "Bowling Green State University-Main Campus" ~
        "Bowling Green State University",

      INSTNM == "California Polytechnic State University-San Luis Obispo" ~
        "California Polytechnic State University (Cal Poly) - San Luis Obispo",

      INSTNM == "California State University-Fullerton" ~
        "California State University - Fullerton",

      INSTNM == "California State University-Long Beach" ~
        "California State University - Long Beach",

      INSTNM == "The College of Wooster" ~
        "College of Wooster",

      INSTNM == "Colorado State University-Fort Collins" ~
        "Colorado State University",

      INSTNM == "Concordia University-Wisconsin" ~
        "Concordia University - Wisconsin",

      INSTNM == "CUNY Bernard M Baruch College" ~
        "CUNY Baruch College",

      INSTNM == "CUNY City College" ~
        "CUNY City College of New York",

      INSTNM == "D'Youville College" ~
        "D'Youville",

      INSTNM == "Eastern New Mexico University-Main Campus" ~
        "Eastern New Mexico University",

      INSTNM == "Embry-Riddle Aeronautical University-Daytona Beach" ~
        "Embry-Riddle Aeronautical University - Daytona Beach",

      INSTNM == "Embry-Riddle Aeronautical University-Worldwide" ~
        "Embry-Riddle Aeronautical University - Worldwide",

      INSTNM == "Florida Agricultural and Mechanical University" ~
        "Florida A&M University",

      INSTNM == "Franklin and Marshall College" ~
        "Franklin & Marshall College",

      INSTNM == "Hobart William Smith Colleges" ~
        "Hobart and William Smith Colleges",

      INSTNM == "Indiana University-Bloomington" ~
        "Indiana University - Bloomington",

      INSTNM == "Indiana University-East" ~
        "Indiana University - East",

      INSTNM == "Indiana University-Purdue University-Indianapolis" ~
        "Indiana University-Purdue University - Indianapolis (IUPUI)",

      INSTNM == "Indiana Wesleyan University-Marion" ~
        "Indiana Wesleyan University",

      INSTNM == "Keiser University-Ft Lauderdale" ~
        "Keiser University - Fort Lauderdale",

      INSTNM == "Kent State University at Kent" ~
        "Kent State University",

      INSTNM == "Louisiana State University and Agricultural & Mechanical College" ~
        "Louisiana State University",

      UNITID == "151786" ~
        "Marian University Indianapolis",

      INSTNM == "Maryville University of Saint Louis" ~
        "Maryville University",

      INSTNM == "Metropolitan State University" ~
        "Metropolitan State University - Minnesota",

      INSTNM == "Miami University-Oxford" ~
        "Miami University",

      INSTNM == "Minnesota State University-Mankato" ~
        "Minnesota State University, Mankato",

      INSTNM == "Molloy College" ~
        "Molloy University",

      INSTNM == "Monroe College" ~
        "Monroe College - Bronx/New Rochelle",

      INSTNM == "Mount Saint Mary's University" ~
        "Mount Saint Mary's University Los Angeles",

      INSTNM == "New Mexico State University-Main Campus" ~
        "New Mexico State University",

      INSTNM == "New Mexico Institute of Mining and Technology" ~
        "New Mexico Tech",

      INSTNM == "North Carolina State University at Raleigh" ~
        "North Carolina State University",

      INSTNM == "North Dakota State University-Main Campus" ~
        "North Dakota State University",

      UNITID ==  "154101" ~
        "Northwestern College - Iowa",

      INSTNM == "Ohio University-Main Campus" ~
        "Ohio University",

      INSTNM == "Oklahoma State University-Main Campus" ~
        "Oklahoma State University",

      INSTNM == "Pacific University" ~
        "Pacific University Oregon",

      INSTNM == "The Pennsylvania State University" ~
        "Penn State",

      INSTNM == "Pennsylvania State University-Penn State Fayette- Eberly" ~
        "Penn State Fayette, The Eberly Campus",

      INSTNM == "Pennsylvania State University-Penn State York" ~
        "Penn State York",

      INSTNM == "Purdue University-Main Campus" ~
        "Purdue University",

      INSTNM == "Rutgers University-New Brunswick" ~
        "Rutgers University - New Brunswick",

      INSTNM == "Rutgers University-Newark" ~
        "Rutgers University - Newark",

      INSTNM == "The University of the South" ~
        "Sewanee - The University of the South",

      INSTNM == "South Dakota School of Mines and Technology" ~
        "South Dakota School of Mines & Technology",

      INSTNM == "St Bonaventure University" ~
        "St. Bonaventure University",

      INSTNM == "Saint John Fisher College" ~
        "St. John Fisher University",

      INSTNM == "St. Joseph's University-New York" ~
        "St. Joseph's University - New York",

      INSTNM == "St Lawrence University" ~
        "St. Lawrence University",

      INSTNM == "St Olaf College" ~
        "St. Olaf College",

      INSTNM == "Stanbridge University" ~
        "Stanbridge University - Orange County",

      INSTNM == "Stephen F Austin State University" ~
        "Stephen F. Austin State University",

      INSTNM == "Stony Brook University" ~
        "Stony Brook University, SUNY",

      INSTNM == "SUNY College of Environmental Science and Forestry" ~
        "SUNY College of Environmental Science & Forestry",

      INSTNM == "Farmingdale State College" ~
        "SUNY Farmingdale State College",

      INSTNM == "State University of New York at New Paltz" ~
        "SUNY New Paltz",

      INSTNM == "Texas A & M University-College Station" ~
        "Texas A&M University",

      INSTNM == "American Musical and Dramatic Academy" ~
        "The American Musical and Dramatic Academy (AMDA) - New York",

      INSTNM == "The College of Saint Scholastica" ~
        "The College of St. Scholastica",

      INSTNM == "Cooper Union for the Advancement of Science and Art" ~
        "The Cooper Union for the Advancement of Science and Art",

      INSTNM == "The Master's University and Seminary" ~
        "The Master's University",

      INSTNM == "Ohio State University-Main Campus" ~
        "The Ohio State University",

      INSTNM == "University of Alabama in Huntsville" ~
        "The University of Alabama in Huntsville",

      INSTNM == "University of Baltimore" ~
        "The University of Baltimore",

      INSTNM == "University of Tulsa" ~
        "The University of Tulsa",

      INSTNM == "University of Virginia's College at Wise" ~
        "The University of Virginia's College at Wise",

      INSTNM == "Trinity College" ~
        "Trinity College - Connecticut",

      INSTNM == "Tulane University of Louisiana" ~
        "Tulane University",

      UNITID == "196866" ~
        "Union College - New York",

      INSTNM == "University at Buffalo" ~
        "University at Buffalo, SUNY",

      INSTNM == "University of Alabama at Birmingham" ~
        "University of Alabama - Birmingham",

      INSTNM == "University of Cincinnati-Main Campus" ~
        "University of Cincinnati",

      INSTNM == "University of Colorado Denver/Anschutz Medical Campus" ~
        "University of Colorado Denver",

      INSTNM == "University of Maryland-College Park" ~
        "University of Maryland - College Park",

      INSTNM == "University of Maryland-Baltimore County" ~
        "University of Maryland, Baltimore County",

      INSTNM == "University of Massachusetts-Amherst" ~
        "University of Massachusetts - Amherst",

      INSTNM == "University of Massachusetts-Lowell" ~
        "University of Massachusetts Lowell",

      INSTNM == "University of Michigan-Dearborn" ~
        "University of Michigan - Dearborn",

      INSTNM == "University of Minnesota-Crookston" ~
        "University of Minnesota Crookston",

      INSTNM == "University of Minnesota-Duluth" ~
        "University of Minnesota Duluth",

      INSTNM == "University of Minnesota-Twin Cities" ~
        "University of Minnesota Twin Cities",

      INSTNM == "University of Missouri-Columbia" ~
        "University of Missouri",

      INSTNM == "Embry-Riddle Aeronautical University-Prescott" ~
        "Embry-Riddle Aeronautical University - Prescott",

      INSTNM == "South Dakota State University" ~
        "South Dakota State University",

      INSTNM == "St Catherine University" ~
        "St. Catherine University",

      INSTNM == "University of Missouri-Kansas City" ~
        "University of Missouri - Kansas City",

      INSTNM == "University of Missouri-St Louis" ~
        "University of Missouri - St. Louis",

      INSTNM == "University of Nebraska-Lincoln" ~
        "University of Nebraska - Lincoln",

      INSTNM == "University of Nevada-Reno" ~
        "University of Nevada - Reno",

      INSTNM == "University of New Hampshire-Main Campus" ~
        "University of New Hampshire",

      INSTNM == "University of Oklahoma-Norman Campus" ~
        "University of Oklahoma",

      INSTNM == "University of Pittsburgh-Pittsburgh Campus" ~
        "University of Pittsburgh",

      INSTNM == "University of South Carolina-Columbia" ~
        "University of South Carolina",

      INSTNM == "University of St Francis" ~
        "University of St. Francis - Illinois",

      UNITID == "174914" ~
        "University of St. Thomas - Minnesota",

      UNITID == "227863" ~
        "University of St. Thomas - Texas",

      INSTNM == "The University of Tennessee-Knoxville" ~
        "University of Tennessee",

      INSTNM == "The University of Tennessee-Martin" ~
        "University of Tennessee at Martin",

      INSTNM == "The University of Texas at Arlington" ~
        "University of Texas - Arlington",

      INSTNM == "The University of Texas at Dallas" ~
        "University of Texas - Dallas",

      INSTNM == "The University of Texas Permian Basin" ~
        "University of Texas - Permian Basin",

      INSTNM == "The University of Texas Rio Grande Valley" ~
        "University of Texas - Rio Grande Valley",

      INSTNM == "The University of Texas at Tyler" ~
        "University of Texas - Tyler",

      INSTNM == "University of Washington-Seattle Campus" ~
        "University of Washington",

      INSTNM == "University of Washington-Bothell Campus" ~
        "University of Washington - Bothell",

      INSTNM == "University of Washington-Tacoma Campus" ~
        "University of Washington - Tacoma",

      INSTNM == "The University of West Florida" ~
        "University of West Florida",

      INSTNM == "University of Wisconsin-Madison" ~
        "University of Wisconsin",

      INSTNM == "University of Wisconsin-La Crosse" ~
        "University of Wisconsin - La Crosse",

      INSTNM == "Virginia Polytechnic Institute and State University" ~
        "Virginia Tech",

      INSTNM == "West Texas A & M University" ~
        "West Texas A&M University",

      UNITID == "230807" ~
        "Westminster College - Utah",

      INSTNM == "Wheaton College" ~
        "Wheaton College - Illinois",

      INSTNM == "Wheaton College (Massachusetts)" ~
        "Wheaton College - Massachusetts",

      TRUE ~ INSTNM
    )
  )

colleges <- niche_data_500 |>
  left_join(us_dep_of_ed, by = c("college" ="INSTNM")) |>
  filter(rank != 141) |>
  filter(rank != 181)

# write colleges dataset--------------------------------------------------------

write_csv(colleges, "data/colleges.csv")

# select variables--------------------------------------------------------------
colleges <- read_csv("data/colleges.csv", na = c("", "NA", "NULL"))

chosen_variables <- c(
  "college",
  "rank",
  "REGION",
  "ACCREDAGENCY",
  "CONTROL",
  "CCBASIC",
  "ADM_RATE",
  "UGDS",
  "UGDS_WHITE",
  "UGDS_BLACK",
  "UGDS_HISP",
  "UGDS_ASIAN",
  "UGDS_AIAN",
  "UGDS_NHPI",
  "UGDS_2MOR",
  "UGDS_NRA",
  "UGDS_UNKN",
  "NPT4_PUB",
  "NPT4_PRIV",
  "COSTT4_A",
  "COSTT4_P",
  "AVGFACSAL",
  "PCTPELL",
  "C150_4",
  "AGE_ENTRY",
  "FEMALE",
  "MARRIED",
  "FIRST_GEN",
  "FAMINC",
  "MD_FAMINC",
  "ENDOWBEGIN",
  "SAT_AVG",
  "SATVRMID",
  "SATMTMID",
  "SATWRMID",
  "ACTCMMID",
  "ACTENMID",
  "ACTMTMID",
  "ACTWRMID"
)

data <- colleges |>
  select(chosen_variables)

# clean categorical variables---------------------------------------------------
data <- data |>
  mutate(
    REGION = as.character(REGION),
    REGION = case_when(
      REGION == 1 ~ "New England",
      REGION == 2 ~ "Mid East",
      REGION == 3 ~ "Great Lakes",
      REGION == 4 ~ "Plains",
      REGION == 5 ~ "Southeast",
      REGION == 6 ~ "Southwest",
      REGION == 7 ~ "Rocky Mountains",
      REGION == 8 ~ "Far West",
      REGION == 9 ~ "Outlying Areas"
    ),
    CONTROL = as.character(CONTROL),
    CONTROL = case_when(
      CONTROL == 1 ~ "Public",
      CONTROL == 2 ~ "Private, Nonprofit",
      CONTROL == 3 ~ "Proprietary"
    ),
    CCBASIC = as.character(CCBASIC),
    CCBASIC = case_when(
      CCBASIC == -2 ~ "Not applicable",
      CCBASIC == 0 ~ "Not classified",
      CCBASIC == 1 ~ "Associate's Colleges: High Transfer-High Traditional",
      CCBASIC == 2 ~ "Associate's Colleges: High Transfer-Mixed Traditional/Nontraditional",
      CCBASIC == 3 ~ "Associate's Colleges: High Transfer-High Nontraditional",
      CCBASIC == 4 ~ "Associate's Colleges: Mixed Transfer/Career & Technical-High Traditional",
      CCBASIC == 5 ~ "Associate's Colleges: Mixed Transfer/Career & Technical-Mixed Traditional/Nontraditional",
      CCBASIC == 6 ~ "Associate's Colleges: Mixed Transfer/Career & Technical-High Nontraditional",
      CCBASIC == 7 ~ "Associate's Colleges: High Career & Technical-High Traditional",
      CCBASIC == 8 ~ "Associate's Colleges: High Career & Technical-Mixed Traditional/Nontraditional",
      CCBASIC == 9 ~ "Associate's Colleges: High Career & Technical-High Nontraditional",
      CCBASIC == 10 ~ "Special Focus Two-Year: Health Professions",
      CCBASIC == 11 ~ "Special Focus Two-Year: Technical Professions",
      CCBASIC == 12 ~ "Special Focus Two-Year: Arts & Design",
      CCBASIC == 13 ~ "Special Focus Two-Year: Other Fields",
      CCBASIC == 14 ~ "Baccalaureate/Associate's Colleges: Associate's Dominant",
      CCBASIC == 15 ~ "Doctoral Universities: Very High Research Activity",
      CCBASIC == 16 ~ "Doctoral Universities: High Research Activity",
      CCBASIC == 17 ~ "Doctoral/Professional Universities",
      CCBASIC == 18 ~ "Master's Colleges & Universities: Larger Programs",
      CCBASIC == 19 ~ "Master's Colleges & Universities: Medium Programs",
      CCBASIC == 20 ~ "Master's Colleges & Universities: Small Programs",
      CCBASIC == 21 ~ "Baccalaureate Colleges: Arts & Sciences Focus",
      CCBASIC == 22 ~ "Baccalaureate Colleges: Diverse Fields",
      CCBASIC == 23 ~ "Baccalaureate/Associate's Colleges: Mixed Baccalaureate/Associate's",
      CCBASIC == 24 ~ "Special Focus Four-Year: Faith-Related Institutions",
      CCBASIC == 25 ~ "Special Focus Four-Year: Medical Schools & Centers",
      CCBASIC == 26 ~ "Special Focus Four-Year: Other Health Professions Schools",
      CCBASIC == 27 ~ "Special Focus Four-Year: Engineering Schools",
      CCBASIC == 28 ~ "Special Focus Four-Year: Other Technology-Related Schools",
      CCBASIC == 29 ~ "Special Focus Four-Year: Business & Management Schools",
      CCBASIC == 30 ~ "Special Focus Four-Year: Arts, Music & Design Schools",
      CCBASIC == 31 ~ "Special Focus Four-Year: Law Schools",
      CCBASIC == 32 ~ "Special Focus Four-Year: Other Special Focus Institutions",
      CCBASIC == 33 ~ "Tribal Colleges"
    )
  )

# scale numerical variables-----------------------------------------------------
scaled_continuous_numeric_variables <- data |>
  select_if(is.numeric) |>
  select(-rank) |>
  scale() |>
  data.frame()

other_variables <- data |>
  select(rank | REGION | CONTROL | CCBASIC | !where(is.numeric))

scaled_data <- cbind(other_variables, scaled_continuous_numeric_variables)

#select_if() from https://www.r-bloggers.com/2019/10/selecting-columns-based-on-type/
#scale() from https://www.r-bloggers.com/2021/12/how-to-use-the-scale-function-in-r/

write_csv(scaled_data, "data/scaled_data.csv")
