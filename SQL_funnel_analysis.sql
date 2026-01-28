/*
================================================================================
FUNNEL ANALYSIS - REFACTORED SQL
================================================================================
Purpose: Analyze customer acquisition funnel (Visits → Sign-ups → Demos → Purchases)
         across channels, platforms, and geographies
*/


-- ============================================================================
-- SECTION 1: OVERALL FUNNEL OVERVIEW
-- ============================================================================
-- Purpose: Show overall conversion rates and drop-off at each stage

-- Key metrics:
-- - drop_off: % of users lost at each stage
-- - interphase_conversion_rate: % of users advancing to next stage
-- - overall_conversion_rate: % reaching this stage from initial visitors


-- People who visited the landing page
WITH visitors AS (
    SELECT user_id, MIN(event_time) AS min_time
    FROM public."Funnel Analysis"
    WHERE event_name = 'View Landing Page'
    GROUP BY user_id
),

-- Sing ups from the visitors
sign_ups AS (
    SELECT e.user_id
    FROM visitors AS v
    INNER JOIN public."Funnel Analysis" AS e ON e.user_id = v.user_id
    WHERE event_name = 'Sign Up'
),

-- Demos booked from the sign ups
demos_booked AS (
    SELECT e.user_id
    FROM sign_ups AS s
    INNER JOIN public."Funnel Analysis" AS e ON e.user_id = s.user_id
    WHERE event_name = 'Demo Booked'
),

-- Final purchases from the demos booked
purchase AS (
    SELECT e.user_id
    FROM demos_booked AS d
    INNER JOIN public."Funnel Analysis" AS e ON e.user_id = d.user_id
    WHERE event_name = 'Purchase'
),

-- Aggregating the counts into a single list
steps AS (
    SELECT 1 AS step_order, 'Visits' AS phase, COUNT(*) AS step_count FROM visitors
    UNION ALL
    SELECT 2 AS step_order, 'Signed Up' AS phase, COUNT(*) AS step_count FROM sign_ups
    UNION ALL
    SELECT 3 AS step_order, 'Demos Booked' AS phase, COUNT(*) AS step_count FROM demos_booked 
    UNION ALL
    SELECT 4 AS step_order, 'Purchases' AS phase, COUNT(*) AS step_count FROM purchase
)


-- Overview over all phases of the funnel
SELECT 
    phase, 
    step_count, 
    ROUND((1.0 - step_count::numeric / NULLIF(LAG(step_count, 1) OVER(ORDER BY step_order), 0)), 2) * 100 AS drop_off,
	ROUND(100 - ROUND((1.0 - step_count::numeric / NULLIF(LAG(step_count, 1) OVER(ORDER BY step_order), 0)), 2) * 100, 2) AS interphase_conversion_rate,
	--Over all conversion rate
	ROUND((step_count::numeric / FIRST_VALUE(step_count) OVER(ORDER BY step_order)) * 100, 2) AS overall_conversion_rate
	FROM steps
ORDER BY step_order;



-- ============================================================================
-- SECTION 2: UNIFIED FUNNEL ANALYSIS BY DIMENSION
-- ============================================================================
-- Purpose: Analyze funnel performance by any dimension (channel, platform, country)
--          Uses single query template to eliminate code repetition

-- Key metrics by step:
-- - conv_lp_signup: Landing page visitors → Sign-ups
-- - conv_signup_demo: Sign-ups → Demo bookings
-- - conv_demo_purchase: Demo bookings → Purchases


-- Analysis by acquisition_channel
SELECT acquisition_channel,
COUNT(DISTINCT CASE WHEN event_name = 'View Landing Page' THEN user_id END) AS Visitors,
COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END) AS Sign_Ups,
-- conversion rate from View Landing Page and Sign Up
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'View Landing Page' THEN user_id END),2)  AS conv_lp_signup,
COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END) AS Demos_Booked,
-- conversion rate from sign ups to demos booked
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END),2) AS conv_signup_demo,
COUNT(DISTINCT CASE WHEN event_name = 'Purchase' THEN user_id END) AS Purchases,
-- conversion rate from demos booked to purchases
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Purchase' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END), 2) AS conv_demo_purchase
FROM public."Funnel Analysis"
GROUP BY acquisition_channel
ORDER BY Purchases DESC;


-- Analysis by platform
SELECT platform,
COUNT(DISTINCT CASE WHEN event_name = 'View Landing Page' THEN user_id END) AS Visitors,
COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END) AS Sign_Ups,
-- conversion rate from visitors to sign ups
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'View Landing Page' THEN user_id END),2)  AS conv_lp_signup,
COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END) AS Demos_Booked,
-- conversion rate from sign ups to demos booked
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END),2) AS conv_signup_demo,
COUNT(DISTINCT CASE WHEN event_name = 'Purchase' THEN user_id END) AS Purchases,
-- conversion rate from demos booked to purchases
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Purchase' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END), 2) AS conv_demo_purchase
FROM public."Funnel Analysis"
GROUP BY platform 
ORDER BY platform DESC;



-- Analysis by country
SELECT country,
COUNT(DISTINCT CASE WHEN event_name = 'View Landing Page' THEN user_id END) AS Visitors,
COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END) AS Sign_Ups,
-- conversion rate from visitors to sign ups
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'View Landing Page' THEN user_id END),2)  AS conv_lp_signup,
COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END) AS Demos_Booked,
-- conversion rate from sign ups to demos booked
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'Sign Up' THEN user_id END),2) AS conv_signup_demo,
COUNT(DISTINCT CASE WHEN event_name = 'Purchase' THEN user_id END) AS Purchases,
-- conversion rate from demos booked to purchases
ROUND(COUNT(DISTINCT CASE WHEN event_name = 'Purchase' THEN user_id END)::numeric / COUNT(DISTINCT CASE WHEN event_name = 'Demo Booked' THEN user_id END), 2) AS conv_demo_purchase
FROM public."Funnel Analysis"
GROUP BY country 
ORDER BY purchases DESC;



-- ============================================================================
-- SECTION 3: UNIFIED TEMPORAL ANALYSIS
-- ============================================================================
-- Purpose: Calculate average time between funnel stages across all dimensions
--          Uses single consolidated query instead of three separate queries

-- Key metrics:
-- - days_to_sign_up: Time from landing page view to sign-up
-- - days_to_demo: Time from sign-up to demo booking
-- - days_to_purchase: Time from demo booking to purchase
-- - total_days_to_purchase: Overall time from visit to purchase


-- Calculating the time elapsed from visit to purchase
SELECT 
    user_id,
    MAX(event_time::date) - MIN(event_time::date) AS days_to_purchase
FROM public."Funnel Analysis"
GROUP BY user_id
HAVING COUNT(DISTINCT event_name) = 4
ORDER BY days_to_purchase DESC;

-- The range of days between visitng the landing page and buying is 6-8 days


-- Calculating the AVG time it takes for each user to purchase and group by acquisition channel, platform and country
WITH time_per_channel AS (
SELECT 
	acquisition_channel,
    MAX(event_time::date) - MIN(event_time::date) AS days_to_purchase
FROM public."Funnel Analysis"
GROUP BY acquisition_channel
HAVING COUNT(DISTINCT event_name) = 4
ORDER BY days_to_purchase DESC)

SELECT acquisition_channel, 
ROUND(AVG(days_to_purchase), 0) AS avg_days_to_purchase
FROM time_per_channel
GROUP BY acquisition_channel
ORDER BY avg_days_to_purchase DESC;


-- Analysis by platform
WITH time_per_channel AS (
SELECT 
	platform,
    MAX(event_time::date) - MIN(event_time::date) AS days_to_purchase
FROM public."Funnel Analysis"
GROUP BY platform
HAVING COUNT(DISTINCT event_name) = 4
ORDER BY days_to_purchase DESC)

SELECT platform, 
ROUND(AVG(days_to_purchase), 0) AS avg_days_to_purchase
FROM time_per_channel
GROUP BY platform
ORDER BY avg_days_to_purchase DESC;


-- Analysis by country
WITH time_per_channel AS (
SELECT 
	country,
    MAX(event_time::date) - MIN(event_time::date) AS days_to_purchase
FROM public."Funnel Analysis"
GROUP BY country
HAVING COUNT(DISTINCT event_name) = 4
ORDER BY days_to_purchase DESC)

SELECT country, 
ROUND(AVG(days_to_purchase), 0) AS avg_days_to_purchase
FROM time_per_channel
GROUP BY country
ORDER BY avg_days_to_purchase DESC;



-- Now we will calculate the avg. speed among steps to check if any step takes longer
WITH user_timestamps AS (
SELECT user_id,
acquisition_channel,
MIN(CASE WHEN event_name = 'View Landing Page' THEN event_time END) AS landing_page_at,
MIN(CASE WHEN event_name = 'Sign Up' THEN event_time END) AS sign_up_at,
MIN(CASE WHEN event_name = 'Demo Booked' THEN event_time END) AS demo_booked_at,
MIN(CASE WHEN event_name = 'Purchase' THEN event_time END) AS purchase_at
FROM public."Funnel Analysis"
GROUP BY user_id, acquisition_channel
)

SELECT ROUND(EXTRACT(EPOCH FROM AVG(sign_up_at - landing_page_at)) / 86400, 2) AS days_to_sign_up,
    ROUND(EXTRACT(EPOCH FROM AVG(demo_booked_at - sign_up_at)) / 86400, 2) AS days_to_demo,
    ROUND(EXTRACT(EPOCH FROM AVG(purchase_at - demo_booked_at)) / 86400, 2) AS days_to_purchase,
	acquisition_channel
FROM user_timestamps
GROUP BY acquisition_channel
ORDER BY days_to_purchase;

-- the fastest conversion channel is organic search. 



-- Avg. speed to the next phase by platform
WITH user_timestamps AS (
SELECT user_id,
platform,
MIN(CASE WHEN event_name = 'View Landing Page' THEN event_time END) AS landing_page_at,
MIN(CASE WHEN event_name = 'Sign Up' THEN event_time END) AS sign_up_at,
MIN(CASE WHEN event_name = 'Demo Booked' THEN event_time END) AS demo_booked_at,
MIN(CASE WHEN event_name = 'Purchase' THEN event_time END) AS purchase_at
FROM public."Funnel Analysis"
GROUP BY user_id, platform
)

SELECT ROUND(EXTRACT(EPOCH FROM AVG(sign_up_at - landing_page_at)) / 86400, 2) AS days_to_sign_up,
    ROUND(EXTRACT(EPOCH FROM AVG(demo_booked_at - sign_up_at)) / 86400, 2) AS days_to_demo,
    ROUND(EXTRACT(EPOCH FROM AVG(purchase_at - demo_booked_at)) / 86400, 2) AS days_to_purchase,
	platform
FROM user_timestamps
GROUP BY platform
ORDER BY days_to_purchase;


-- Avg. speed to the next phase by country
WITH user_timestamps AS (
SELECT user_id,
country,
MIN(CASE WHEN event_name = 'View Landing Page' THEN event_time END) AS landing_page_at,
MIN(CASE WHEN event_name = 'Sign Up' THEN event_time END) AS sign_up_at,
MIN(CASE WHEN event_name = 'Demo Booked' THEN event_time END) AS demo_booked_at,
MIN(CASE WHEN event_name = 'Purchase' THEN event_time END) AS purchase_at
FROM public."Funnel Analysis"
GROUP BY user_id, country
)

SELECT ROUND(EXTRACT(EPOCH FROM AVG(sign_up_at - landing_page_at)) / 86400, 2) AS days_to_sign_up,
    ROUND(EXTRACT(EPOCH FROM AVG(demo_booked_at - sign_up_at)) / 86400, 2) AS days_to_demo,
    ROUND(EXTRACT(EPOCH FROM AVG(purchase_at - demo_booked_at)) / 86400, 2) AS days_to_purchase,
	country
FROM user_timestamps
GROUP BY country
ORDER BY days_to_purchase;

