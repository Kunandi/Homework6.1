 #Move to the “homework_6” directory, create a directory “part_3” and cd into it. 2) Make a copy of the directory CDS and its contents from the directory
#biobootcamp/scripting_4_biologists/homework_files on the ASC and place it in your “part_3” directory.
#   
#3) The files in the CDS directory are DNA sequences in FASTA format. The purpose of this exercise it to translate the nucleic acid sequences to amino acid sequences while generating statistics for each set of sequences before and after the translation. Thus, using one of the files for testing, do the following:
#a) Truncate each descriptor line (those that start with the > sign) so that only what is to the left of the first whitespace is retained.
#b) Following modification of the descriptor lines, generate a summary whose output is the total FASTA file statistics along with a histogram using the script get_fasta_stats.pl (this script is in your $PATH on the ASC; read the help provided by the script for appropriate flags) and redirect this output to a file.
#4) Next, use the binary transeq to translate the DNA sequences to amino acids in the first reading frame and save the output with the same filename but a *.pep file extension. Hints: use the flag “-sformat pearson” with transeq to greatly speed up the translation and view the help for transeq with the -h flag).
#5) Following translation of the DNA sequences to amino acids, generate a summary whose output is the total FASTA file statistics, as well as individual sequence statistics, for the *.pep and redirect the output to a file.
#6) Once you have been able to work through the above correctly on the single test file, write a script containing two (2) for-do-done loops, with the first loop completing #3-4 above and the 2nd loop completing #5 above. Once the script is written with nano (please name it nuc_aa_fasta_summary_YOURLASTNAME.sh), run it on the six (6) files in the CDS directory.
#7) Stage and commit the “nuc_aa_fasta_summary_YOURLASTNAME.sh” as well as redirected output files from #3b and #5 above with git. You can remove the *.cds and *.pep files at this point since they are no longer needed, and their large size isn’t amenable for adding to your git database.
read -p "enter file name" filename
#Truncating
for contigs in ${filename}; do 
awk 'length > 70' ${filename}>> ${filename}_DNA.trunc
wc -l -w -m ${filename}_DNA.trunc >> ${filename}_DNA.stats
done
for contigs in ${filename}_DNA.trunc; do
#moving to 2nd script
sh ./get_fasta_stats.pl -a -g  -p -r ${filename}_DNA.trunc >> ${filename}_DNA.stats
#Going to transeq
transeq -sformat pearson -sequence ${filename}_DNA.trunc -outseq ${filename}_DNA.pep 
#getting stats
sh ./get_fasta_stats.pl -a -g  -p -r ${filename}_DNA.pep >> ${filename}_AA.stats
done
