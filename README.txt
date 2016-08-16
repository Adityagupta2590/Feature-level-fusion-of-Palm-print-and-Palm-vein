
Tittle: Feature level fusion of palm print and palm vein using discrete cosine transform (DCT)

Author:Aditya Gupta

Webside:https://sites.google.com/site/adityagupta2590/

Contact details:Ph:- +919028294631
		e-mail:- adityagupta2590@gmail.com 

Description:
Biometric systems have become a major part of research due its application of identification. Code provides a multimodal biometric system using palm prints modality combined with palm print modality. The proposed methodology uses standard deviation of pre-defined block of DCT coefficient as feature vector. Recognition process is   being done by performing distance measurement between feature vector of testing and training data set. Results show that the False Acceptance Rate (FAR) of feature level fusion is less than that of uni-modal systems, hence having multimodality is advantageous. Testing and training is done on database of 500 students of College of Engineering Pune 

The source folder contains 5 m-files: 
a)	palmvien_training.m: This program performs feature level extraction of palm vein of 500 students (4 images each). The image is converted into feature vector of 1 x 39. This program is used to create training sets. Feature is stored in text file name features_palmvien_1000.txt. 
b)	palmvien_testing.m: This program performs feature level extraction of palm vein of 500 students (2 images each). The image is converted into feature vector of 1 x 39. This program is used to create training sets. Feature is stored in text file name features_palmvien_1000_test.txt.

c)	Palmprint_Training.m: This program performs feature level extraction of palm vein of 500 students (4 images each). The image is converted into feature vector of 1 x 39. This program is used to create training sets. Feature is stored in text file name features_palmprint_1000.txt.
d)	Palmprint_testing.m: This program performs feature level extraction of palm vein of 500 students (2 images each). The image is converted into feature vector of 1 x 39. This program is used to create training sets. Feature is stored in text file name features_palmprint_1000_test.txt.

e)	palm_print_vien_fu.m: This program performs feature level fusion of palm print and palm vein. Feature vector of palm print and palm vein is fussed for training and testing sets. Comparison is performed using Canberra distance, Euclidean distance.

Note: The user can directly run the m-file ” palm_print_vien_fu.m” as file containing training and testing feature vector of palm print and palm vein is already stored in source code folder. But in program address need to be change.