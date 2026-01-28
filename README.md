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

## Business Problem

The fictional SaaS company faces four interconnected challenges:

1. **Marketing Efficiency vs. Scale Trade-off:** High-performing channels (Paid Search, Email) have limited volume, while high-traffic channels (Organic Search, Social Media) underconvert to revenue, creating a tension between scale and quality.

2. **Platform-Specific Funnel Breakdown:** Mobile devices represent substantial traffic but fail to convert to purchases, suggesting either a technical issue, user experience problem, or fundamental misalignment between mobile users and the product's value proposition.

3. **Geographic Market Inconsistency:** European markets show wildly different conversion patterns despite similar traffic volumes. France, Spain, and other major markets dramatically underperform relative to Germany and the UK, indicating potential localization, product-market fit, or operational execution gaps.

4. **Funnel Visibility:** While overall timing is predictable, the company lacks clarity on which segments to prioritize for growth, where to allocate limited resources, and how to address underperforming segments without cannibalizing efforts in mature markets.

---

## Methodology

- **Data:** Synthetic dataset representing a B2B SaaS company across 5 channels, 5 platforms, 11 countries
- **Metrics:** Conversion rates at each funnel stage (visitors → sign-ups → demos → purchases)
- **Approach:** Comparative performance analysis, conversion rate benchmarking, funnel velocity assessment

---

## Key Results

### By Acquisition Channel
| Channel | Visitors | Demo Conversion | Purchase Conversion |
|---|---|---|---|
| Paid Search | 137 | 53% | 5.8% |
| Email | 150 | 49% | 5.3% |
| Organic Search | 252 | 38% | 5.2% |
| Social Media | 257 | 37% | 3.9% |
| Referral | 204 | 38% | 3.9% |

**Insight:** Paid Search and Email are most efficient; Organic Search has the biggest volume opportunity.

### By Platform
| Platform | Visitors | Purchase Conversion |
|---|---|---|
| Windows | 288 | 6.3% |
| macOS | 259 | 3.9% |
| Android | 159 | 4.4% |
| iOS | 196 | 4.1% |
| Linux | 98 | 4.1% |

**Insight:** Desktop dominates; mobile represents 34% of traffic but only 8% of purchases.

### By Geography
| Country | Visitors | Purchase Conversion |
|---|---|---|
| Germany | 160 | 5.0% |
| Poland | 85 | 7.1% |
| UK | 112 | 5.4% |
| Belgium | 63 | 6.3% |
| France | 128 | 2.3% |
| Spain | 85 | 2.4% |

**Insight:** France and Spain underperform by 50-60% relative to comparable markets.

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

- SQL: CTEs, Joins, Case, aggregate functions
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
