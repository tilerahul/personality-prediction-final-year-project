package com.algo;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class CNN {

    // Read features from file into a double list
    private double[] readFeatures(String filename) throws IOException {
        ArrayList<Double> features = new ArrayList<>();
        BufferedReader br = new BufferedReader(new FileReader(filename));
        String line;
        while ((line = br.readLine()) != null) {
            try {
                features.add(Double.parseDouble(line.trim()));
            } catch (NumberFormatException e) {
                // skip invalid numbers
            }
        }
        br.close();

        // Convert to array
        double[] featureArray = new double[features.size()];
        for (int i = 0; i < features.size(); i++) {
            featureArray[i] = features.get(i);
        }
        return featureArray;
    }

    // Cosine similarity function
    private double cosineSimilarity(double[] vec1, double[] vec2) {
        if (vec1.length != vec2.length) return -1;

        double dot = 0.0, normA = 0.0, normB = 0.0;
        for (int i = 0; i < vec1.length; i++) {
            dot += vec1[i] * vec2[i];
            normA += Math.pow(vec1[i], 2);
            normB += Math.pow(vec2[i], 2);
        }
        return dot / (Math.sqrt(normA) * Math.sqrt(normB) + 1e-10); // small epsilon to avoid division by 0
    }

    // Return best-matching trait name
    public String predict(String testFilePath, String[] trainFilePaths, String[] classLabels) throws IOException {
        double[] testFeatures = readFeatures(testFilePath);

        double maxSim = -1;
        String bestClass = "Unknown";

        for (int i = 0; i < trainFilePaths.length; i++) {
            double[] trainFeatures = readFeatures(trainFilePaths[i]);
            double sim = cosineSimilarity(testFeatures, trainFeatures);

            if (sim > maxSim) {
                maxSim = sim;
                bestClass = classLabels[i];
            }
        }

        return bestClass;
    }
}




















/*import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class CNN {
	
	public boolean cnn(String file1,String file2) throws InterruptedException, IOException
	{
		
		BufferedReader reader1 = new BufferedReader(new FileReader(file1));
        
        BufferedReader reader2 = new BufferedReader(new FileReader(file2));
         
        String line1 = reader1.readLine();
         
        String line2 = reader2.readLine();
         
        boolean resultStatus = true;
       
        while (line1 != null || line2 != null)
        {
            if(line1.equalsIgnoreCase(line2))
            {
            	resultStatus = false;
                 
                break;
            }
             
            line1 = reader1.readLine();
            
            line2 = reader2.readLine();
             
           
        }
        reader1.close();
         
        reader2.close();
   
		
		return resultStatus;
	}
	
	
}*/
