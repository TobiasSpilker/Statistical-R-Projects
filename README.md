# 📈 R-Analysis-Assignments

A compact collection of three independent R scripts showcasing typical data-analysis tasks:

| Script | Purpose | Key Packages |
| ------ | ------- | ------------ |
| **`memory_modeling.R`** | Simulates the effect of repeated practice on recall accuracy and latency, based on ACT-R-style equations. Produces two diagnostic plots. | *base R* |
| **`decision_metrics.R`** | Loads **`BlastDecisions.Rdata`**, counts hits/false-alarms, derives sensitivity & specificity vectors, and draws four ROC-style panels. | *base R* |
| **`network_visualization.R`** | Builds two toy directed graphs (traditional vs. modified), then plots network layouts, training-loss curves, and a comparative ROC. | **igraph**, **ggraph** |

---

## Repository layout
```text
.
├── data/
│   └── BlastDecisions.Rdata     # source file for decision_metrics.R
├── memory_modeling.R            # assignment 1–4 code
├── decision_metrics.R           # ROC counting and plotting
├── network_visualization.R      # graph demos + performance plots
└── README.md                    # this file
```

---

## Requirements

| Software | Version |
| -------- | ------- |
| **R** | ≥ 4.0 |
| **Packages** | `igraph`, `ggraph` (script 3 only) |

Install missing libraries:

```r
install.packages(c("igraph", "ggraph"))
```

---

## Running the scripts

| Task | Command | Output |
| ---- | ------- | ------ |
| Memory-model plots | `Rscript memory_modeling.R` | Accuracy & latency curves |
| Decision metrics + ROC | `Rscript decision_metrics.R` | 2 × 2 ROC panel, hit/false-alarm table |
| Network & performance demo | `Rscript network_visualization.R` | Graph layouts, log-MSE curve, comparative ROC |

To save graphics automatically:

```r
png("output.png", width = 1600, height = 800)
source("memory_modeling.R")
dev.off()
```

---

## Notes

* **Parameter optimisation** – `Optimizer()` in *memory_modeling.R* is a stub; extend with `optim()` or similar.  
* **Decision-data generality** – *decision_metrics.R* assumes `classification` ∈ {`"B"`, `"NB"`} and logical `accuracy`. Adapt if needed.  
* **Network examples** – Replace edge lists in *network_visualization.R* with real adjacency data to visualise your own systems.  

---

## License

Personal/educational use only. Contact the author for redistribution or commercial purposes.
