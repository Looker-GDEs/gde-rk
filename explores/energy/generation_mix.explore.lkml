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
    filters: [generationmix.datetime_date: "last 90 days"]
  }

  # Suggested field sets for quick exploration ----------------
  fields: [ALL_FIELDS*]

  tags: ["energy", "generation", "carbon"]
}

