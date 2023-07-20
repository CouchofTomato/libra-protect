# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or FactoryBot.created alongside the database with db:setup).

require "factory_bot_rails"

#---------DELETE ALL MODELS---------#

LinkedProductModule.delete_all
ProductModuleMedicalBenefit.delete_all
ProductModule.delete_all
User.delete_all
Product.delete_all
Insurer.delete_all
MedicalBenefit.delete_all

#---------USERS---------#

# Admin User
FactoryBot.create(:user, email: "admin@admin.com", password: "password", admin: true)

# Non-admin User
FactoryBot.create(:user, email: "user@user.com", password: "password")

#---------MEDICAL BENEFITS---------#

### Inpatient ###
FactoryBot.create(:medical_benefit, name: "Hospital Accomodation", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Intensive Care", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Mental Health Treatment", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Nursing Care", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Prescribed Drugs and Surgical Dressings", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Parent Accommodation", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Inpatient Pathology, X-rays and Diagnostic Tests", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Therapies", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Physicians Fees", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Prosthetic Implants and Appliances", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Surgical Operations", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Theatre Charges", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Cash Benefit", category: "inpatient")
FactoryBot.create(:medical_benefit, name: "Rehabilitation", category: "inpatient")

### Outpatient ###
FactoryBot.create(:medical_benefit, name: "Outpatient Surgical Operations", category: "outpatient")
FactoryBot.create(:medical_benefit, name: "Qualified Nurse Treatment", category: "outpatient")
FactoryBot.create(:medical_benefit, name: "Outpatient Pathology, X-rays and Diagnostic Tests", category: "outpatient")
FactoryBot.create(:medical_benefit, name: "Consultants Fees", category: "outpatient")
FactoryBot.create(:medical_benefit, name: "Family Doctor (GP) Fees", category: "outpatient")
FactoryBot.create(:medical_benefit, name: "Home Nursing", category: "outpatient")
FactoryBot.create(:medical_benefit, name: "Advanced Imaging", category: "outpatient")

### Therapies ###
FactoryBot.create(:medical_benefit, name: "Physiotherapy", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Osteopathy", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Chiropractor", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Occupational Therapy", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Orthoptist", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Dietician", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Speech Therapy", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Accupuncture", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Homeopathy", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Traditional Chinese Medicine", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Psychiatry", category: "therapists")
FactoryBot.create(:medical_benefit, name: "Psychotherapy", category: "therapists")

### Medicines and Appliances ###
FactoryBot.create(:medical_benefit, name: "Prescribed Drugs and Dressings", category: "medicines_and_appliances")
FactoryBot.create(:medical_benefit, name: "Prosthetic Devices", category: "medicines_and_appliances")


### Wellness ###
FactoryBot.create(:medical_benefit, name: "Health Screening and Wellness Checks", category: "wellness")

### Evacuation & Repatriation
FactoryBot.create(:medical_benefit, name: "Evacuation Transport Costs to Nearest Country", category: "evacuation_and_repatriation")
FactoryBot.create(:medical_benefit, name: "Repatriation", category: "evacuation_and_repatriation")
FactoryBot.create(:medical_benefit, name: "Accompanying Person Travel Costs", category: "evacuation_and_repatriation")
FactoryBot.create(:medical_benefit, name: "Evacuation Return Journey", category: "evacuation_and_repatriation")
FactoryBot.create(:medical_benefit, name: "Repatriation of Mortal Remains", category: "evacuation_and_repatriation")

### Maternity ###
FactoryBot.create(:medical_benefit, name: "Maternity", category: "maternity")
FactoryBot.create(:medical_benefit, name: "Childbirth At a Hospital", category: "maternity")
FactoryBot.create(:medical_benefit, name: "Childbirth At Home", category: "maternity")
FactoryBot.create(:medical_benefit, name: "Medically Essential Caesarian Section", category: "maternity")
FactoryBot.create(:medical_benefit, name: "Complications of Maternity and Childbirth", category: "maternity")
FactoryBot.create(:medical_benefit, name: "Newborn Care", category: "maternity")

### Dental ###
FactoryBot.create(:medical_benefit, name: "Accident-related dental treatment (Inpatient)", category: "dental")
FactoryBot.create(:medical_benefit, name: "Accident-related dental treatment (Outpatient)", category: "dental")
FactoryBot.create(:medical_benefit, name: "Preventative", category: "dental")
FactoryBot.create(:medical_benefit, name: "Routine", category: "dental")
FactoryBot.create(:medical_benefit, name: "Major Restorative", category: "dental")
FactoryBot.create(:medical_benefit, name: "Orthodontic", category: "dental")

### Additional ###
FactoryBot.create(:medical_benefit, name: "Cancer Treatment", category: "additional")
FactoryBot.create(:medical_benefit, name: "HIV / AIDS Treatment", category: "additional")
FactoryBot.create(:medical_benefit, name: "Hospice and Palliative Care", category: "additional")
FactoryBot.create(:medical_benefit, name: "Kidney Dialysis", category: "additional")
FactoryBot.create(:medical_benefit, name: "Local Road Ambulance", category: "additional")
FactoryBot.create(:medical_benefit, name: "Local Air Ambulance", category: "additional")
FactoryBot.create(:medical_benefit, name: "Transplant Services", category: "additional")
FactoryBot.create(:medical_benefit, name: "Treatment for or Related to Gender Dysphoria", category: "additional")
FactoryBot.create(:medical_benefit, name: "Out of Area Cover", category: "additional")

#----------BUPA GLOBAL LIFELINE GOLD---------#
FactoryBot.create(:insurer, name: "BUPA Global", logo_name: "bupa_global_logo.png") do |insurer|
  FactoryBot.create(:product, name: "Lifeline", insurer:) do |product|
    FactoryBot.create(:product_module, :core_product_module, product:, name: "Gold", sum_assured: "Unlimited", category: :core) do |product_module|
      product_module.coverage_category_list = "inpatient, outpatient, therapists, medicines_and_appliances, wellness, maternity"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Hospital Accomodation"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Intensive Care"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Mental Health Treatment"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Nursing Care"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Parent Accommodation"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Inpatient Pathology, X-rays and Diagnostic Tests"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Therapies"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Physicians Fees"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Prosthetic Implants and Appliances"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Surgical Operations"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Theatre Charges"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Cash Benefit"),
                                              benefit_limit: "USD 240 | GBP 150 | EUR 190 up to 20 nights each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Outpatient Surgical Operations"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Qualified Nurse Treatment"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Outpatient Pathology, X-rays and Diagnostic Tests"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Consultants Fees"),
                                              benefit_limit: "Paid in full for up to 35 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Family Doctor (GP) Fees"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Advanced Imaging"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Home Nursing"),
                                              benefit_limit: "Paid in full for up to 30 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Rehabilitation"),
                                              benefit_limit: "Paid in full for up to 42 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Physiotherapy"),
                                              benefit_limit: "Paid in full for up to 30 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:,
                                              combined_limits: '30 visits combined therapies')
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Osteopathy"),
                                              benefit_limit: "Paid in full for up to 30 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:,
                                              combined_limits: '30 visits combined therapies')
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Chiropractor"),
                                              benefit_limit: "Paid in full for up to 30 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:,
                                              combined_limits: '30 visits combined therapies')
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Occupational Therapy"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Orthoptist"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Dietician"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Speech Therapy"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accupuncture"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Homeopathy"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Traditional Chinese Medicine"),
                                              benefit_limit: "Paid in full for up to 15 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Psychiatry"),
                                              benefit_limit: "Paid in full for up to 30 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Psychotherapy"),
                                              benefit_limit: "Paid in full for up to 30 visits each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Prescribed Drugs and Dressings"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Prosthetic Devices"),
                                              benefit_limit: "USD 4,000 | GBP 2,400 | EUR 3,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Health Screening and Wellness Checks"),
                                              benefit_limit: "USD 1,000 | GBP 600 | EUR 750 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Maternity"),
                                              benefit_limit: "USD 6,000 | GBP 3,600 | EUR 4,500 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Childbirth At a Hospital"),
                                              benefit_limit: "USD 6,000 | GBP 3,600 | EUR 4,500 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Childbirth At Home"),
                                              benefit_limit: "USD 1,300 | GBP 780 | EUR 975 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Medically Essential Caesarian Section"),
                                              benefit_limit: "USD 19,000 | GBP 11,400 | EUR 14,250 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Complications of Maternity and Childbirth"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Newborn Care"),
                                              benefit_limit: "USD 150,000 | GBP 90,000 | EUR 110,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accident-related dental treatment (Inpatient)"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accident-related dental treatment (Outpatient)"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Cancer Treatment"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "HIV / AIDS Treatment"),
                                              benefit_limit: "USD 20,000 | GBP 12,000 | EUR 15,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Hospice and Palliative Care"),
                                              benefit_limit: "USD 20,000 | GBP 12,000 | EUR 15,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Kidney Dialysis"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Local Road Ambulance"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Local Air Ambulance"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Transplant Services"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Treatment for or Related to Gender Dysphoria"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
    end
    FactoryBot.create(:product_module, :elective_product_module, product:, name: "Evacuation", sum_assured: "Within Overall Limit", category: :evacuation_and_repatriation) do |product_module|
      product_module.coverage_category_list = "evacuation"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Transport Costs to Nearest Country"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accompanying Person Travel Costs"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Return Journey"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Repatriation of Mortal Remains"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
    end
    FactoryBot.create(:product_module, :elective_product_module, product:, name: "Repatriation", sum_assured: "Within Overall Limit", category: :evacuation_and_repatriation) do |product_module|
      product_module.coverage_category_list = "evacuation, repatriation"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Transport Costs to Nearest Country"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Repatriation"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accompanying Person Travel Costs"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Return Journey"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Repatriation of Mortal Remains"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
    end
    FactoryBot.create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Gold"),
                                   elective_product_module: ProductModule.find_by(name: "Evacuation"))
    FactoryBot.create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Gold"),
                                   elective_product_module: ProductModule.find_by(name: "Repatriation"))
  end
end

#----------CIGNA GLOBAL HEALTH OPTIONS PLATINUM---------#
FactoryBot.create(:insurer, name: "Cigna Global", logo_name: "cigna_worldwide_logo.png") do |insurer|
  FactoryBot.create(:product, name: "Health Options", insurer:) do |product|
    FactoryBot.create(:product_module, :core_product_module, product:, name: "Platinum Inpatient", sum_assured: "Unlimited", category: :core) do |product_module|
      product_module.coverage_category_list = "inpatient, maternity"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Hospital Accomodation"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Intensive Care"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Mental Health Treatment"),
                                              benefit_limit: "Paid in full for up to 90 days",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Nursing Care"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Prescribed Drugs and Surgical Dressings"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Inpatient Pathology, X-rays and Diagnostic Tests"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Parent Accommodation"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Physicians Fees"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Surgical Operations"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Theatre Charges"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Cash Benefit"),
                                              benefit_limit: "USD 200 | GBP 130 | EUR 150 per night up to 30 days each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Transplant Services"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Advanced Imaging"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Rehabilitation"),
                                              benefit_limit: "Paid in full up to 90 days each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Home Nursing"),
                                              benefit_limit: "Paid in full up to 120 days each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Hospice and Palliative Care"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Prosthetic Devices"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Local Road Ambulance"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Local Air Ambulance"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Cancer Treatment"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Out of Area Cover"),
                                              benefit_limit: "Paid in full for inpatient and day-patient costs",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Childbirth At a Hospital"),
                                              benefit_limit: "USD 14,000 | GBP 9,000 | EUR 11,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Childbirth At Home"),
                                              benefit_limit: "USD 1,100 | GBP 700 | EUR 850 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Complications of Maternity and Childbirth"),
                                              benefit_limit: "USD 28,000 | GBP 18,000 | EUR 22,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Medically Essential Caesarian Section"),
                                              benefit_limit: "USD 28,000 | GBP 18,000 | EUR 22,000 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Newborn Care"),
                                              benefit_limit: "USD 156,000 | GBP 100,000 | EUR 122,000 for the first 90 days following birth",
                                              benefit_limit_status: "capped",
                                              product_module:)
      
    end
    FactoryBot.create(:product_module, :elective_product_module, product:, name: "Platinum Outpatient", sum_assured: "Within Overall Limit", category: :outpatient) do |product_module|
      product_module.coverage_category_list = "outpatient, therapists, medicines_and_appliances"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Consultants Fees"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Family Doctor (GP) Fees"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Prescribed Drugs and Dressings"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Outpatient Pathology, X-rays and Diagnostic Tests"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Physiotherapy"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Occupational Therapy"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Osteopathy"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Chiropractor"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Speech Therapy"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Maternity"),
                                              benefit_limit: "USD 7,000 | GBP 4,500 | EUR 5,500 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accupuncture"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Traditional Chinese Medicine"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accident-related dental treatment (Outpatient)"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
    end
    FactoryBot.create(:product_module, :elective_product_module, product:, name: "Platinum International Evacuation and Crisis Assistance Plus", sum_assured: "Within Overall Limit", category: :evacuation_and_repatriation) do |product_module|
      product_module.coverage_category_list = "evacuation, repatriation"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Transport Costs to Nearest Country"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Repatriation"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Accompanying Person Travel Costs"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Evacuation Return Journey"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Repatriation of Mortal Remains"),
                                              benefit_limit: "Paid in full",
                                              benefit_limit_status: "paid_in_full",
                                              product_module:)
    end
    FactoryBot.create(:product_module, :elective_product_module, product:, name: "Platinum International Health and Wellbeing", sum_assured: "Within Overall Limit", category: :wellness) do |product_module|
      product_module.coverage_category_list = "wellness"
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Health Screening and Wellness Checks"),
                                              benefit_limit: "USD 600 | GBP 400 | EUR 440 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
    end
    FactoryBot.create(:product_module, :elective_product_module, product:, name: "Platinum International Vision and Dental", sum_assured: "Within Overall Limit", category: :dental_and_optical) do |product_module|
      product_module.coverage_category_list = "optical, dental"
      product_module.save
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Preventative"),
                                              benefit_limit: "USD 5,500 | GBP 3,500 | EUR 4,300 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Routine"),
                                              benefit_limit: "USD 5,500 | GBP 3,500 | EUR 4,300 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Major Restorative"),
                                              benefit_limit: "USD 5,500 | GBP 3,500 | EUR 4,300 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
      FactoryBot.create(:product_module_medical_benefit, medical_benefit: MedicalBenefit.find_by(name: "Orthodontic"),
                                              benefit_limit: "500% of costs up to USD 5,500 | GBP 3,500 | EUR 4,300 each membership year",
                                              benefit_limit_status: "capped",
                                              product_module:)
    end
    FactoryBot.create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Platinum Inpatient"),
                                   elective_product_module: ProductModule.find_by(name: "Platinum Outpatient"))
    FactoryBot.create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Platinum Inpatient"),
                                   elective_product_module: ProductModule.find_by(name: "Platinum International Evacuation and Crisis Assistance Plus"))
    FactoryBot.create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Platinum Inpatient"),
                                   elective_product_module: ProductModule.find_by(name: "Platinum International Health and Wellbeing"))
    FactoryBot.create(:linked_product_module, core_product_module: ProductModule.find_by(name: "Platinum Inpatient"),
                                   elective_product_module: ProductModule.find_by(name: "Platinum International Vision and Dental"))
  end
end
