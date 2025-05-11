# nmfs_palette() works

    Code
      coral_palette(10)
    Output
       [1] "#FF6C57" "#F3533C" "#E73A21" "#DB2207" "#CF1D04" "#C31702" "#B71300"
       [8] "#AA1200" "#9D1200" "#901200"

---

    Code
      coral_palette_rev(10)
    Output
       [1] "#901200" "#9D1200" "#AA1200" "#B71300" "#C31802" "#CF1D04" "#DB2207"
       [8] "#E63A21" "#F3533C" "#FF6C57"

# nmfs_palette() fails

    Code
      nmfs_palette("foo")
    Condition
      Error in `interpolate()`:
      ! need at least two non-NA values to interpolate

