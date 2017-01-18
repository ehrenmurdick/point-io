json.id @party.id
json.votes @party.votes.pluck(:points)
