view: raw_generationmix {
  sql_table_name: `looker-gde-instance.generation_mix.generation-mix` ;;

  dimension: biomass {
    type: number
    sql: ${TABLE}.BIOMASS ;;
  }
  dimension: biomass_perc {
    type: number
    sql: ${TABLE}.BIOMASS_perc ;;
  }
  dimension: carbon_intensity {
    type: number
    sql: ${TABLE}.CARBON_INTENSITY ;;
  }
  dimension: coal {
    type: number
    sql: ${TABLE}.COAL ;;
  }
  dimension: coal_perc {
    type: number
    sql: ${TABLE}.COAL_perc ;;
  }
  dimension_group: datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.DATETIME ;;
  }
  dimension: fossil {
    type: number
    sql: ${TABLE}.FOSSIL ;;
  }
  dimension: fossil_perc {
    type: number
    sql: ${TABLE}.FOSSIL_perc ;;
  }
  dimension: gas {
    type: number
    sql: ${TABLE}.GAS ;;
  }
  dimension: gas_perc {
    type: number
    sql: ${TABLE}.GAS_perc ;;
  }
  dimension: generation {
    type: number
    sql: ${TABLE}.GENERATION ;;
  }
  dimension: generation_perc {
    type: number
    sql: ${TABLE}.GENERATION_perc ;;
  }
  dimension: hydro {
    type: number
    sql: ${TABLE}.HYDRO ;;
  }
  dimension: hydro_perc {
    type: number
    sql: ${TABLE}.HYDRO_perc ;;
  }
  dimension: imports {
    type: number
    sql: ${TABLE}.IMPORTS ;;
  }
  dimension: imports_perc {
    type: number
    sql: ${TABLE}.IMPORTS_perc ;;
  }
  dimension: low_carbon {
    type: number
    sql: ${TABLE}.LOW_CARBON ;;
  }
  dimension: low_carbon_perc {
    type: number
    sql: ${TABLE}.LOW_CARBON_perc ;;
  }
  dimension: nuclear {
    type: number
    sql: ${TABLE}.NUCLEAR ;;
  }
  dimension: nuclear_perc {
    type: number
    sql: ${TABLE}.NUCLEAR_perc ;;
  }
  dimension: other {
    type: number
    sql: ${TABLE}.OTHER ;;
  }
  dimension: other_perc {
    type: number
    sql: ${TABLE}.OTHER_perc ;;
  }
  dimension: renewable {
    type: number
    sql: ${TABLE}.RENEWABLE ;;
  }
  dimension: renewable_perc {
    type: number
    sql: ${TABLE}.RENEWABLE_perc ;;
  }
  dimension: solar {
    type: number
    sql: ${TABLE}.SOLAR ;;
  }
  dimension: solar_perc {
    type: number
    sql: ${TABLE}.SOLAR_perc ;;
  }
  dimension: storage {
    type: number
    sql: ${TABLE}.STORAGE ;;
  }
  dimension: storage_perc {
    type: number
    sql: ${TABLE}.STORAGE_perc ;;
  }
  dimension: wind {
    type: number
    sql: ${TABLE}.WIND ;;
  }
  dimension: wind_emb {
    type: number
    sql: ${TABLE}.WIND_EMB ;;
  }
  dimension: wind_emb_perc {
    type: number
    sql: ${TABLE}.WIND_EMB_perc ;;
  }
  dimension: wind_perc {
    type: number
    sql: ${TABLE}.WIND_perc ;;
  }
  dimension: zero_carbon {
    type: number
    sql: ${TABLE}.ZERO_CARBON ;;
  }
  dimension: zero_carbon_perc {
    type: number
    sql: ${TABLE}.ZERO_CARBON_perc ;;
  }
  measure: count {
    type: count
  }
}
