# Obtain cytoband and nearest gene information
# d = data set including column names "snp", "chr", "pos" (for SNP ID, chromosome and position, respectively)
# build = human genome build: either 37 or 38
# sta = distance before the gene in base pairs
# end = distance after the gene in base pairs
map.cyto.gene <- function(d,build=38,sta=20000,end=20000,...) {
  require(RCytoGPS) # for mapping variant to cytoband using data(cytobandLocations)
  require(snpsettest) # for mapping variant to gene with "map_snp_to_gene" command
  
  if(!("snp"%in%colnames(d))) { stop("Column for SNP name (snp) not present") }
  if(!("chr"%in%colnames(d))) { stop("Column for chromosome (chr) not present") }
  if(!("pos"%in%colnames(d))) { stop("Column for position (pos) not present") }
  if(!(build)%in%c(37,38)) { stop("Human genome build must take values 37 (GRCh37) or 38 (GRCh38)") }
  if(sta<0) { stop("Distance before the gene must be a non-negative integer") }
  if(end<0) { stop("Distance after the gene must be a non-negative integer") }
  
  #############
  # Gene data #
  #############
  x <- d[,c("snp","chr","pos")]
  colnames(x)[1] <- "id"
  sta <- sta/1000
  end <- end/1000
  if(build==37) {
    g <- gene.curated.GRCh37
  }
  if(build==38) {
    g <- gene.curated.GRCh38
  }
  x <- map_snp_to_gene(info_snp=x,g,extend_start=sta,extend_end=end,only_sets=FALSE)
  g <- g[which(g$gene.id%in%x$map$gene.id),]
  d$gene <- ""
  for(i in 1:nrow(d)) {
    snp <- d$snp[i]
    map <- x$map[which(x$map==snp),]
    if(is.na(mean(map$gene.start))) {
      # do nothing
    } else {
      gene.ids <- unique(map$gene.id)
      genes <- g[which(g$gene.id%in%gene.ids),]$gene.name # match gene.ids to "g"
      d[i,]$gene <- paste(genes,collapse=", ")
      rm(gene.ids,genes)
    }
    rm(snp,map)
  }; rm(i)
  
  # Cytoband data: cytoband locations were unchanged from b37 to b38
  map <- cytobandLocations
  map$chr <- gsub("chr","",map$Chromosome,fixed=TRUE)
  map[which(map$chr=="X"),]$chr <- "23"
  map[which(map$chr=="Y"),]$chr <- "24"
  
  map$chr <- as.numeric(map$chr)
  d$cytoband <- ""
  for(i in 1:nrow(d)) {
    chr <- d$chr[i]
    pos <- d$pos[i]
    cyt <- row.names(map[which(map$chr==chr & (map$loc.start<=pos & map$loc.end>=pos)),])
    d[i,]$cytoband <- cyt
    rm(chr,pos,cyt)
  }; rm(i)
  
  return(d)
}
