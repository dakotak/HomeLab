hosts=(pve1 pve2 pve3)

for h in ${hosts[@]}; do
  ip=$(dig +short $h.lablab.us)
  echo "host=$h ip=$ip"
  ssh-keygen -R $h
  ssh-keygen -R $ip
  ssh-keygen -R $h,$ip
  ssh-keyscan -H $h,$ip >> ~/.ssh/known_hosts
  ssh-keyscan -H $ip >> ~/.ssh/known_hosts
  ssh-keyscan -H $h >> ~/.ssh/known_hosts
done

