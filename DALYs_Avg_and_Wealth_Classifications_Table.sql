SELECT Country, Avg_DALYs_Across_Years
FROM GBD_Project.dbo.dalys_rate_from_all_causes_with_averages;

--Delete rows where the "country" is actually a region or group of countries

DELETE FROM GBD_Project.dbo.dalys_rate_from_all_causes_with_averages
WHERE Code IS NULL;

SELECT *
FROM GBD_Project.dbo.dalys_rate_from_all_causes_with_averages;

--DELETE unuseful columns

ALTER TABLE GBD_Project.dbo.dalys_rate_from_all_causes_with_averages
DROP COLUMN column5, column6;

SELECT *
FROM GBD_Project.dbo.dalys_rate_from_all_causes_with_averages;

--create Country and Avg DALYs columns in table

INSERT INTO GBD_Project.dbo.Avg_DALYs_Per_Country
SELECT Country, Avg_DALYs_Across_Years FROM GBD_Project.dbo.dalys_rate_from_all_causes_with_averages;

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country;

ALTER TABLE GBD_Project.dbo.dalys_rate_from_all_causes_with_averages
DROP COLUMN Country, Avg_DALYs_Across_Years;

SELECT *
FROM GBD_Project.dbo.dalys_rate_from_all_causes_with_averages;

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country;

--Add column in avg dalys table to input one of four wealth classifications

ALTER TABLE GBD_Project.dbo.Avg_DALYs_Per_Country
ADD Wealth_Classification nvarchar(20);

--designate countries as 'High Income' according to World Bank 2023

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'High Income'
WHERE Country IN ('Australia', 'American Samoa', 'Andorra', 'Antigua and Barbuda', 'Aruba', 'Austria', 'Bahamas', 'Bahrain', 'Barbados', 'Belgium', 'Bermuda', 'British Virgin Islands', 'Brunei Darussalam', 'Canada',
'Cayman Islands', 'Channel Islands', 'Chile', 'Croatia', 'Curacao', 'Cypress', 'Czech Republic', 'Denmark', 'Estonia', 'Faroe Islands',
'Finland', 'France', 'French Polynesia', 'Guyana', 'Germany', 'Gibralter', 'Greece', 'Greenland', 'Guam', 'Hong Kong', 'Hungary', 'Iceland',
'Ireland', 'Isle of Man', 'Israel', 'Italy', 'Japan', 'Korea', 'Kuwait', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macao', 'Malta', 'Monaco', 'Nauru',
'Netherlands', 'New Caledonia', 'New Zealand', 'Northern Mariana Islands', 'Norway', 'Oman', 'Panama', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar',
'Romania', 'San Marino', 'Saudi Arabia', 'Seychelles', 'Singapore', 'Sint Maarten', 'Slovak Republic', 'Slovenia', 'Spain', 'Saint Kitts and Nevis', 'Saint Martin', 'Sweden', 'Switzerland', 'Taiwan', 'Trinidad and Tobago',
'Turks and Caicos Islands', 'United Arab Emirates', 'United Kingdom', 'United States', 'Virgin Islands');

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country;

--Designate countries a 'Upper-Middle Income' according to World Bank 2023

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'Upper-Middle Income'
WHERE Country IN ('Albania', 'Argentina', 'Armenia', 'Azerbaijan', 'Belarus', 'Belize', 'Bosnia and Herzegovina', 'Botswana', 'Brazil', 'Bulgaria', 'China', 'Colombia', 'Costa Rica', 'Cuba',
'Dominica', 'Dominican Republic', 'El Salvador', 'Equatorial Guinea', 'Ecuador', 'Fiji', 'Gabon', 'Georgia', 'Grenada', 'Guatemala',
'Indonesia', 'Iraq', 'Jamaica', 'Kazakhstan', 'Kosovo', 'Libya', 'Malaysia', 'Maldives', 'Marshall Islands', 'Mauritius', 'Mexico', 'Moldova',
'Montenegro', 'Namibia', 'North Macedonia', 'Palau', 'Paraguay', 'Peru', 'Russian Federation', 'Serbia', 'South Africa', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Suriname', 'Thailand', 'Tonga', 'Türkiye',
'Turkmenistan', 'Tuvalu', 'West Bank and Gaza');

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country;

--Designate countries a 'Lower-Middle Income' according to World Bank 2023

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'Lower-Middle Income'
WHERE Country IN ('Angola', 'Algeria', 'Bangladesh', 'Benin', 'Bhutan', 'Bolivia', 'Cabo Verde', 'Cambodia', 'Cameroon', 'Comoros', 'Congo', 'Côte dIvoire', 'Djibouti', 'Egypt, Arab Rep.',
'Eswatini', 'Ghana', 'Guinea', 'Haiti', 'Honduras', 'Jordan', 'India', 'Iran', 'Kenya', 'Kiribati',
'Kyrgyz Republic', 'Lao', 'Lebanon', 'Lesotho', 'Mauritania', 'Micronesia', 'Mongolia', 'Morocco', 'Myanmar', 'Nepal', 'Nicaragua', 'Nigeria',
'Pakistan', 'Papua New Guinea', 'Philippines', 'Samoa', 'São Tomé and Principe', 'Senegal', 'Solomon Islands', 'Sri Lanka', 'Tanzania', 'Tajikistan', 'Timor-Leste', 'Tunisia', 'Ukraine', 'Uzbekistan', 'Vanuatu',
'Vietnam', 'Zambia', 'Zimbabwe');

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country;

--Designate countries a 'Low Income' according to World Bank 2023

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'Low Income'
WHERE Country IN ('Afghanistan', 'Burkina Faso', 'Burundi', 'Central African Republic', 'Chad', 'Congo, Dem. Rep', 'Eritrea', 'Ethiopia', 'Gambia', 'Guinea-Bissau', 'Korea, Dem. Peoples Rep', 'Liberia', 'Madagascar', 'Malawi',
'Mali', 'Mozambique', 'Niger', 'Rwanda', 'Sierra Leone', 'Somalia', 'South Sudan', 'Sudan', 'Syrian Arab Republic', 'Togo',
'Uganda', 'Yemen');

--Look at what is still null in Wealth_Classification column

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country
WHERE Wealth_Classification IS NULL;

--drop rows of non-countries (e.g. 'Region of the Americas (WHO)')

DELETE FROM GBD_Project.dbo.Avg_DALYs_Per_Country
WHERE Country IN ('African Region (WHO)', 'Europe & Central Asia (WB)', 'European Region (WHO)', 'G20', 'Latin America & Caribbean (WB)',
'Middle East & North Africa (WB)', 'North America (WB)', 'OECD Countries', 'Region of the Americas (WHO)', 'South Asia (WB)',
'South-East Asia Region (WHO)', 'Sub-Saharan Africa (WB)', 'Western Pacific Region (WHO)', 'World Bank High Income', 'World Bank Low Income', 
'World Bank Lower Middle Income', 'World Bank Upper Middle Income', 'World');

DELETE FROM GBD_Project.dbo.Avg_DALYs_Per_Country
WHERE Country IS NULL;

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country
WHERE Wealth_Classification IS NULL;

--Fill in leftover High Income classifications

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'High Income'
WHERE Country IN ('Brunei', 'England', 'Niue', 'Northern Ireland', 'Scotland', 'Slovakia', 'South Korea', 'Tokelau', 'United States Virgin Islands', 'Uruguay', 'Wales');

--Fill in Upper-Middle Income classifications

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'Upper-Middle Income'
WHERE Country IN ('Kyrgyzstan', 'Laos', 'Micronesia (country)', 'Palestine', 'Russia', 'Turkey');

--Fill in Lower-Middle Income classifications

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'Lower-Middle Income'
WHERE Country IN ('Sao Tome and Principe', 'Venezuela');

--Fill in Low Income classifications

UPDATE GBD_Project.dbo.Avg_DALYs_Per_Country
SET Wealth_Classification = 'Low Income'
WHERE Country IN ('North Korea', 'Syria');

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country
WHERE Wealth_Classification IS NULL;

--No more NULL in 'Wealth_Classification'!!

SELECT *
FROM GBD_Project.dbo.Avg_DALYs_Per_Country;