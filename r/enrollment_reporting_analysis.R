
library(dplyr)
library(ggplot2)

# Load cleaned data
df <- read.csv("enrollment_processed.csv")


#---- 1 Total Credit by Department ID
# Summary by department
summary_df <- df %>%
  group_by(department_id) %>%
  summarise(
    total_credits = sum(credits),
    students = n()
  )

print(summary_df)

# Simple bar chart
ggplot(summary_df, aes(x=factor(department_id), y=total_credits, fill=factor(department_id))) +
  geom_col() +
  theme_minimal() +
  labs(title="Total Credits per Department", x="Department ID", y="Total Credits")


#------ 2 Enrollment Distribution by Credit -----
  # Create labeled status including numeric meaning
df <- df %>%
  mutate(
    credit_status = case_when(
      credits == 1 ~ "1 - Very Bad",
      credits == 2 ~ "2 - Bad",
      credits == 3 ~ "3 - Average",
      credits == 4 ~ "4 - Good",
      credits == 5 ~ "5 - Very Good",
      credits == 6 ~ "6 - Great",
      TRUE ~ "Unknown"
    )
  )

# Aggregate counts
status_summary <- df %>%
  group_by(credit_status) %>%
  summarise(count = n())

print(status_summary)

# Pie chart
ggplot(status_summary, aes(x = "", y = count, fill = credit_status)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  theme_minimal() +
  labs(
    title = "Enrollment Distribution by Credit Classification",
    fill = "Credit Scale (Numeric Definition)"
  ) +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank()
  )


#---- 3 Enrollment disctribution by Discipline----
# Load cleaned data
df <- read.csv("enrollment_processed.csv", stringsAsFactors = FALSE)

# Classify discipline based on course_id prefix
df <- df %>%
  mutate(
    discipline = case_when(
      str_starts(course_id, "CS") ~ "Computer Science (CS)",
      str_starts(course_id, "DS") ~ "Data Science (DS)",
      TRUE ~ "Other"
    )
  )

# Aggregate enrollment counts
discipline_summary <- df %>%
  group_by(discipline) %>%
  summarise(total_enrollment = n())

print(discipline_summary)

# Bar chart (preferred in academia)
ggplot(discipline_summary, aes(x = discipline, y = total_enrollment, fill = discipline)) +
  geom_col(width = 0.6) +
  theme_minimal() +
  labs(
    title = "Enrollment Distribution by Discipline",
    x = "Discipline",
    y = "Total Enrollment"
  ) +
  theme(legend.position = "none")



#--- 4 Average Credit Score by Discipline ----
# Classify discipline
df <- df %>%
  mutate(
    discipline = case_when(
      str_starts(course_id, "CS") ~ "Computer Science (CS)",
      str_starts(course_id, "DS") ~ "Data Science (DS)",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(discipline))

# Average credit score (1–6 scale)
credit_score_summary <- df %>%
  group_by(discipline) %>%
  summarise(
    avg_credit_score = round(mean(credits, na.rm = TRUE), 2),
    enrollments = n()
  )

print(credit_score_summary)

# Bar chart
ggplot(credit_score_summary, aes(x = discipline, y = avg_credit_score, fill = discipline)) +
  geom_col(width = 0.6) +
  theme_minimal() +
  labs(
    title = "Average Credit Score by Discipline",
    subtitle = "Higher score indicates better credit quality (1–6 scale)",
    x = "Discipline",
    y = "Average Credit Score"
  ) +
  theme(legend.position = "none")
