params.outdir = 'results'

process FASTQC{
    publishDir path: { "${params.outdir}/fastqc_logs" }
    input:
        tuple val(sample_id), path(fastp)

    output:
        path "${sample_id}_{1,2}_filtered_fastqc.html"
        path "${sample_id}_{1,2}_filtered_fastqc.zip"
        
    

    script:
    """
    fastqc "${fastp[0]}" "${fastp[1]}"  
    """
}

