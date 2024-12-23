Customer Shopping Trends Analysis Project

This project aimed to analyze customer shopping trends by exploring a transactional dataset and deriving actionable insights. The analysis involved leveraging multiple tools and techniques for a comprehensive approach:

Data Exploration with SQL:
SQL was used to perform the dataset's exploratory data analysis (EDA). Key steps included:

Checking for duplicate records and null values to ensure data quality.
Segmenting customers demographically by age, gender, and location.
Analyzing behavioral patterns, such as purchase frequency and preferred product categories.
Examining subscription status, payment methods, and shipping preferences.
SQL provided a structured way to draw initial insights about customer behavior and spending patterns.


RFM and Clustering Analysis with Python:
Python was employed to perform RFM analysis, our dataset doesn't have a date column, so we modified our analysis to only include Frequency (F) and Monetary (M) metrics, and categorized customers based on their purchase behavior:
RFM Scores: Customers were scored based on their frequency (number of purchases), and monetary value (total spending).
Customer Segmentation: Using K-Means clustering, customers were grouped into distinct segments such as "Top Spenders," "Frequent Buyers," and "High Value." This segmentation provided a deeper understanding of the customer base.

Visualization with Tableau:
A Tableau dashboard was created to visualize the findings from the analysis, enabling better insights communication. The dashboard included:
Visualizations of demographic trends, such as age groups, gender and location-based spending.
Behavioral patterns, including purchase frequency and preferred product categories.
Tableau added an interactive dimension to the project, making it easier to explore the results and share insights with stakeholders.


Conclusion/
This project used a multi-tool approach to analyzing customer shopping trends. SQL provided a solid foundation for data exploration, Python allowed for advanced customer segmentation using RFM and clustering techniques, and Tableau brought the insights to life through compelling visualizations. Together, these tools highlighted the importance of understanding customer behavior to drive informed business decisions.

[Dataset](https://www.kaggle.com/datasets/iamsouravbanerjee/customer-shopping-trends-dataset/data)

[Tableau Viz](https://public.tableau.com/views/Classeur1_17348823784560/Tableaudebord1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
