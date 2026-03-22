# ============================================================
# UK Energy – Looker Model
# Connection: update to match your Looker → BigQuery connection
# ============================================================

connection: "bigquery_looker_gde"

# ── Views (all domain sub-folders) ──────────────────────────
include: "/views/**/*.view.lkml"

# ── Explores (all domain sub-folders) ───────────────────────
include: "/explores/**/*.explore.lkml"

