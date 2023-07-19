terraform {
  backend "s3" {
    bucket = ${{ secrets.AWS_BUCKET_NAME }}
    key    = ${{ secrets.AWS_BUCKET_KEY_NAME }}
    region = ${{ secrets.AWS_REGION }}
  }
}
