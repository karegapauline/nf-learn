process FASTP {
    input:
        tuple val(sample_id), path(reads)

    output:
        tuple val(sample_id), path("${sample_id}_{1,2}_filtered.fastq.gz"), emit: reads
        path("${sample_id}.fastp.json"), emit: json

    script:
    """
    fastp -i ${reads[0]} -I ${reads[1]} -o ${sample_id}_1_filtered.fastq.gz -O ${sample_id}_2_filtered.fastq.gz \\
      --detect_adapter_for_pe -j ${sample_id}.fastp.json
    """
}
