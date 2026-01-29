# SaaS Acquisition & Conversion Analysis

## Executive Summary

This analysis examines customer acquisition funnel performance across marketing channels, user platforms, and geographic markets for a fictional SaaS company using synthetic AI-generated data.

**Key Findings:**
- Paid Search demonstrates the highest conversion quality (53% visitor-to-demo rate) but lower volume, making it the most efficient channel for budget allocation.
- Organic Search drives the highest traffic (252 visitors) but suffers from the poorest purchase conversion (27%), indicating a significant downstream funnel problem.
- Windows and macOS platforms perform consistently well, while mobile devices (iOS/Android) show strong early engagement that collapses at purchase, representing a major revenue leakage point.
- Germany and the UK are mature, established markets, while Poland and Belgium show disproportionately high conversion efficiency relative to traffic, indicating hidden growth opportunities.
- The sales cycle is remarkably consistent at 7-8 days across all segments, enabling predictable pipeline forecasting.

---
<img width="1024" height="1024" alt="Image" src="https://github.com/user-attachments/assets/15fcee34-a88a-4d43-8e04-7153e4f9a8b6" />
---

## Business Problem

The fictional SaaS company faces four interconnected challenges:

1. **Marketing Efficiency vs. Scale Trade-off:** High-performing channels (Paid Search, Email) have limited volume, while high-traffic channels (Organic Search, Social Media) underconvert to revenue, creating a tension between scale and quality.

2. **Platform-Specific Funnel Breakdown:** Mobile devices represent substantial traffic but fail to convert to purchases, suggesting either a technical issue, user experience problem, or fundamental misalignment between mobile users and the product's value proposition.

3. **Geographic Market Inconsistency:** European markets show wildly different conversion patterns despite similar traffic volumes. France, Spain, and other major markets dramatically underperform relative to Germany and the UK, indicating potential localization, product-market fit, or operational execution gaps.

4. **Funnel Visibility:** While overall timing is predictable, the company lacks clarity on which segments to prioritize for growth, where to allocate limited resources, and how to address underperforming segments without cannibalizing efforts in mature markets.

---

## Methodology

- **Data:** Synthetic dataset (the dataset can be found [here](https://docs.google.com/spreadsheets/d/1ppTarWjkyLR_ctMySzM_Tb4o-XVjqgOM3GrPDf7FJR0/edit?usp=sharing)) representing a B2B SaaS company across 5 channels, 5 platforms, 11 countries
- **Metrics:** Conversion rates at each funnel stage (visitors → sign-ups → demos → purchases)
- **Approach:** Comparative performance analysis, conversion rate benchmarking, funnel velocity assessment

---

## Key Results

### Acquisition Channel Performance

**Top Performer:** Paid Search emerges as the quality leader with the highest visitor-to-demo conversion rate (53%), indicating highly motivated, purchase-ready prospects. However, it generates the lowest visitor volume (137), limiting its ability to scale revenue alone.

**Volume Leader:** Organic Search dominates in traffic generation (252 visitors) but severely underperforms in purchase conversion (27%)—the lowest across all channels. This represents a critical funnel optimization opportunity: the company successfully attracts visitors but loses them in the downstream journey.

**Efficiency Winners:** Email (0.49 demo conversion rate) and Paid Search (0.53) are the most efficient at converting visitors to committed prospects, suggesting these channels attract higher-intent users.

**Secondary Performers:** Social Media and Referral provide moderate volume and conversion, performing neither exceptionally well nor poorly—they represent stable, middle-of-the-road channels.

### Platform Analysis

**Desktop Dominance:** Windows (288 visitors, 18 purchases) and macOS (259 visitors, 10 purchases) drive the vast majority of revenue and maintain consistent conversion throughout the funnel. These platforms represent the company's core business.

**Mobile Crisis:** iOS (196 visitors) and Android (159 visitors) combined represent substantial traffic (355 visitors total, 34% of all traffic) but catastrophically underconvert to purchases (0.28 and 0.25 respectively). Despite strong demo booking rates (0.43 for iOS, 0.51 for Android), the purchase conversion collapses—indicating either a broken mobile checkout experience, incompatible product design for mobile use, or misaligned user expectations.

**Negligible Segment:** Linux represents minimal engagement and can be deprioritized in near-term optimization efforts.

### Geographic Market Performance

**Established Markets:** Germany (160 visitors, 8 purchases, 0.32 purchase conversion) and the UK (112 visitors, 6 purchases, 0.27 purchase conversion) represent your most mature, reliable revenue generators.

**Hidden Gems:** Poland and Belgium demonstrate disproportionately high conversion efficiency—Poland achieves 0.40 purchase conversion from demos despite only 85 visitors, and Belgium achieves 0.29 despite only 63 visitors. These markets punch well above their weight and represent untapped growth potential.

**Problem Markets:** France (128 visitors, only 3 purchases, 0.20 purchase conversion) and Spain (85 visitors, 2 purchases, 0.15 purchase conversion) bring substantial traffic but catastrophically underconvert. Despite similar visitor volumes to Germany and the UK, they deliver a fraction of the revenue, signaling deep product-market fit or operational execution issues.

**Secondary Markets:** Netherlands, Italy, Denmark, and Austria show moderate performance with consistent but unremarkable metrics.

### Funnel Velocity & Sales Cycle

**Consistency:** The sales cycle is remarkably stable across all segments at 7-8 days from sign-up to purchase, indicating a predictable, repeatable process. This consistency enables reliable pipeline forecasting and resource planning.

**Channel Variations:** Paid Search (4.29 days total) and Social Media (3.88 days) show the widest range, with Paid Search's longer cycle driven by a more deliberative demo-to-purchase phase (1.94 days), suggesting these buyers require more convincing before committing.

**Platform Consistency:** All platforms maintain similar cycle times (3.71-4.05 days), indicating that platform choice does not materially affect sales velocity.

**Geographic Consistency:** All countries maintain similar cycle times (3.75-4.21 days), suggesting that geographic market differences are driven by conversion rates, not sales cycle speed.

---

## Recommendations (Prioritized)

### Immediate (0-3 Months)

1. **Fix Mobile Funnel** – Mobile devices show strong early engagement (0.43-0.51 demo rate) but collapse at purchase (0.25-0.28). Conduct UX audit and A/B testing to identify and eliminate conversion barriers.

2. **Increase Paid Search Budget** – This channel delivers the highest-quality leads (53% demo conversion). Scale budget allocation by 100-150% to increase volume without sacrificing conversion efficiency.

3. **Diagnose France & Spain Underperformance** – These markets show 40-50% lower conversion than Germany/UK despite similar traffic. Conduct diagnostic research to determine if this reflects product-market fit, pricing, localization, or sales execution issues.

### Secondary (3-6 Months)

4. **Optimize Organic Search Closing** – Organic Search drives the most traffic (252 visitors) but has the lowest purchase conversion (27%). Issue likely isn't visitor quality but post-demo sales execution. Improve sales follow-up or product trial experience.

5. **Test Poland & Belgium Scaling** – Both markets show 2-3x higher conversion efficiency than secondary markets. Test increased investment to validate if performance scales with higher traffic volume.

6. **Accelerate Email Closing** – Email has strong demo conversion (49%) but longer sales cycle (2.08 days vs. 1.94 average). Implement automated nurture sequences and dedicated sales resources for email-sourced leads.

### Long-Term (6+ Months)

7. **Clarify Mobile Strategy** – Decide if mobile is strategic or secondary. If strategic, invest in mobile UX redesign; if secondary, reduce mobile marketing spend and reallocate to Paid Search and Email.

8. **Implement Tiered Geographic Growth** – Maintain Germany/UK baseline, accelerate Poland/Belgium investment, hold France/Spain pending diagnostics, deprioritize low-volume markets.

9. **Build Cohort Analytics** – Implement customer cohort tracking by channel to measure lifetime value and CAC payback period—essential for future capital allocation decisions.

---

## Skills Demonstrated

- SQL: CTEs, Joins, Case, aggregate functions, window functions
- Data analysis and funnel optimization
- Comparative performance benchmarking
- Strategic priority setting
- Clear communication of complex findings

---

## Data Limitations

- Synthetic, AI-generated data (not reflective of real customer behavior)
- Single time period snapshot (no trend analysis)
- Last-click attribution model (doesn't account for multi-touch journeys)
- Small sample sizes in some segments (Czech Republic, Austria)

---

## Conclusion

The company has a solid foundation with consistent sales cycles and proven performance in core markets (Germany, UK, Windows/macOS). However, three urgent priorities exist: (1) fix the mobile funnel collapse, (2) investigate geographic underperformance in major markets, and (3) capitalize on high-efficiency channels. Addressing these within 6 months can unlock significant growth.
