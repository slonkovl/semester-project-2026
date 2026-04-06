//run("Close All");

a = getTitle();
selectImage(a);

run("Gaussian Blur...", "sigma=2.5");
//run("Threshold...");
setAutoThreshold("Otsu dark no-reset");
//setThreshold(123, 255);
setOption("BlackBackground", true);
run("Convert to Mask");
run("Analyze Particles...", "display exclude clear summarize overlay add");

roiManager("Set Color", "red");
roiManager("Set Line Width", 2);
