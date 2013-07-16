heart-rate-visualization-demo
=============================

A data visualization app created for a job interview problem, using Rails 4.0.0, MySQL, and Highcharts 3.0

## Creation and Scaffolding

1. `rails new heart-rate-visualization-demo --database=mysql`
1. `rails g model User username:string gender:string age:integer hr_zone1_bpm_min:integer hr_zone1_bpm_max:integer hr_zone2_bpm_min:integer hr_zone2_bpm_max:integer hr_zone3_bpm_min:integer hr_zone3_bpm_max:integer hr_zone4_bpm_min:integer hr_zone4_bpm_max:integer`
1. `rails g model HrmSession user:references duration:integer`
1. `rails g model HrmDataPoint hrm_session:references bpm:integer started_at:timestamp ended_at:timestamp duration:integer`
1. `rails g controller users index`
1. `rails g controller hrm_sessions show`

