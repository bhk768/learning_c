for d in $(seq 0 15); do
  DATE=$(date -d "2026-03-01 +$d day" +"%Y-%m-%dT06:00:32")

  # FIRST COMMIT
  echo "Commit 1 for $DATE" >> progress.log
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git add .
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "Day commit 1 on $DATE"

  # SECOND COMMIT (same date, different time)
  DATE2=$(date -d "$DATE +1 minute" +"%Y-%m-%dT06:01:32")
  echo "Commit 2 for $DATE2" >> progress.log
  GIT_AUTHOR_DATE="$DATE2" GIT_COMMITTER_DATE="$DATE2" git add .
  GIT_AUTHOR_DATE="$DATE2" GIT_COMMITTER_DATE="$DATE2" git commit -m "Day commit 2 on $DATE2"

done && git push
