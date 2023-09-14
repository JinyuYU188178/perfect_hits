#!/bin/bash


# Input files
query_file="$1"
subject_file="$2"
output_file="$3"

# Run BLAST
blastn -query "$query_file" -subject "$subject_file" -outfmt "6 qseqid sseqid length pident" | \
awk '$3 == length && $4 == 100' > "$output_file"

# Count and print the number of perfect matches
perfect_match_count=$(wc -l < "$output_file")
echo "Number of perfect matches: $perfect_match_count"
