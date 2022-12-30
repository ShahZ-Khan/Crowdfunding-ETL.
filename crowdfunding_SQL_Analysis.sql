- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select cf_id, backers_count from campaign where outcome = 'live'
order by backers_count desc

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select distinct(b.cf_id), count(c.backers_count) as backerscount
from campaign as c
INNER JOIN backers as b
ON c.cf_id = b.cf_id
where c.outcome='live'
group by b.cf_id
order by backerscount desc

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

select  c.first_name,c.last_name,c.email,(cg.goal - cg.pledged) as "Remaining Goal Amount" 
INTO email_contacts_remaining_goal_amount
from 
contacts c
LEFT JOIN 
campaign cg
ON c.contact_id = cg.contact_id
where cg.outcome='live'
order by "Remaining Goal Amount" desc


-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 


select b.email, b.first_name, b.last_name, b.cf_id, 
c.company_name, c.description, c.end_date,
(c.goal - c.pledged) as "Left of Goal" 
INTO email_backers_remaining_goal_amount
from backers b
LEFT JOIN
campaign c
ON b.cf_id = c.cf_id
where c.outcome='live'
order by b.email desc
-- Check the table
