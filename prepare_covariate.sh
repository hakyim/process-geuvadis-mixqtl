# ARGS1: target directory

targetdir=$1
nowdir=`pwd`

if [[ ! -d $targetdir ]]
then
  mkdir $targetdir
fi
cd $targetdir

plinkfilepre=GEUVADIS.chr22.PH1PH2_465.IMPFRQFILT_BIALLELIC_PH.annotv2.genotypes
peerdir=peer

pcafile=$plinkfilepre.eigenvec
peerfile=$peerdir/X.csv
pedigreefile=20130606_g1k.ped
processfile=rmdup-GD660.GeneQuantCount.txt.gz

covarfile=geuvadis.covariate.txt.gz

if [[ ! -f $covarfile ]]
then
  Rscript $nowdir/util/compose_covariates.R \
    --peer $peerfile \
    --peer_meta $processfile \
    --pca $pcafile \
    --pedigree $pedigreefile \
    --output $covarfile 
fi         