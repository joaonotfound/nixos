
current_time=$(date +"%d-%m-%Y")

output_filename="backup-dotfiles-${current_time}.tar"

pushd ./stow/
tar -czvf "../$output_filename" *
popd

echo "Created $output_filename"
