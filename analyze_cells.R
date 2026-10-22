
# Cytoskeleton and Cell Morphology
# Phenotype: Actin Blebs
# Field ID: 15962

# 1. Read Fiji measurements
cells <- read.csv("fiji_results.csv")

# Keep the required measurement columns
cells <- cells[, c("Area", "Mean", "Circ.", "AR")]

# Add cell numbers
cells$Cell <- seq_len(nrow(cells))

# Arrange columns
cells <- cells[, c("Cell", "Area", "Mean", "Circ.", "AR")]

# 2. View measurements and summary
print(cells)
print(summary(cells))

# 3. Save cell summary
write.csv(
  cells,
  file = "cell_summary.csv",
  row.names = FALSE
)

# 4. Plot: Area vs Circularity
png(
  filename = "area_vs_circularity.png",
  width = 1000,
  height = 700
)

plot(
  cells$Area,
  cells$Circ.,
  main = "Cell Area vs Circularity",
  xlab = "Cell Area (pixels squared)",
  ylab = "Circularity",
  pch = 19
)

dev.off()

# 5. Plot: Actin Intensity
png(
  filename = "actin_intensity.png",
  width = 1000,
  height = 700
)

barplot(
  cells$Mean,
  names.arg = cells$Cell,
  main = "Actin Intensity by Cell",
  xlab = "Cell Number",
  ylab = "Mean Gray Value"
)

dev.off()

# 6. Confirm output files
print(
  list.files(
    pattern = "^(cell_summary\\.csv|area_vs_circularity\\.png|actin_intensity\\.png)$"
  )
)
