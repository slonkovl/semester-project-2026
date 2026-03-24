# Nuclear Image Analysis: Human vs. AI Benchmark

Welcome to our collaborative research project! This semester, we are benchmarking various image analysis workflows—ranging from manual counting to Deep Learning—to quantify how object overlap (0%–45%) impacts scientific data integrity. You will learn what are the challenges and benefits of each approach.

Your contributions will serve as the foundation for a comparative study on **Inter-rater variability and Model Robustness**.

---

## Project Structure

Each student is assigned a unique ID (`student_01` and so on). Your workspace consists of:
* **`images/`**: Your assigned 15 TIFF images.
* **`images/student_XY/masks/`**: A subfolder for your Phase 4 pixel-wise segmentations.
* **`student_XY_counts.csv`**: Your master reporting table. (Copy the template to your folder and replace the XY by your ID)

---

## The Reporting Table

Update your `.csv` file incrementally. **Do not change column names or the file structure.** 
| Column | Description |
| :--- | :--- |
| **image_id** | Filename of the image (e.g., `img_01.tif`). |
| **manual_count** | Points clicked manually in ImageJ/Fiji. |
| **script_own** | Results from your custom-tuned Fiji macro. |
| **script_simple** | Results from basic global thresholding (Class Workshop). |
| **script_watershed** | Results from classic Watershed segmentation (Class Workshop). |
| **script_StarDist** | Results using the **Pre-trained StarDist model**. |
| **YOLO_count** | Number of bounding boxes detected (Phase 5 - Optional). |

---

## Semester Phases & Instructions

### Phase 1: Manual Baseline
* **Task:** Perform manual point counting in Fiji/ImageJ.
* **Goal:** Establish a "Human Gold Standard" and measure inter-rater variability.
* **Note:** Some images are hidden duplicates to test your individual consistency (Intra-rater test).

### Phase 2: Classic Computer Vision
* **Task:** Apply global thresholding and Watershed. Compare your own script vs script we make together in class.
* **Focus:** Identify the "breaking point" where classic algorithms fail to separate overlapping nuclei. Test limits of reproducibility.

### Phase 3: Pre-trained StarDist
* **Task:** Run the pre-trained **StarDist** model (instance segmentation).
* **Focus:** Observe how Star-convex polygons handle the 30% and 45% overlap cases compared to Watershed.

### Phase 4: Pixel-wise Annotation
* **Task:** Create precise binary masks for your unique image set.
* **Output:** Save results as `.tif` files in your `/mask` subfolder.
* **Format:** Name them identically to the source image (e.g., `img_01.tif` source $\rightarrow$ `img_01.tif` mask). These will be used to evaluate pixel-level accuracy (Jaccard/Dice indices).
* **Focus:** Pixel-wise comparison, differences in anotation, challenges in annotation and model training.



### Phase 5: YOLO Detection (Optional / Bonus)
* **Task:** Annotate Bounding Boxes and train a **YOLO** object detection model.
* **Focus:** Compare detection-only accuracy against full instance segmentation.

---

## Technical Guidelines

1. **Decimal Separator:** Always use a **DOT** (`.`) in your CSVs.
2. **Data Integrity:** Do not "correct" your manual counts after seeing the AI results. We need to document the raw human error.
3. **Git Workflow:** * `git pull` before starting. (Or fork.)
   * `git commit -m "Update Phase X for student_XY"`
   * `git push` to your specific branch/folder.

---

## Evaluation Metrics
We will be using the following metrics for our final analysis:
* **MAE (Mean Absolute Error):** For counting precision.
* **Bland-Altman Plots:** To visualize bias in different methods.
* **Jaccard Index:** To measure the overlap between your Phase 4 masks and the Ground Truth.

---

## Licencing

The original image data and ground truth masks are from "image set [BBBC004v1](https://bbbc.broadinstitute.org/BBBC004) [Ruusuvuori et al., in Proc. of the 16th European Signal Processing Conference (EUSIPCO-2008), 2008] from the Broad Bioimage Benchmark Collection [Ljosa et al., Nature Methods, 2012](http://dx.doi.org/10.1038/nmeth.2083)." This data is licenced udner a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/) [Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/) by [Pekka Ruusuvuori](pekka.ruusuvuori@tut.fi).

Rest of the content is under [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) licence.

## Other used datasets

[https://download.fht.org/jug/n2v/SEM.zip](https://download.fht.org/jug/n2v/SEM.zip)

---
**Contact:** If you find corrupted images or have issues with the StarDist plugin, please open an "Issue" in this repository.
