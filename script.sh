# Loop from Feb 1, 2026 to May 5, 2026
START="2026-02-01"
END="2026-05-05"

current=$START
while [ "$(date -d "$current" +%Y-%m-%d)" != "$(date -d "$END +1 day" +%Y-%m-%d)" ]; do
  DATE=$(date -d "$current" +"%Y-%m-%dT06:00:32")

  # FIRST COMMIT
  echo "Commit 1 for $DATE" >> progress.log
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git add .
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "Day commit 1 on $DATE"

  # SECOND COMMIT (+1 minute)
  DATE2=$(date -d "$DATE +1 minute" +"%Y-%m-%dT06:01:32")
  echo "Commit 2 for $DATE2" >> progress.log
  GIT_AUTHOR_DATE="$DATE2" GIT_COMMITTER_DATE="$DATE2" git add .
  GIT_AUTHOR_DATE="$DATE2" GIT_COMMITTER_DATE="$DATE2" git commit -m "Day commit 2 on $DATE2"

  # Move to next day
  current=$(date -d "$current +1 day" +%Y-%m-%d)
done
