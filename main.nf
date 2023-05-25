
nextflow.enable.dsl=2

log.info """\
	F A S T P | F A S T Q C - N F   P I P E L I N E
 	===============================================
        reads = ${params.reads}
        reports = ${params.fastqc}
        outdir = ${params.outdir}
        """
        
// import modules
include { FASTP } from './modules/fastp'
include { FASTQC } from './modules/fastqc'

workflow {
    read_pairs_ch = Channel.fromFilePairs(params.reads)
    read_pairs_ch.view()
    FASTP(read_pairs_ch)
     //.view()
    FASTQC( FASTP.out.reads )
    
}

/* 
 * completion handler
 */
// workflow.onComplete {
// 	log.info ( workflow.success ? "\nDone! Open the html reports in your output directory in your browser." : "Oops .. something went wrong" )
// }
      
