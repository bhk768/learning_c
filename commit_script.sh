# Loop from Feb 1, 2026 up to May 5, 2026
for d in $(seq 0 $(($(($(date -d "2026-05-05" +%s) - $(date -d "2026-02-01" +%s))) / 86400)))
do
  DATE=$(date -d "2026-02-01 +$d day" +"%Y-%m-%dT06:00:32")

  # FIRST COMMIT
  echo "Commit 1 for $DATE" >> progress.log
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git add .
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "Day commit 1 on $DATE"

  # SECOND COMMIT (same date, +1 minute)
  DATE2=$(date -d "$DATE +1 minute" +"%Y-%m-%dT06:01:32")
  echo "Commit 2 for $DATE2" >> progress.log
  GIT_AUTHOR_DATE="$DATE2" GIT_COMMITTER_DATE="$DATE2" git add .
  GIT_AUTHOR_DATE="$DATE2" GIT_COMMITTER_DATE="$DATE2" git commit -m "Day commit 2 on $DATE2"

done
