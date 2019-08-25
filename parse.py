import json
import os


def load():
    """
    This method creates and loads data from a json file.

    :return: A new data structure populated with the json file data as a dictionary.
    """

    data = []

    filename = get_full_pathname()

    if os.path.exists(filename):
        with open(filename, "r") as file_read:
            data = json.load(file_read)

    return data


def get_full_pathname():
    """
    This method creates an absolute file path to the image json file.

    :return: absolute file path to the image json file.
    """

    filename = os.path.abspath(os.path.join('.', 'image' + '.json'))

    return filename


def get_last_image_tag_id():
    """
    This method gets the image id number of the last image.

    :return: docker image id number.
    """

    data = load()  # Dictionary of parsed docker image json data

    for key in data:

        key_values = key.get('Id')

        key_value = key_values.split(':')

        return key_value[1][:12]


def main():
    print(get_last_image_tag_id())


if __name__ == "__main__":
    main()
