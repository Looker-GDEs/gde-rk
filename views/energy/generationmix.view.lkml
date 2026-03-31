view: generationmix {
  label: "Generation Mix"
  sql_table_name: `looker-gde-instance.generation_mix.generation-mix` ;;
  drill_fields: [detail*]

  # ── Time ────────────────────────────────────────────────────────────────────
  dimension_group: datetime_utc {
    label: "Datetime UTC"
    group_label: "Time"
    description: "UTC timestamp for the generation mix snapshot. Sourced from DATETIME in ISO 8601 format. This dimension group is stored in UTC and is not timezone-converted in Looker."
    type: time
    timeframes: [raw, time, hour, date, week, month, quarter, year]
    convert_tz: no
    sql: ${TABLE}.DATETIME ;;
  }

  # ── Hidden base row-level fields ────────────────────────────────────────────
  dimension: gas_mw {
    hidden: yes
    label: "Gas (MW)"
    description: "Row-level gas-fired generation in megawatts at the snapshot timestamp. Direct mapping to column GAS."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.GAS ;;
  }

  dimension: coal_mw {
    hidden: yes
    label: "Coal (MW)"
    description: "Row-level coal-fired generation in megawatts at the snapshot timestamp. Direct mapping to column COAL."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.COAL ;;
  }

  dimension: nuclear_mw {
    hidden: yes
    label: "Nuclear (MW)"
    description: "Row-level nuclear generation in megawatts at the snapshot timestamp. Direct mapping to column NUCLEAR."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.NUCLEAR ;;
  }

  dimension: wind_mw {
    hidden: yes
    label: "Metered Wind (MW)"
    description: "Row-level metered wind generation in megawatts at the snapshot timestamp. Direct mapping to column WIND."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.WIND ;;
  }

  dimension: embedded_wind_mw {
    hidden: yes
    label: "Embedded Wind (MW)"
    description: "Row-level embedded or non-metered wind generation in megawatts at the snapshot timestamp. Direct mapping to column WIND_EMB."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.WIND_EMB ;;
  }

  dimension: total_wind_mw {
    hidden: yes
    label: "Total Wind (MW)"
    description: "Row-level total wind generation in megawatts, calculated as metered wind plus embedded wind."
    type: number
    value_format_name: decimal_0
    sql: COALESCE(${TABLE}.WIND, 0) + COALESCE(${TABLE}.WIND_EMB, 0) ;;
  }

  dimension: hydro_mw {
    hidden: yes
    label: "Hydro (MW)"
    description: "Row-level hydro generation in megawatts at the snapshot timestamp. Direct mapping to column HYDRO."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.HYDRO ;;
  }

  dimension: solar_mw {
    hidden: yes
    label: "Solar (MW)"
    description: "Row-level solar generation in megawatts at the snapshot timestamp. Direct mapping to column SOLAR."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.SOLAR ;;
  }

  dimension: biomass_mw {
    hidden: yes
    label: "Biomass (MW)"
    description: "Row-level biomass generation in megawatts at the snapshot timestamp. Direct mapping to column BIOMASS."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.BIOMASS ;;
  }

  dimension: storage_output_mw {
    hidden: yes
    label: "Storage Output (MW)"
    description: "Row-level storage discharge output in megawatts at the snapshot timestamp. Direct mapping to column STORAGE."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.STORAGE ;;
  }

  dimension: imports_mw {
    hidden: yes
    label: "Imports (MW)"
    description: "Row-level interconnector imports in megawatts at the snapshot timestamp. Direct mapping to column IMPORTS."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.IMPORTS ;;
  }

  dimension: other_mw {
    hidden: yes
    label: "Other (MW)"
    description: "Row-level generation from other fuel types in megawatts at the snapshot timestamp. Direct mapping to column OTHER."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.OTHER ;;
  }

  dimension: generation_mw {
    hidden: yes
    label: "Generation (MW)"
    description: "Row-level total generation in megawatts. Upstream aggregated total sourced from column GENERATION."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.GENERATION ;;
  }

  dimension: fossil_mw {
    hidden: yes
    label: "Fossil (MW)"
    description: "Row-level fossil generation in megawatts. Upstream aggregated total sourced from column FOSSIL, defined as gas plus coal."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.FOSSIL ;;
  }

  dimension: renewable_mw {
    hidden: yes
    label: "Renewable (MW)"
    description: "Row-level renewable generation in megawatts. Upstream aggregated total sourced from column RENEWABLE, defined as wind plus hydro plus solar."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.RENEWABLE ;;
  }

  dimension: low_carbon_mw {
    hidden: yes
    label: "Low Carbon (MW)"
    description: "Row-level low-carbon generation in megawatts. Upstream aggregated total sourced from column LOW_CARBON, defined as renewables plus nuclear plus biomass."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.LOW_CARBON ;;
  }

  dimension: zero_carbon_mw {
    hidden: yes
    label: "Zero Carbon (MW)"
    description: "Row-level zero-carbon generation in megawatts. Upstream aggregated total sourced from column ZERO_CARBON, defined as renewables plus nuclear."
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.ZERO_CARBON ;;
  }

  dimension: carbon_intensity_gco2_per_kwh {
    hidden: yes
    label: "Carbon Intensity (gCO2/kWh)"
    description: "Row-level carbon intensity of electricity at the snapshot timestamp, measured in grams of CO2 per kWh. Direct mapping to column CARBON_INTENSITY."
    type: number
    value_format_name: decimal_1
    sql: ${TABLE}.CARBON_INTENSITY ;;
  }

  set: detail {
    fields: [
      datetime_utc_raw,
      gas_mw,
      coal_mw,
      nuclear_mw,
      wind_mw,
      embedded_wind_mw,
      total_wind_mw,
      hydro_mw,
      solar_mw,
      biomass_mw,
      storage_output_mw,
      imports_mw,
      other_mw,
      generation_mw,
      fossil_mw,
      renewable_mw,
      low_carbon_mw,
      zero_carbon_mw,
      carbon_intensity_gco2_per_kwh
    ]
  }

  # ── Meta ────────────────────────────────────────────────────────────────────
  measure: count {
    label: "Records"
    group_label: "Meta"
    group_item_label: "Records"
    description: "Count of rows in the selected result set. Useful for checking how many snapshots are included in the query."
    type: count
    drill_fields: [detail*]
  }

  # ── Core generation measures ────────────────────────────────────────────────
  measure: avg_generation_mw {
    label: "Avg Generation (MW)"
    group_label: "Generation"
    group_item_label: "Average"
    description: "Average total generation in megawatts across the selected snapshots. Based on the upstream GENERATION column."
    type: average
    sql: ${generation_mw} ;;
    value_format_name: decimal_0
  }

  measure: peak_generation_mw {
    label: "Peak Generation (MW)"
    group_label: "Generation"
    group_item_label: "Peak"
    description: "Maximum total generation in megawatts observed within the selected snapshots."
    type: max
    sql: ${generation_mw} ;;
    value_format_name: decimal_0
  }

  # ── Carbon measures ─────────────────────────────────────────────────────────
  measure: avg_carbon_intensity_gco2_per_kwh {
    label: "Avg Carbon Intensity (gCO2/kWh)"
    group_label: "Carbon"
    group_item_label: "Average"
    description: "Average carbon intensity across the selected snapshots, measured in grams of CO2 per kWh."
    type: average
    sql: ${carbon_intensity_gco2_per_kwh} ;;
    value_format_name: decimal_1
  }

  measure: peak_carbon_intensity_gco2_per_kwh {
    label: "Peak Carbon Intensity (gCO2/kWh)"
    group_label: "Carbon"
    group_item_label: "Peak"
    description: "Maximum carbon intensity observed within the selected snapshots, measured in grams of CO2 per kWh."
    type: max
    sql: ${carbon_intensity_gco2_per_kwh} ;;
    value_format_name: decimal_1
  }

  # ── Supply mix summary ──────────────────────────────────────────────────────
  measure: avg_fossil_mw {
    label: "Avg Fossil (MW)"
    group_label: "Supply Mix Summary"
    group_item_label: "Fossil"
    description: "Average fossil generation in megawatts across the selected snapshots. Based on the upstream FOSSIL column, defined as gas plus coal."
    type: average
    sql: ${fossil_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_renewable_mw {
    label: "Avg Renewable (MW)"
    group_label: "Supply Mix Summary"
    group_item_label: "Renewable"
    description: "Average renewable generation in megawatts across the selected snapshots. Based on the upstream RENEWABLE column, defined as wind plus hydro plus solar."
    type: average
    sql: ${renewable_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_low_carbon_mw {
    label: "Avg Low Carbon (MW)"
    group_label: "Supply Mix Summary"
    group_item_label: "Low Carbon"
    description: "Average low-carbon generation in megawatts across the selected snapshots. Based on the upstream LOW_CARBON column, defined as renewables plus nuclear plus biomass."
    type: average
    sql: ${low_carbon_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_zero_carbon_mw {
    label: "Avg Zero Carbon (MW)"
    group_label: "Supply Mix Summary"
    group_item_label: "Zero Carbon"
    description: "Average zero-carbon generation in megawatts across the selected snapshots. Based on the upstream ZERO_CARBON column, defined as renewables plus nuclear."
    type: average
    sql: ${zero_carbon_mw} ;;
    value_format_name: decimal_0
  }

  # ── Fuel/component measures ────────────────────────────────────────────────
  measure: avg_gas_mw {
    label: "Avg Gas (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Gas"
    description: "Average gas-fired generation in megawatts across the selected snapshots."
    type: average
    sql: ${gas_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_coal_mw {
    label: "Avg Coal (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Coal"
    description: "Average coal-fired generation in megawatts across the selected snapshots."
    type: average
    sql: ${coal_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_nuclear_mw {
    label: "Avg Nuclear (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Nuclear"
    description: "Average nuclear generation in megawatts across the selected snapshots."
    type: average
    sql: ${nuclear_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_wind_mw {
    label: "Avg Metered Wind (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Metered Wind"
    description: "Average metered wind generation in megawatts across the selected snapshots."
    type: average
    sql: ${wind_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_embedded_wind_mw {
    label: "Avg Embedded Wind (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Embedded Wind"
    description: "Average embedded or non-metered wind generation in megawatts across the selected snapshots."
    type: average
    sql: ${embedded_wind_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_total_wind_mw {
    label: "Avg Total Wind (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Total Wind"
    description: "Average total wind generation in megawatts across the selected snapshots, calculated as metered wind plus embedded wind."
    type: average
    sql: ${total_wind_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_hydro_mw {
    label: "Avg Hydro (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Hydro"
    description: "Average hydro generation in megawatts across the selected snapshots."
    type: average
    sql: ${hydro_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_solar_mw {
    label: "Avg Solar (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Solar"
    description: "Average solar generation in megawatts across the selected snapshots."
    type: average
    sql: ${solar_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_biomass_mw {
    label: "Avg Biomass (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Biomass"
    description: "Average biomass generation in megawatts across the selected snapshots."
    type: average
    sql: ${biomass_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_other_mw {
    label: "Avg Other (MW)"
    group_label: "Fuel Mix"
    group_item_label: "Other"
    description: "Average generation from other fuel types in megawatts across the selected snapshots."
    type: average
    sql: ${other_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_imports_mw {
    label: "Avg Imports (MW)"
    group_label: "System Flows"
    group_item_label: "Imports"
    description: "Average interconnector imports in megawatts across the selected snapshots."
    type: average
    sql: ${imports_mw} ;;
    value_format_name: decimal_0
  }

  measure: avg_storage_output_mw {
    label: "Avg Storage Output (MW)"
    group_label: "System Flows"
    group_item_label: "Storage Output"
    description: "Average storage discharge output in megawatts across the selected snapshots."
    type: average
    sql: ${storage_output_mw} ;;
    value_format_name: decimal_0
  }

  # ── Ratio measures layered on top of base measures ─────────────────────────
  measure: fossil_share_of_generation {
    label: "Fossil Share of Generation"
    group_label: "Ratios"
    group_item_label: "Fossil Share"
    description: "Average fossil generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_fossil_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: renewable_share_of_generation {
    label: "Renewable Share of Generation"
    group_label: "Ratios"
    group_item_label: "Renewable Share"
    description: "Average renewable generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_renewable_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: low_carbon_share_of_generation {
    label: "Low Carbon Share of Generation"
    group_label: "Ratios"
    group_item_label: "Low Carbon Share"
    description: "Average low-carbon generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_low_carbon_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: zero_carbon_share_of_generation {
    label: "Zero Carbon Share of Generation"
    group_label: "Ratios"
    group_item_label: "Zero Carbon Share"
    description: "Average zero-carbon generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_zero_carbon_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: gas_share_of_generation {
    label: "Gas Share of Generation"
    group_label: "Ratios"
    group_item_label: "Gas Share"
    description: "Average gas-fired generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_gas_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: coal_share_of_generation {
    label: "Coal Share of Generation"
    group_label: "Ratios"
    group_item_label: "Coal Share"
    description: "Average coal-fired generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_coal_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: nuclear_share_of_generation {
    label: "Nuclear Share of Generation"
    group_label: "Ratios"
    group_item_label: "Nuclear Share"
    description: "Average nuclear generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_nuclear_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: total_wind_share_of_generation {
    label: "Wind Share of Generation"
    group_label: "Ratios"
    group_item_label: "Wind Share"
    description: "Average total wind generation divided by average total generation for the selected result set. Total wind is metered wind plus embedded wind. Returns a percentage."
    type: number
    sql: ${avg_total_wind_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: hydro_share_of_generation {
    label: "Hydro Share of Generation"
    group_label: "Ratios"
    group_item_label: "Hydro Share"
    description: "Average hydro generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_hydro_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: solar_share_of_generation {
    label: "Solar Share of Generation"
    group_label: "Ratios"
    group_item_label: "Solar Share"
    description: "Average solar generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_solar_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: biomass_share_of_generation {
    label: "Biomass Share of Generation"
    group_label: "Ratios"
    group_item_label: "Biomass Share"
    description: "Average biomass generation divided by average total generation for the selected result set. Returns a percentage."
    type: number
    sql: ${avg_biomass_mw} / NULLIF(${avg_generation_mw}, 0) ;;
    value_format_name: percent_1
  }

  measure: renewable_to_fossil_ratio {
    label: "Renewable to Fossil Ratio"
    group_label: "Ratios"
    group_item_label: "Renewable vs Fossil"
    description: "Average renewable generation divided by average fossil generation for the selected result set. A value above 1 means renewable exceeds fossil on average."
    type: number
    sql: ${avg_renewable_mw} / NULLIF(${avg_fossil_mw}, 0) ;;
    value_format_name: decimal_2
  }

  measure: low_carbon_minus_fossil_mw {
    label: "Low Carbon minus Fossil (MW)"
    group_label: "Ratios"
    group_item_label: "Low Carbon minus Fossil"
    description: "Difference between average low-carbon generation and average fossil generation, expressed in megawatts. Positive values mean low-carbon exceeds fossil on average."
    type: number
    sql: ${avg_low_carbon_mw} - ${avg_fossil_mw} ;;
    value_format_name: decimal_0
  }
}
