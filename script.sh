# Array of specific dates
for DATE in "2026-03-22T06:00:32" "2026-04-14T06:00:32" "2026-04-18T06:00:32"
do
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
