
name = getTitle();
run("Trainable Weka Segmentation");
wait(500);
//selectImage("Trainable Weka Segmentation v3.3.4");
//wait(500);
// je potřeba změnit cestu k modelu
call("trainableSegmentation.Weka_Segmentation.loadClassifier", "C:\\Users\\schatzm\\Downloads\\semester-project-2026-main\\semester-project-2026-main\\classifier1.model");
wait(500);
call("trainableSegmentation.Weka_Segmentation.getResult");
wait(500);
//selectImage("Classified image");
// přejmenuju obrázek na origo jméno
rename(name);

setAutoThreshold("Otsu dark no-reset");
//run("Threshold...");
//setThreshold(1, 255);
setOption("BlackBackground", true);
run("Convert to Mask");
run("Analyze Particles...", "display clear summarize overlay add");
