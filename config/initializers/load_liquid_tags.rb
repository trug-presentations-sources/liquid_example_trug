Dir.foreach(Rails.root.join('app/tags')) do |tag_file|
  if tag_file[0] == '.'
  	next
  else
  	require tag_file
  end
end
