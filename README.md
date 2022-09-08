# JHU-JRC-Bootcamp
Teaching materials for the bootcamp by the Johns Hopkins University, Neuroscience Dept. and Janelia Research Campus

## Year 2022
Location: Janelia Research Campus
Date: 08/28/2022 - 00/30/2022

### Premier Lectures
##### machine learning for neuroscience
Srini Turaga

[Machine learning for neuroscience](./Lectures/Srini_Turaga_2022_Aug_JHU_bootcamp.pdf)

#### Matlab tutorial
Albert Lee

Matlab Primer pdf included here contains the Matlab basics you need for [this tutorial](https://www.mathworks.com/help/matlab/getting-started-with-matlab.html).

### Monkey data (Niebur Lab)

The goal of this tutorial is to learn the basics of spike train analysis and give an introduction to point processes, cross-correlation and the jitter method ([Amarasingham et al., 2012](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3349623/)). The tutorial will include additional material on generating Monte Carlo data and hypothesis testing. To start the tutorial, open the PDF called "Spike Train Analysis & The Jitter Method". We provide exercises involving creation and analysis of synthetic data and analysis of recorded data from Macaque motor cortex. These tasks will involve learning a couple basic algorithms and implementing them in Matlab.

* **Tutors**: Simon Locke (JHU)
* [**Teaching materials**](./Monkey/Spike_Train_Analysis_Jitter_Method.pdf)
* [**Dataset**](./Monkey/Data/)

### Mouse data -- intracellular place field analysis (Lee Lab)
__Receptive fields (RFs)__ are one of the cornerstones of neuroscience. The standard RF of a neuron for a given stimulus space is the neuron’s average firing rate as a function of each stimulus value. Traditionally, place fields are determined using extracellular recording in freely moving animals. But you can also get intracellular recordings of place cells in freely moving animals and you can get place cells in head‐fixed animals navigating virtual reality (VR) environments. These can be combined to give you intracellular recordings of place cells in VR. Your primary goal will be to compute the AP firing rate as a function of the animal’s location in the VR environment, using Matlab to accomplish this. If there is additional time, you can extract the AP firing
times directly from the intracellular trace, estimate the AP threshold, bandpass filter the intracellular trace, remove the APs from the trace and compute the subthreshold RF, and so on.

* **Tutors**: Jae Sung Lee (JRC)
* [**Teaching materials**](./Mouse_Intra/intra_analysis_bootcamp2022.pdf)
* [**Dataset**](./Mouse_Intra/Data/)

### Fish data -- whole brain imaging analysis (Ahrens Lab)
The goal of this class is to learn the basics of data analysis for large-scale calcium imaging experiments. In our experiment, calcium activities of ~100,000 neurons are simuntaneously recorded in the brain of larval zebrafish, which is behaving in a virtual reality environment. In this class, we use Matlab as a programming environment. We use the JHUworkshop_Ahrenslab_2019.mlx for demonstration and exercise of data analyses. The imaging dataset can be downloaded from the dropbox (https://figshare.com/s/1f7c6c7565e2cf4ae705). In this experiment, the fish changes its swim pattern in response to various visual stimuli presented in the environment. We analyze how activities of individual neurons are tuned to different behavioral variables (swim pattern, visual stimuli) and how they are distributed across the brain depending on their tuning.

* **Tutors**: Ziqiang Wei (JRC), Jing Xuan Lim (JHU, JRC), Emmanuel Marquez Legorreta(JRC), Dhruv Zocchi(JRC)
* **Teaching materials**: https://github.com/zqwei/explore-imaging-data
* **Dataset**: https://figshare.com/s/1f7c6c7565e2cf4ae705
