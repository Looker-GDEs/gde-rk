- dashboard: generation_overview
  title: "UK Generation Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "High-level view of GB electricity generation mix, renewables share and carbon intensity."

  filters:
  - name: date_range
    title: "Date Range"
    type: date_filter
    default_value: "last 30 days"
    allow_multiple_values: false
    required: false

  elements:

  # ── KPIs ────────────────────────────────────────────────────────────────────
  - title: "Total Generation (MW)"
    name: kpi_total_generation
    model: energy
    explore: generationmix
    type: single_value
    fields: [generationmix.total_generation_mwh]
    listen:
      date_range: generationmix.datetime_date
    row: 0
    col: 0
    width: 6
    height: 3

  - title: "Avg Renewable %"
    name: kpi_avg_renewable
    model: energy
    explore: generationmix
    type: single_value
    fields: [generationmix.avg_renewable_perc]
    listen:
      date_range: generationmix.datetime_date
    row: 0
    col: 6
    width: 6
    height: 3

  - title: "Avg Carbon Intensity (gCO₂/kWh)"
    name: kpi_avg_carbon
    model: energy
    explore: generationmix
    type: single_value
    fields: [generationmix.avg_carbon_intensity]
    listen:
      date_range: generationmix.datetime_date
    row: 0
    col: 12
    width: 6
    height: 3

  # ── Generation mix over time ─────────────────────────────────────────────────
  - title: "Generation Mix Over Time"
    name: generation_mix_over_time
    model: energy
    explore: generationmix
    type: looker_area
    fields:
      - generationmix.datetime_date
      - generationmix.wind
      - generationmix.solar
      - generationmix.nuclear
      - generationmix.gas
      - generationmix.coal
      - generationmix.biomass
      - generationmix.hydro
    sorts: [generationmix.datetime_date asc]
    limit: 500
    listen:
      date_range: generationmix.datetime_date
    row: 3
    col: 0
    width: 24
    height: 8

  # ── Carbon intensity trend ───────────────────────────────────────────────────
  - title: "Carbon Intensity Over Time"
    name: carbon_intensity_trend
    model: energy
    explore: generationmix
    type: looker_line
    fields:
      - generationmix.datetime_date
      - generationmix.avg_carbon_intensity
    sorts: [generationmix.datetime_date asc]
    limit: 500
    listen:
      date_range: generationmix.datetime_date
    row: 11
    col: 0
    width: 12
    height: 6

  # ── Renewable vs fossil split ────────────────────────────────────────────────
  - title: "Renewable vs Fossil Split"
    name: renewable_vs_fossil
    model: energy
    explore: generationmix
    type: looker_donut_multiples
    fields:
      - generationmix.avg_renewable_perc
      - generationmix.fossil_perc
    listen:
      date_range: generationmix.datetime_date
    row: 11
    col: 12
    width: 12
    height: 6

