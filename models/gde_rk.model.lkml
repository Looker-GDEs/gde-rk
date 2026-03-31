connection: "default_bigquery_connection"

# ── Views (all domain sub-folders) ──────────────────────────
include: "/views/**/*.view.lkml"


#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }



# ============================================================
# Explore: UK Generation Mix
# Domain: energy
# ============================================================

explore: generationmix {
  label:       "UK Generation Mix"
  description: "Half-hourly GB electricity generation by fuel type and carbon intensity."
  view_name:   generationmix

  # Default time filter so queries don't accidentally full-scan
  always_filter: {
    filters: [generationmix.datetime_utc_raw: "last 90 days"]
  }

  # Suggested field sets for quick exploration ----------------
  fields: [ALL_FIELDS*]

  tags: ["energy", "generation", "carbon"]
}
