
#   governmentagency = GovernmentAgency.create([
#     { name: "Kenya Revenue Authority" }, 
#     { name: "Central Bank of Kenya" },
#     { name: "Kenya Wildlife Service" }, 
#     { name: "Public Service Commission" },
#     { name: "Postal Corporation of Kenya" }, 
#     { name: "Kenya National Bureau of Statistics" },
#     { name: "KenGen" }, 
#     { name: "Ministry of Public Service" },
#     { name: "Kenya Ports Authority" }, 
#     { name: "National Cohesion and Integration Commission" },
#     { name: "Kenya Film Commission" }, 
#     { name: "Kenya Medical Supplies Agency" },
#     { name: "Ministry of Health of Kenya" }, 
#     { name: "Kenya Airports Authority" },
#     { name: "Kenya National Disaster Operation Centre" }, 
#     { name: "Judicial Service Commission" },
#     { name: "Communications Authority of Kenya" }, 
#     { name: "Insurance Regulatory Authority" },
#     { name: "General Service Unit" }, 
#     { name: "Kenya Police" },
#     { name: "Sacco Societies Regulatory Authority" }, 
#     { name: "National Social Security Fund" },
#     { name: "KenTrade" }, 
#     { name: "Administration Police" },
#     { name: "Clinical Officers Council" }, 
#     { name: "Kenya Forest Service" },
#     { name: "Kenya Prisons Service" }, 
#     { name: "Kenya Police Reserve" },
#     { name: "Attorney General of Kenya" }, 
#     { name: "Kenya Civil Aviation Authority" },
#     { name: "Capital Markets Authority of Kenya" }, 
#     { name: "Betting Control and Licensing Board" },
#     { name: "Retirement Benefits Authority of Kenya" }, 
#     { name: "Commission for the Implementation of the Constitution" },
#     { name: "Commission on Administrative Justice" }, 
#     { name: "Commission on Revenue Allocations" },
#     { name: "Commissions and Independent Offices of Kenya" }, 
#     { name: "Kenya National Disaster Operation Centre" },
#     { name: "Kenya Economic Stimulus Programme" }, 
#     { name: "Medical Practitioners and Dentists Board" },
#     { name: "National Environment Management Authority of Kenya" }, 
#     { name: "Ethics and Anti-Corruption Commission" },
#     { name: "Export Promotion Council" }, 
#     { name: "Kenya Film Classification Board" },
#     { name: "Clinical Officers Council" }, 
#     { name: "Kenya National Commission on Human Rightss" },
#     { name: "Information and Communication Technology Authority" }, 
#     { name: "Judicial Service Commission" },
#     { name: "Kenya Anti-Corruption Authority" }, 
#     { name: "Kenya Anti-Corruption Commission" },
#     { name: "Kenya Army Armoured Brigade" }, 
#     { name: "Kenya Bureau of Standards" },
#     { name: "Teachers Service Commission" }, 
#     { name: "Salaries and Remuneration Commission" },
#     { name: "Registrar of Trade Unions" }, 
#     { name: "Permanent Presidential Music Commission" },
#     { name: "Permanent Presidential Commission on Soil Conservation and Afforestation" }, 
#     { name: "Office of the Controller of Budget (Kenya)" },
#     { name: "Office of the Auditor-General (Kenya)" }, 
#     { name: "Kenya Navy" },
#     { name: "National Youth Service (Kenya)" }, 
#     { name: "National Social Security Fund (Kenya)" },
#     { name: "National Police Service Commission" }, 
#     { name: "National Land Commission" },
#     { name: "National Intelligence Service (Kenya)" }, 
#     { name: "National Health Insurance Fund (Kenya)" },
#     { name: "National Cohesion and Integration Commission" }, 
#     { name: "Kenya Defence Forces" },
#     { name: "Kenya Plant Health Inspectorate Services" }, 
#     { name: "Kenya Shipyards Limited" },
#     { name: "Kenya National Examinations Council" }, 
#     { name: "Kenya National Bureau of Statistics" },
#     { name: "Kenya Medical Supplies Agency" }, 
#     { name: "Kenya Law Reform Commission" },
#     { name: "Kenya Judges and Magistrates Vetting Board" }, 
#     { name: "Kenya Coast Guard Service" },
#     { name: "Kenya Army" }, 
#     { name: "Local authorities of Kenya" }
#     ])

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?