import json
import os

import click


@click.command()
@click.option("--input-file", required=True, type=click.Path(exists=True))
@click.option("--chunk-size", required=True, type=int)
def main(
    input_file: str,
    chunk_size: int = 400,
) -> None:

    # Output directory
    output_dir = 'split_json'
    os.makedirs(output_dir, exist_ok=True)

    with open(input_file, 'r') as f:
        data = json.load(f)
    keys = list(data.keys())

    # Split and write to files
    for i in range(0, len(keys), chunk_size):
        chunk_keys = keys[i:i + chunk_size]
        chunk_data = {k: data[k] for k in chunk_keys}

        output_path = os.path.join(output_dir, f'split_{i // chunk_size + 1}.json')
        with open(output_path, 'w') as out_file:
            json.dump(chunk_data, out_file, indent=2)

    print("Splitting complete.")


if __name__ == "__main__":
    main()