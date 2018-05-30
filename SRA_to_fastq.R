#The following commands were found from a Genomics Toolkit tutorial page: 
# http://www.sthda.com/english/wiki/from-sra-to-fastq-file


#First you will need to navigate to the SRAs for the BioProject you want
#In the top right click the drop down menu "Send to:" -> File -> Format(RunInfo)
#This will give you the csv that is needed for the first step

#Read SRA file infos
sri<-read.csv("SraRunInfo.csv", stringsAsFactors=FALSE)
files<-basename(sri$download_path)
for(i in 1:length(files)) download.file(sri$download_path[i], files[i])

#You must have SRA-toolkit installed; it will be called with below

# Assure that all the files has been downloaded successfully
# Remember, the R object files has been created in the previous code chunk
stopifnot( all(file.exists(files)) ) 
for(f in files) {
  cmd = paste("'/Users/clwickwa/sra-toolkit/bin/fastq-dump' --split-3", f)
  cat(cmd,"\n") #print the current command
  system(cmd) #invoke command
}

